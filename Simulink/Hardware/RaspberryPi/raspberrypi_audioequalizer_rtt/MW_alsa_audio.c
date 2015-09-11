/* Copyright 2010-2012 The MathWorks, Inc. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#define ALSA_PCM_NEW_HW_PARAMS_API
#include <alsa/asoundlib.h>
#include <sys/time.h>
#include <sys/signal.h>
#include "MW_alsa_audio.h"

/* #define _DEBUG                   (1)*/
#define NUM_BYTES_PER_SAMPLE     (2)
#define USEC_FACTOR              (1000000u)
#define MAX_DEVICE_NAME          (80)
#define MAX_NUM_CHANNELS         (2)
#define GET_CHUNK_SIZE(count, periodSize) ((count) > (periodSize) ? (periodSize):(count))


typedef struct {
    char device[MAX_DEVICE_NAME];
    int type;        /* Capture or playback */
    int rate;
    int resample;
    int channels;
    unsigned int queueDuration;
    short *buf;
    snd_pcm_t *handle;
    snd_pcm_access_t access;
    snd_pcm_format_t format;
    snd_pcm_uframes_t periodSize;
    snd_pcm_uframes_t bufferSize;
    uint32_T frameSize;
    snd_pcm_uframes_t startThreshold;
#ifdef _DEBUG
    snd_output_t *output;
#endif
} audioDeviceParams_t;
static int numAudioDevices = 0;
static audioDeviceParams_t *audioDevices = NULL;


/* Sets ALSA software parameters */
static int set_swparams(audioDeviceParams_t *devPtr)
{
    int err;
    snd_pcm_sw_params_t *swparams;
    
    if ((err = snd_pcm_sw_params_malloc(&swparams)) < 0) {
        fprintf(stderr, "snd_pcm_sw_params_malloc: %s\n",
                snd_strerror (err));
        return err;
    }
    
    /* get the current swparams */
    err = snd_pcm_sw_params_current(devPtr->handle, swparams);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_sw_params_current: %s\n",
                snd_strerror(err));
        return err;
    }
    
    /* PLAYBACK: start the transfer when the buffer is almost full */
    /* CAPTURE : start the transfer when there is one sample captured */
    err = snd_pcm_sw_params_set_start_threshold(devPtr->handle, swparams, devPtr->startThreshold);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_sw_params_set_start_threshold: %s\n",
                snd_strerror(err));
        return err;
    }
    
    /* allow the transfer when at least periodSize samples can be processed */
    err = snd_pcm_sw_params_set_avail_min(devPtr->handle, swparams, devPtr->periodSize);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_sw_params_set_avail_min: %s\n", 
                snd_strerror(err));
        return err;
    }
    
    /* write the parameters to the playback device */
    err = snd_pcm_sw_params(devPtr->handle, swparams);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_sw_params: %s\n", 
                snd_strerror(err));
        return err;
    }
    snd_pcm_sw_params_free(swparams);
    
    return 0;
}

/* Sets ALSA hardware parameters */
static int set_hwparams(audioDeviceParams_t *devPtr)
{
    unsigned int rrate;
    snd_pcm_uframes_t size, maxBufferSize;
    int err, dir;
    snd_pcm_hw_params_t *params;
    unsigned int max_queueDuration;
    unsigned int buffer_time, period_time;
    
    if ((err = snd_pcm_hw_params_malloc(&params)) < 0) {
        fprintf(stderr, "snd_pcm_hw_params_malloc: %s\n",
                snd_strerror(err));
        return err;
    }
    
    /* choose all parameters */
    err = snd_pcm_hw_params_any(devPtr->handle, params);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_any: %s\n",
                snd_strerror(err));
        return err;
    }
    
    /* set hardware resampling */
    err = snd_pcm_hw_params_set_rate_resample(devPtr->handle, params, devPtr->resample);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_set_rate_resample: %s\n", 
                snd_strerror(err));
        return err;
    }
    
    /* set interleaved/non-interleaved read/write format */
    err = snd_pcm_hw_params_set_access(devPtr->handle, params, devPtr->access);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_set_access: %s\n", 
                snd_strerror(err));
        return err;
    }
    
    /* set the sample format */
    err = snd_pcm_hw_params_set_format(devPtr->handle, params, devPtr->format);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_set_format: %s\n", 
                snd_strerror(err));
        return err;
    }
    
    /* set number of channels */
    err = snd_pcm_hw_params_set_channels(devPtr->handle, params, devPtr->channels);
    if (err < 0) {
#ifdef _DEBUG
        fprintf(stderr, "Channel count (%i) not available for playback: %s\n",
                devPtr->channels, snd_strerror(err));
        fprintf(stderr, "Reverting to mono.\n");
#endif
        devPtr->channels = 1;
        err = snd_pcm_hw_params_set_channels(devPtr->handle, params, devPtr->channels);
        if (err < 0) {
            fprintf(stderr, "Error setting number of channels to (%i): %s\n",
                    devPtr->channels, snd_strerror(err));
            return err;
        }
    }
    
    /* set the stream rate */
    rrate = devPtr->rate;
    err = snd_pcm_hw_params_set_rate_near(devPtr->handle, params, &rrate, 0);
    if (err < 0) {
        fprintf(stderr, "Sampling rate of %iHz not available for playback: %s\n", 
                devPtr->rate, snd_strerror(err));
        return err;
    }
    if (rrate != devPtr->rate) {
        fprintf(stderr, "Requested sampling rate is not available: (requested %iHz, got %iHz)\n", 
                devPtr->rate, rrate);
        return -EINVAL;
    }
    
    /* Set buffer / period sizes */
    buffer_time = 500000;
    err = snd_pcm_hw_params_set_buffer_time_near(devPtr->handle, params, &buffer_time, 0);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_set_buffer_time_near: %s\n", 
                snd_strerror(err));
        return err;
    }
    period_time = buffer_time / 4;
    snd_pcm_hw_params_set_period_time_near(devPtr->handle, params, &period_time, 0);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_set_period_time_near: %s\n", 
                snd_strerror(err));
        return err;
    }
    
    /* Get actual buffer size & period size */
    err = snd_pcm_hw_params_get_buffer_size(params, &devPtr->bufferSize);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_get_buffer_size: %s\n", 
                snd_strerror(err));
        return err;
    }
    snd_pcm_hw_params_get_period_size(params, &devPtr->periodSize, 0);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_get_period_size: %s\n", 
                snd_strerror(err));
        return err;
    }
    
    /* Write HW parameters to device */
    err = snd_pcm_hw_params(devPtr->handle, params);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params: %s\n", snd_strerror(err));
        return err;
    }
    
    /* Release resources */
    snd_pcm_hw_params_free(params);
    
    return 0;
}

/* Recover from overrun / underrun errors */
static int xrun_recovery(snd_pcm_t *handle, int err)
{
    if (err == -EPIPE) {
        err = snd_pcm_prepare(handle);
        if (err < 0) {
            fprintf(stderr, "snd_pcm_prepare (EPIPE): %s\n",
                    snd_strerror(err));
        }
    }
    else if (err == -ESTRPIPE) {
        while ((err = snd_pcm_resume(handle)) == -EAGAIN) {
            /* wait until the suspend flag is released */
        }
        if (err < 0) {
            err = snd_pcm_prepare(handle);
            if (err < 0) {
                fprintf(stderr, "snd_pcm_prepare (ESTRPIPE): %s\n",
                        snd_strerror(err));
            }
        }
    }
    return err;
}

/* Return a pointer to audio device structure for a given device name */
audioDeviceParams_t *MW_getDeviceInfo(const char *device, const int type)
{
    int i;
    audioDeviceParams_t *ptr;
    
    ptr = NULL;
    for (i = 0; i < numAudioDevices; i++) {
        if ((strncmp(audioDevices[i].device, device, MAX_DEVICE_NAME) == 0) &&
                (audioDevices[i].type == type)) {
            ptr = &audioDevices[i];
            break;
        }
    }
    
    return ptr;
}

/* Terminate function for one device */
void MW_audioTerminate(const uint8_T *device, int type)
{
    audioDeviceParams_t *devPtr;
    static int32_T numClosedAudioDevices = 0;
    
    devPtr = MW_getDeviceInfo(device, type);
    if (devPtr == NULL) {
        return;
    }
    if (devPtr->handle != NULL) {
        snd_pcm_close(devPtr->handle);
        devPtr->handle == NULL;
    }
    if (devPtr->buf != NULL) {
        free(devPtr->buf);
    }
    numClosedAudioDevices++;
    if ((numClosedAudioDevices == numAudioDevices) && !audioDevices) {
        free(audioDevices);
    }
}

/* Return resources used for audio devices in case of a fatal error */
void MW_audioExit(void)
{
    int i;
    
    for (i = 0; i < numAudioDevices; i++) {
        MW_audioTerminate(audioDevices[i].device, audioDevices[i].type);
    }
    exit(EXIT_FAILURE);
}

/* Audio initialization function */
void MW_audioInit(
        const uint8_T *device,
        uint32_T sampleRate,
        real_T queueDuration,
        uint32_T frameSize,
        int32_T type)
{
    int err;
    audioDeviceParams_t *devPtr;
    
    audioDevices = realloc(audioDevices, (numAudioDevices + 1) * sizeof(audioDeviceParams_t));
    if (audioDevices == NULL) {
        fprintf(stderr, "Error allocating memory for audio device '%s'.\n", device);
        MW_audioExit();
    }
    devPtr = audioDevices + numAudioDevices;
    
    /* Initialize hardware parameters */
    strncpy(&devPtr->device[0], device, MAX_DEVICE_NAME);
    devPtr->type          = type;
    devPtr->resample      = 1;
    devPtr->access        = SND_PCM_ACCESS_RW_INTERLEAVED;
    devPtr->format        = SND_PCM_FORMAT_S16_LE;
    devPtr->channels      = MAX_NUM_CHANNELS;
    devPtr->rate          = sampleRate;
    devPtr->queueDuration = queueDuration * USEC_FACTOR;
    devPtr->frameSize     = frameSize;
    numAudioDevices++;
    
    /* Open PCM device. The last parameter of this function is the mode. */
    if ((err = snd_pcm_open(&devPtr->handle, devPtr->device, devPtr->type, 0)) < 0) {
        fprintf(stderr, "Cannot open audio device '%s': %s\n",
                devPtr->device, snd_strerror(err));
        MW_audioExit();
    }
    
    /* Set hw parameters */
    if ((err = set_hwparams(devPtr)) < 0) {
        fprintf(stderr, "Error setting audio hardware parameters for '%s': %s\n", 
                devPtr->device, snd_strerror(err));
        MW_audioExit();
    }
    
    /* Initialize software parameters */
    if (devPtr->type == SND_PCM_STREAM_CAPTURE) {
        devPtr->startThreshold = 1;
    }
    else {
        devPtr->startThreshold = devPtr->bufferSize;
    }
    if ((err = set_swparams(devPtr)) < 0) {
        fprintf(stderr, "Error setting audio software parameters for '%s': %s\n", 
                devPtr->device, snd_strerror(err));
        MW_audioExit();
    }
    
    /* Allocate playback buffer */
    devPtr->buf = malloc(devPtr->frameSize * devPtr->channels * NUM_BYTES_PER_SAMPLE);
    if (devPtr->buf == NULL) {
        fprintf(stderr, "Cannot allocate memory for audio buffer.\n");
        MW_audioExit();
    }
    
    /* Prepare PCM device for use */
    if ((err = snd_pcm_prepare(devPtr->handle)) < 0) {
        fprintf(stderr, "snd_pcm_prepare: %s\n", snd_strerror(err));
        MW_audioExit();
    }
    
#ifdef _DEBUG
    err = snd_output_stdio_attach(&devPtr->output, stdout, 0);
    if (err < 0) {
        fprintf(stderr, "snd_output_stdio_attach: %s\n", snd_strerror(err));
    }
    snd_pcm_dump(devPtr->handle, devPtr->output);
    fflush(stdout);
#endif
}


/* Hook functions */
void audioPlaybackInit(const uint8_T *device, uint32_T sampleRate, real_T queueDuration, uint32_T frameSize)
{
    /* Use common initialization function */
    MW_audioInit(device, sampleRate, queueDuration, frameSize, SND_PCM_STREAM_PLAYBACK);
}

void audioCaptureInit(const uint8_T *device, uint32_T sampleRate, real_T queueDuration, uint32_T frameSize)
{
    /* Use common initialization function */
    MW_audioInit(device, sampleRate, queueDuration, frameSize, SND_PCM_STREAM_CAPTURE);
}


/* Terminate function for playback */
void audioCaptureTerminate(const uint8_T *device)
{
    MW_audioTerminate(device, SND_PCM_STREAM_CAPTURE);
}

/* Terminate function for capture */
void audioPlaybackTerminate(const uint8_T *device)
{
    MW_audioTerminate(device, SND_PCM_STREAM_PLAYBACK);
}


/* Move audio samples from device driver to application */
void audioCapture(const uint8_T *device, int16_T *outData, uint32_T frameSize)
{
    int ret;
    signed short *p;
    audioDeviceParams_t *devPtr;
    static int frameCounter = 0;
    snd_pcm_uframes_t count;
    
    /* Read samples from audio buffer */
    devPtr = MW_getDeviceInfo(device, SND_PCM_STREAM_CAPTURE);
    if (devPtr == NULL || devPtr->handle == NULL) {
        return;
    }
    p     = devPtr->buf;
    count = (snd_pcm_uframes_t) frameSize;
    while (count > 0) {
        ret = snd_pcm_readi(devPtr->handle, p, GET_CHUNK_SIZE(count, devPtr->periodSize));
        if (ret == -EAGAIN) {
            continue;
        }
        if(ret < 0) {
#ifdef _DEBUG
            fprintf(stderr, "[%d] Capture overrun: errno=%d (%s)\n",
                    frameCounter, ret, snd_strerror(ret));
#endif
            if (xrun_recovery(devPtr->handle, ret) < 0) {
#ifdef _DEBUG
                fprintf(stderr, "Cannot recover from overrun: %s\n",
                        snd_strerror(ret));
#endif
            }
        }
        else {
            p     += ret * devPtr->channels;
            count -= ret;
        }
    }
    
    /* De-interleave audio samples */
    if (devPtr->channels == 2) {
        int i;
        p = devPtr->buf;
        for (i = 0; i < frameSize; i++) {
            *outData               = *p++;
            *(outData + frameSize) = *p++;
            outData++;
        }
    }
    else if (devPtr->channels == 1) {
        memcpy((void *)outData, (const void *)devPtr->buf, frameSize * sizeof(signed short));
        memcpy((void *)(outData+frameSize), (const void *)devPtr->buf, frameSize * sizeof(signed short));
    }
    frameCounter++;
}

/* Move audio samples from application to device driver */
void audioPlayback(const uint8_T *device, int16_T *inData, uint32_T frameSize)
{
    int ret;
    audioDeviceParams_t *devPtr;
    signed short *ptr;
    static int frameCounter = 0;
    snd_pcm_uframes_t count;
    
    /* Interleave audio samples */
    devPtr = MW_getDeviceInfo(device, SND_PCM_STREAM_PLAYBACK);
    if (devPtr == NULL || devPtr->handle == NULL) {
        return;
    }
    if (devPtr->channels == 2) {
        int i;
        ptr = devPtr->buf;
        for (i = 0; i < frameSize; i++) {
            *ptr++ = *inData;
            *ptr++ = *(inData + frameSize);
            inData++;
        }
    }
    else if (devPtr->channels == 1) {
        memcpy((void *)devPtr->buf, (const void *)inData, frameSize * sizeof(signed short));
    }
    
    /* Write interleaved samples to PCM device */
    ptr   = devPtr->buf;
    count = (snd_pcm_uframes_t)frameSize;
    while (count > 0) {
        ret = snd_pcm_writei(devPtr->handle, ptr, GET_CHUNK_SIZE(count, devPtr->periodSize));
        if (ret == -EAGAIN) {
            continue;
        }
        if (ret < 0) {
#ifdef _DEBUG
            fprintf(stderr, "[%d] Playback underrun: errno=%d (%s)\n",
                    frameCounter, ret, snd_strerror(ret));
#endif
            if (xrun_recovery(devPtr->handle, ret) < 0) {
#ifdef _DEBUG
                fprintf(stderr, "Cannot recover from underrun: %s\n",
                        snd_strerror(ret));
#endif
            }
        }
        else {
            ptr   += ret * devPtr->channels;
            count -= ret;
        }
    }
    frameCounter++;
}

/* EOF */


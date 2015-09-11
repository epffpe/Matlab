/*
 * File: ert_main.c
 *
 * Code generated for Simulink model 'raspberrypi_motion_sensor_led'.
 *
 * Model version                  : 1.41
 * Simulink Coder version         : 8.4 (R2013a) 13-Feb-2013
 * TLC version                    : 8.4 (Jan 19 2013)
 * C/C++ source code generated on : Sat Aug 10 12:59:53 2013
 *
 * Target selection: realtime.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <pthread.h>
#include <sched.h>
#include <semaphore.h>
#include <errno.h>
#include <signal.h>
#include <time.h>
#include "raspberrypi_motion_sensor_led.h"
#include "raspberrypi_motion_sensor_led_private.h"
#include "rtwtypes.h"

typedef struct {
  int signo;
  sigset_t sigMask;
  double period;
} baseRateInfo_t;

void MW_blockSignal(int sigNo, sigset_t *sigMask);
void MW_setTaskPeriod(double periodInSeconds, int sigNo);
void MW_sigWait(sigset_t *sigMask);
void MW_exitHandler(int sig);
void MW_sem_wait(sem_t *sem);

#define CHECK_STATUS(status, fcn)      if (status != 0) {printf("Call to %s returned error status (%d).\n", fcn, status); perror(fcn); fflush(stdout); exit(EXIT_FAILURE);}

/* Semaphore(s) used for thread synchronization */
sem_t stopSem;
void baseRateTask(void *arg)
{
  baseRateInfo_t info = *((baseRateInfo_t *)arg);
  MW_setTaskPeriod(info.period, info.signo);
  while ((rtmGetErrorStatus(raspberrypi_motion_sensor_le_M) == (NULL)) &&
         !rtmGetStopRequested(raspberrypi_motion_sensor_le_M) ) {
    /* Wait for the next timer interrupt */
    MW_sigWait(&info.sigMask);

    /* External mode */
    {
      boolean_T rtmStopReq = FALSE;
      rtExtModePauseIfNeeded(raspberrypi_motion_sensor_le_M->extModeInfo, 1,
        &rtmStopReq);
      if (rtmStopReq) {
        rtmSetStopRequested(raspberrypi_motion_sensor_le_M, TRUE);
      }

      if (rtmGetStopRequested(raspberrypi_motion_sensor_le_M) == TRUE) {
        rtmSetErrorStatus(raspberrypi_motion_sensor_le_M, "Simulation finished");
        break;
      }
    }

    /* External mode */
    {
      boolean_T rtmStopReq = FALSE;
      rtExtModeOneStep(raspberrypi_motion_sensor_le_M->extModeInfo, 1,
                       &rtmStopReq);
      if (rtmStopReq) {
        rtmSetStopRequested(raspberrypi_motion_sensor_le_M, TRUE);
      }
    }

    raspberrypi_motion_sensor_led_output();

    /* Get model outputs here */

    /* External mode */
    rtExtModeUploadCheckTrigger(1);

    {                                  /* Sample time: [0.1s, 0.0s] */
      rtExtModeUpload(0, raspberrypi_motion_sensor_le_M->Timing.taskTime0);
    }

    raspberrypi_motion_sensor_led_update();
    rtExtModeCheckEndTrigger();
  }                                    /* while */

  sem_post(&stopSem);
}

void MW_sem_wait(sem_t *sem)
{
  int status;
  while (((status = sem_wait(sem)) == -1) && (errno == EINTR)) {
    /* Restart if interrupted by a signal */
    continue;
  }

  CHECK_STATUS(status, "sem_wait");
}

void MW_exitHandler(int sig)
{
  sem_post(&stopSem);
}

void MW_blockSignal(int sigNo, sigset_t *sigMask)
{
  int ret;
  sigaddset(sigMask, sigNo);
  ret = pthread_sigmask(SIG_BLOCK, sigMask, NULL);
  CHECK_STATUS(ret, "pthread_sigmask");
}

void MW_setTaskPeriod(double periodInSeconds, int sigNo)
{
  timer_t timerId;
  struct sigevent sev;
  struct itimerspec its;
  long stNanoSec;
  int ret;

  /* Create a timer */
  sev.sigev_notify = SIGEV_SIGNAL;
  sev.sigev_signo = sigNo;
  sev.sigev_value.sival_ptr = &timerId;
  ret = timer_create(CLOCK_REALTIME, &sev, &timerId);
  CHECK_STATUS(ret, "timer_create");

  /* Arm real-time scheduling timer */
  stNanoSec = (long)(periodInSeconds * 1e9);
  its.it_value.tv_sec = stNanoSec / 1000000000;
  its.it_value.tv_nsec = stNanoSec % 1000000000;
  its.it_interval.tv_sec = its.it_value.tv_sec;
  its.it_interval.tv_nsec = its.it_value.tv_nsec;
  ret = timer_settime(timerId, 0, &its, NULL);
  CHECK_STATUS(ret, "timer_settime");
}

void MW_sigWait(sigset_t *sigMask)
{
  int ret;
  ret = sigwaitinfo(sigMask, NULL);
  if (ret == -1) {
    printf("Call to sigwaitinfo returned error.\n");
    perror("sigwaitinfo");
    fflush(stdout);
    exit(EXIT_FAILURE);
  }
}

int main(int argc, char **argv)
{
  int ret;
  baseRateInfo_t info;
  pthread_attr_t attr;
  pthread_t baseRateThread;
  size_t stackSize;
  unsigned long cpuMask = 0x1;
  unsigned int len = sizeof(cpuMask);
  printf("**starting the model**\n");
  fflush(stdout);
  rtmSetErrorStatus(raspberrypi_motion_sensor_le_M, 0);
  rtExtModeParseArgs(argc, (const char_T **)argv, NULL);

  /* All threads created by this process must run on a single CPU */
  ret = sched_setaffinity(0, len, (cpu_set_t *) &cpuMask);
  CHECK_STATUS(ret, "sched_setaffinity");

  /* Initialize semaphore used for thread synchronization */
  ret = sem_init(&stopSem, 0, 0);
  CHECK_STATUS(ret, "sem_init:stopSem");

  /* Create threads executing the Simulink model */
  pthread_attr_init(&attr);
  ret = pthread_attr_setinheritsched(&attr, PTHREAD_EXPLICIT_SCHED);
  CHECK_STATUS(ret, "pthread_attr_setinheritsched");
  ret = pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
  CHECK_STATUS(ret, "pthread_attr_setdetachstate");

  /* PTHREAD_STACK_MIN is the minimum stack size required to start a thread */
  stackSize = 64000 + PTHREAD_STACK_MIN;
  ret = pthread_attr_setstacksize(&attr, stackSize);
  CHECK_STATUS(ret, "pthread_attr_setstacksize");

  /* Block signal used for timer notification */
  info.period = 0.1;
  info.signo = SIGRTMIN;
  sigemptyset(&info.sigMask);
  MW_blockSignal(info.signo, &info.sigMask);
  signal(SIGTERM, MW_exitHandler);     /* kill */
  signal(SIGHUP, MW_exitHandler);      /* kill -HUP */
  signal(SIGINT, MW_exitHandler);      /* Interrupt from keyboard */
  signal(SIGQUIT, MW_exitHandler);     /* Quit from keyboard */
  raspberrypi_motion_sensor_led_initialize();

  /* External mode */
  rtSetTFinalForExtMode(&rtmGetTFinal(raspberrypi_motion_sensor_le_M));
  rtExtModeCheckInit(1);

  {
    boolean_T rtmStopReq = FALSE;
    rtExtModeWaitForStartPkt(raspberrypi_motion_sensor_le_M->extModeInfo, 1,
      &rtmStopReq);
    if (rtmStopReq) {
      rtmSetStopRequested(raspberrypi_motion_sensor_le_M, TRUE);
    }
  }

  rtERTExtModeStartMsg();

  /* Create base rate task */
  ret = pthread_create(&baseRateThread, &attr, (void *) baseRateTask, (void *)
                       &info);
  CHECK_STATUS(ret, "pthread_create");
  pthread_attr_destroy(&attr);

  /* Wait for a stopping condition. */
  MW_sem_wait(&stopSem);

  /* Received stop signal */
  printf("**stopping the model**\n");
  if (rtmGetErrorStatus(raspberrypi_motion_sensor_le_M) != NULL) {
    printf("\n**%s**\n", rtmGetErrorStatus(raspberrypi_motion_sensor_le_M));
  }

  /* External mode shutdown */
  rtExtModeShutdown(1);

  /* Disable rt_OneStep() here */

  /* Terminate model */
  raspberrypi_motion_sensor_led_terminate();
  return 0;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

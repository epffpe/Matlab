/*
 * File: beagleboard_communication.c
 *
 * Code generated for Simulink model 'beagleboard_communication'.
 *
 * Model version                  : 1.34
 * Simulink Coder version         : 8.4 (R2013a) 13-Feb-2013
 * TLC version                    : 8.4 (Jan 19 2013)
 * C/C++ source code generated on : Fri Aug 02 23:09:49 2013
 *
 * Target selection: realtime.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "beagleboard_communication.h"
#include "beagleboard_communication_private.h"

/* Block signals (auto storage) */
BlockIO_beagleboard_communicati beagleboard_communication_B;

/* Block states (auto storage) */
D_Work_beagleboard_communicatio beagleboard_communication_DWork;

/* Real-time model */
RT_MODEL_beagleboard_communicat beagleboard_communication_M_;
RT_MODEL_beagleboard_communicat *const beagleboard_communication_M =
  &beagleboard_communication_M_;

/* Model output function */
void beagleboard_communication_output(void)
{
  /* Sin: '<Root>/Sine Wave' */
  beagleboard_communication_B.sine_wave = sin(((real_T)
    beagleboard_communication_DWork.counter +
    beagleboard_communication_P.SineWave_Offset) * 2.0 * 3.1415926535897931 /
    beagleboard_communication_P.SineWave_NumSamp) *
    beagleboard_communication_P.SineWave_Amp +
    beagleboard_communication_P.SineWave_Bias;
}

/* Model update function */
void beagleboard_communication_update(void)
{
  char_T *sErr;

  /* Update for Sin: '<Root>/Sine Wave' */
  beagleboard_communication_DWork.counter++;
  if (beagleboard_communication_DWork.counter ==
      beagleboard_communication_P.SineWave_NumSamp) {
    beagleboard_communication_DWork.counter = 0;
  }

  /* End of Update for Sin: '<Root>/Sine Wave' */

  /* Update for S-Function (sdspToNetwork): '<Root>/UDP Send' */
  sErr = GetErrorBuffer(&beagleboard_communication_DWork.UDPSend_NetworkLib[0U]);
  LibUpdate_Network(&beagleboard_communication_DWork.UDPSend_NetworkLib[0U],
                    &beagleboard_communication_B.sine_wave, 1);
  if (*sErr != 0) {
    rtmSetErrorStatus(beagleboard_communication_M, sErr);
    rtmSetStopRequested(beagleboard_communication_M, 1);
  }

  /* End of Update for S-Function (sdspToNetwork): '<Root>/UDP Send' */
}

/* Model initialize function */
void beagleboard_communication_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)beagleboard_communication_M, 0,
                sizeof(RT_MODEL_beagleboard_communicat));

  /* block I/O */
  (void) memset(((void *) &beagleboard_communication_B), 0,
                sizeof(BlockIO_beagleboard_communicati));

  /* states (dwork) */
  (void) memset((void *)&beagleboard_communication_DWork, 0,
                sizeof(D_Work_beagleboard_communicatio));

  {
    char_T *sErr;

    /* Start for S-Function (sdspToNetwork): '<Root>/UDP Send' */
    sErr = GetErrorBuffer(&beagleboard_communication_DWork.UDPSend_NetworkLib[0U]);
    CreateUDPInterface(&beagleboard_communication_DWork.UDPSend_NetworkLib[0U]);
    if (*sErr == 0) {
      LibCreate_Network(&beagleboard_communication_DWork.UDPSend_NetworkLib[0U],
                        1, "255.255.255.255", -1, "192.168.1.35", 25000, 8192, 8,
                        0);
    }

    if (*sErr == 0) {
      LibStart(&beagleboard_communication_DWork.UDPSend_NetworkLib[0U]);
    }

    if (*sErr != 0) {
      DestroyUDPInterface(&beagleboard_communication_DWork.UDPSend_NetworkLib[0U]);
      if (*sErr != 0) {
        rtmSetErrorStatus(beagleboard_communication_M, sErr);
        rtmSetStopRequested(beagleboard_communication_M, 1);
      }
    }

    /* End of Start for S-Function (sdspToNetwork): '<Root>/UDP Send' */
  }
}

/* Model terminate function */
void beagleboard_communication_terminate(void)
{
  char_T *sErr;

  /* Terminate for S-Function (sdspToNetwork): '<Root>/UDP Send' */
  sErr = GetErrorBuffer(&beagleboard_communication_DWork.UDPSend_NetworkLib[0U]);
  LibTerminate(&beagleboard_communication_DWork.UDPSend_NetworkLib[0U]);
  if (*sErr != 0) {
    rtmSetErrorStatus(beagleboard_communication_M, sErr);
    rtmSetStopRequested(beagleboard_communication_M, 1);
  }

  LibDestroy(&beagleboard_communication_DWork.UDPSend_NetworkLib[0U], 1);
  DestroyUDPInterface(&beagleboard_communication_DWork.UDPSend_NetworkLib[0U]);

  /* End of Terminate for S-Function (sdspToNetwork): '<Root>/UDP Send' */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

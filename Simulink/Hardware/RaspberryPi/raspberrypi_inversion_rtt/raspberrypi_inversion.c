/*
 * File: raspberrypi_inversion.c
 *
 * Code generated for Simulink model 'raspberrypi_inversion'.
 *
 * Model version                  : 1.62
 * Simulink Coder version         : 8.4 (R2013a) 13-Feb-2013
 * TLC version                    : 8.4 (Jan 19 2013)
 * C/C++ source code generated on : Sat Aug 10 13:16:07 2013
 *
 * Target selection: realtime.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "raspberrypi_inversion.h"
#include "raspberrypi_inversion_private.h"
#include "raspberrypi_inversion_dt.h"

/* Block signals (auto storage) */
BlockIO_raspberrypi_inversion raspberrypi_inversion_B;

/* Real-time model */
RT_MODEL_raspberrypi_inversion raspberrypi_inversion_M_;
RT_MODEL_raspberrypi_inversion *const raspberrypi_inversion_M =
  &raspberrypi_inversion_M_;

/* Model output function */
void raspberrypi_inversion_output(void)
{
  int32_T i;

  /* S-Function (v4l2_video_capture_sfcn): '<Root>/V4L2 Video Capture' */
  MW_videoCaptureOutput(raspberrypi_inversion_ConstP.V4L2VideoCapture_p1,
                        raspberrypi_inversion_B.V4L2VideoCapture_o1,
                        raspberrypi_inversion_B.V4L2VideoCapture_o2,
                        raspberrypi_inversion_B.V4L2VideoCapture_o3);

  /* Sum: '<S1>/Add' incorporates:
   *  Constant: '<S1>/Constant'
   */
  for (i = 0; i < 76800; i++) {
    raspberrypi_inversion_B.Add[i] = (uint8_T)
      (raspberrypi_inversion_P.Constant_Value -
       raspberrypi_inversion_B.V4L2VideoCapture_o1[i]);
  }

  /* End of Sum: '<S1>/Add' */

  /* Constant: '<S1>/Set Cb and Cr to black' */
  memcpy(&raspberrypi_inversion_B.SetCbandCrtoblack[0],
         &raspberrypi_inversion_P.SetCbandCrtoblack_Value[0], 38400U * sizeof
         (uint8_T));

  /* S-Function (sdl_video_display_sfcn): '<Root>/SDL Video Display' */
  MW_SDL_videoDisplayOutput(raspberrypi_inversion_B.Add,
    raspberrypi_inversion_B.SetCbandCrtoblack,
    raspberrypi_inversion_B.SetCbandCrtoblack);
}

/* Model update function */
void raspberrypi_inversion_update(void)
{
  /* signal main to stop simulation */
  {                                    /* Sample time: [0.1s, 0.0s] */
    if ((rtmGetTFinal(raspberrypi_inversion_M)!=-1) &&
        !((rtmGetTFinal(raspberrypi_inversion_M)-
           raspberrypi_inversion_M->Timing.taskTime0) >
          raspberrypi_inversion_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(raspberrypi_inversion_M, "Simulation finished");
    }

    if (rtmGetStopRequested(raspberrypi_inversion_M)) {
      rtmSetErrorStatus(raspberrypi_inversion_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++raspberrypi_inversion_M->Timing.clockTick0)) {
    ++raspberrypi_inversion_M->Timing.clockTickH0;
  }

  raspberrypi_inversion_M->Timing.taskTime0 =
    raspberrypi_inversion_M->Timing.clockTick0 *
    raspberrypi_inversion_M->Timing.stepSize0 +
    raspberrypi_inversion_M->Timing.clockTickH0 *
    raspberrypi_inversion_M->Timing.stepSize0 * 4294967296.0;
}

/* Model initialize function */
void raspberrypi_inversion_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)raspberrypi_inversion_M, 0,
                sizeof(RT_MODEL_raspberrypi_inversion));
  rtmSetTFinal(raspberrypi_inversion_M, -1);
  raspberrypi_inversion_M->Timing.stepSize0 = 0.1;

  /* External mode info */
  raspberrypi_inversion_M->Sizes.checksums[0] = (740112561U);
  raspberrypi_inversion_M->Sizes.checksums[1] = (3942910966U);
  raspberrypi_inversion_M->Sizes.checksums[2] = (1417189011U);
  raspberrypi_inversion_M->Sizes.checksums[3] = (2756225557U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    raspberrypi_inversion_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(raspberrypi_inversion_M->extModeInfo,
      &raspberrypi_inversion_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(raspberrypi_inversion_M->extModeInfo,
                        raspberrypi_inversion_M->Sizes.checksums);
    rteiSetTPtr(raspberrypi_inversion_M->extModeInfo, rtmGetTPtr
                (raspberrypi_inversion_M));
  }

  /* block I/O */
  (void) memset(((void *) &raspberrypi_inversion_B), 0,
                sizeof(BlockIO_raspberrypi_inversion));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    raspberrypi_inversion_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.B = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.P = &rtPTransTable;
  }

  /* Start for S-Function (v4l2_video_capture_sfcn): '<Root>/V4L2 Video Capture' */
  MW_videoCaptureInit(raspberrypi_inversion_ConstP.V4L2VideoCapture_p1, 0, 0, 0,
                      0, 320U, 240U, 1U, 2U, 1U);

  /* Start for Constant: '<S1>/Set Cb and Cr to black' */
  memcpy(&raspberrypi_inversion_B.SetCbandCrtoblack[0],
         &raspberrypi_inversion_P.SetCbandCrtoblack_Value[0], 38400U * sizeof
         (uint8_T));

  /* Start for S-Function (sdl_video_display_sfcn): '<Root>/SDL Video Display' */
  MW_SDL_videoDisplayInit(2, 1, 1, 320, 240);
}

/* Model terminate function */
void raspberrypi_inversion_terminate(void)
{
  /* Terminate for S-Function (v4l2_video_capture_sfcn): '<Root>/V4L2 Video Capture' */
  MW_videoCaptureTerminate(raspberrypi_inversion_ConstP.V4L2VideoCapture_p1);

  /* Terminate for S-Function (sdl_video_display_sfcn): '<Root>/SDL Video Display' */
  MW_SDL_videoDisplayTerminate(320, 240);
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

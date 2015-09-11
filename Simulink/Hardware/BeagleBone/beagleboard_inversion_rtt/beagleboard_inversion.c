/*
 * File: beagleboard_inversion.c
 *
 * Code generated for Simulink model 'beagleboard_inversion'.
 *
 * Model version                  : 1.54
 * Simulink Coder version         : 8.4 (R2013a) 13-Feb-2013
 * TLC version                    : 8.4 (Jan 19 2013)
 * C/C++ source code generated on : Fri Aug 09 10:25:59 2013
 *
 * Target selection: realtime.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "beagleboard_inversion.h"
#include "beagleboard_inversion_private.h"
#include "beagleboard_inversion_dt.h"

/* Block signals (auto storage) */
BlockIO_beagleboard_inversion beagleboard_inversion_B;

/* Real-time model */
RT_MODEL_beagleboard_inversion beagleboard_inversion_M_;
RT_MODEL_beagleboard_inversion *const beagleboard_inversion_M =
  &beagleboard_inversion_M_;

/* Model output function */
void beagleboard_inversion_output(void)
{
  int32_T i;

  /* S-Function (v4l2_video_capture_sfcn): '<Root>/V4L2 Video Capture' */
  MW_videoCaptureOutput(beagleboard_inversion_ConstP.V4L2VideoCapture_p1,
                        beagleboard_inversion_B.V4L2VideoCapture_o1,
                        beagleboard_inversion_B.V4L2VideoCapture_o2,
                        beagleboard_inversion_B.V4L2VideoCapture_o3);

  /* Sum: '<S1>/Add' incorporates:
   *  Constant: '<S1>/Constant'
   */
  for (i = 0; i < 76800; i++) {
    beagleboard_inversion_B.Add[i] = (uint8_T)
      (beagleboard_inversion_P.Constant_Value -
       beagleboard_inversion_B.V4L2VideoCapture_o1[i]);
  }

  /* End of Sum: '<S1>/Add' */

  /* Constant: '<S1>/Set Cb and Cr to black' */
  memcpy(&beagleboard_inversion_B.SetCbandCrtoblack[0],
         &beagleboard_inversion_P.SetCbandCrtoblack_Value[0], 38400U * sizeof
         (uint8_T));

  /* S-Function (sdl_video_display_sfcn): '<Root>/SDL Video Display' */
  MW_SDL_videoDisplayOutput(beagleboard_inversion_B.Add,
    beagleboard_inversion_B.SetCbandCrtoblack,
    beagleboard_inversion_B.SetCbandCrtoblack);
}

/* Model update function */
void beagleboard_inversion_update(void)
{
  /* signal main to stop simulation */
  {                                    /* Sample time: [0.1s, 0.0s] */
    if ((rtmGetTFinal(beagleboard_inversion_M)!=-1) &&
        !((rtmGetTFinal(beagleboard_inversion_M)-
           beagleboard_inversion_M->Timing.taskTime0) >
          beagleboard_inversion_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(beagleboard_inversion_M, "Simulation finished");
    }

    if (rtmGetStopRequested(beagleboard_inversion_M)) {
      rtmSetErrorStatus(beagleboard_inversion_M, "Simulation finished");
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
  if (!(++beagleboard_inversion_M->Timing.clockTick0)) {
    ++beagleboard_inversion_M->Timing.clockTickH0;
  }

  beagleboard_inversion_M->Timing.taskTime0 =
    beagleboard_inversion_M->Timing.clockTick0 *
    beagleboard_inversion_M->Timing.stepSize0 +
    beagleboard_inversion_M->Timing.clockTickH0 *
    beagleboard_inversion_M->Timing.stepSize0 * 4294967296.0;
}

/* Model initialize function */
void beagleboard_inversion_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)beagleboard_inversion_M, 0,
                sizeof(RT_MODEL_beagleboard_inversion));
  rtmSetTFinal(beagleboard_inversion_M, -1);
  beagleboard_inversion_M->Timing.stepSize0 = 0.1;

  /* External mode info */
  beagleboard_inversion_M->Sizes.checksums[0] = (1839942829U);
  beagleboard_inversion_M->Sizes.checksums[1] = (1752676500U);
  beagleboard_inversion_M->Sizes.checksums[2] = (162721755U);
  beagleboard_inversion_M->Sizes.checksums[3] = (1357041040U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    beagleboard_inversion_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(beagleboard_inversion_M->extModeInfo,
      &beagleboard_inversion_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(beagleboard_inversion_M->extModeInfo,
                        beagleboard_inversion_M->Sizes.checksums);
    rteiSetTPtr(beagleboard_inversion_M->extModeInfo, rtmGetTPtr
                (beagleboard_inversion_M));
  }

  /* block I/O */
  (void) memset(((void *) &beagleboard_inversion_B), 0,
                sizeof(BlockIO_beagleboard_inversion));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    beagleboard_inversion_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.B = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.P = &rtPTransTable;
  }

  /* Start for S-Function (v4l2_video_capture_sfcn): '<Root>/V4L2 Video Capture' */
  MW_videoCaptureInit(beagleboard_inversion_ConstP.V4L2VideoCapture_p1, 0, 0, 0,
                      0, 320U, 240U, 1U, 2U, 1U);

  /* Start for Constant: '<S1>/Set Cb and Cr to black' */
  memcpy(&beagleboard_inversion_B.SetCbandCrtoblack[0],
         &beagleboard_inversion_P.SetCbandCrtoblack_Value[0], 38400U * sizeof
         (uint8_T));

  /* Start for S-Function (sdl_video_display_sfcn): '<Root>/SDL Video Display' */
  MW_SDL_videoDisplayInit(2, 1, 1, 320, 240);
}

/* Model terminate function */
void beagleboard_inversion_terminate(void)
{
  /* Terminate for S-Function (v4l2_video_capture_sfcn): '<Root>/V4L2 Video Capture' */
  MW_videoCaptureTerminate(beagleboard_inversion_ConstP.V4L2VideoCapture_p1);

  /* Terminate for S-Function (sdl_video_display_sfcn): '<Root>/SDL Video Display' */
  MW_SDL_videoDisplayTerminate(320, 240);
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

/*
 * File: Tutorial1.c
 *
 * Code generated for Simulink model 'Tutorial1'.
 *
 * Model version                  : 1.3
 * Simulink Coder version         : 8.4 (R2013a) 13-Feb-2013
 * TLC version                    : 8.4 (Jan 19 2013)
 * C/C++ source code generated on : Fri Aug 09 10:39:09 2013
 *
 * Target selection: realtime.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "Tutorial1.h"
#include "Tutorial1_private.h"
#include "Tutorial1_dt.h"

/* Block signals (auto storage) */
B_Tutorial1_T Tutorial1_B;

/* Block states (auto storage) */
DW_Tutorial1_T Tutorial1_DW;

/* Real-time model */
RT_MODEL_Tutorial1_T Tutorial1_M_;
RT_MODEL_Tutorial1_T *const Tutorial1_M = &Tutorial1_M_;

/* Model output function */
void Tutorial1_output(void)
{
  /* Gain: '<S1>/Slider Gain' incorporates:
   *  Sin: '<Root>/Sine Wave'
   */
  Tutorial1_B.SliderGain = (sin(((real_T)Tutorial1_DW.counter +
    Tutorial1_P.SineWave_Offset) * 2.0 * 3.1415926535897931 /
    Tutorial1_P.SineWave_NumSamp) * Tutorial1_P.SineWave_Amp +
    Tutorial1_P.SineWave_Bias) * Tutorial1_P.SliderGain_Gain;
}

/* Model update function */
void Tutorial1_update(void)
{
  /* Update for Sin: '<Root>/Sine Wave' */
  Tutorial1_DW.counter++;
  if (Tutorial1_DW.counter == Tutorial1_P.SineWave_NumSamp) {
    Tutorial1_DW.counter = 0;
  }

  /* End of Update for Sin: '<Root>/Sine Wave' */

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.01s, 0.0s] */
    if ((rtmGetTFinal(Tutorial1_M)!=-1) &&
        !((rtmGetTFinal(Tutorial1_M)-Tutorial1_M->Timing.taskTime0) >
          Tutorial1_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(Tutorial1_M, "Simulation finished");
    }

    if (rtmGetStopRequested(Tutorial1_M)) {
      rtmSetErrorStatus(Tutorial1_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   */
  Tutorial1_M->Timing.taskTime0 =
    (++Tutorial1_M->Timing.clockTick0) * Tutorial1_M->Timing.stepSize0;
}

/* Model initialize function */
void Tutorial1_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)Tutorial1_M, 0,
                sizeof(RT_MODEL_Tutorial1_T));
  rtmSetTFinal(Tutorial1_M, -1);
  Tutorial1_M->Timing.stepSize0 = 0.01;

  /* External mode info */
  Tutorial1_M->Sizes.checksums[0] = (1786692360U);
  Tutorial1_M->Sizes.checksums[1] = (337805221U);
  Tutorial1_M->Sizes.checksums[2] = (416123032U);
  Tutorial1_M->Sizes.checksums[3] = (4216919621U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    Tutorial1_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(Tutorial1_M->extModeInfo,
      &Tutorial1_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(Tutorial1_M->extModeInfo, Tutorial1_M->Sizes.checksums);
    rteiSetTPtr(Tutorial1_M->extModeInfo, rtmGetTPtr(Tutorial1_M));
  }

  /* block I/O */
  (void) memset(((void *) &Tutorial1_B), 0,
                sizeof(B_Tutorial1_T));

  /* states (dwork) */
  (void) memset((void *)&Tutorial1_DW, 0,
                sizeof(DW_Tutorial1_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    Tutorial1_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.B = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.P = &rtPTransTable;
  }
}

/* Model terminate function */
void Tutorial1_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

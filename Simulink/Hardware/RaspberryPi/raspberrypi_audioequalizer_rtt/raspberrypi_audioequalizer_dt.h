/*
 * raspberrypi_audioequalizer_dt.h
 *
 * Code generation for model "raspberrypi_audioequalizer".
 *
 * Model version              : 1.455
 * Simulink Coder version : 8.4 (R2013a) 13-Feb-2013
 * C source code generated on : Sat Aug 10 13:35:48 2013
 *
 * Target selection: realtime.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(pointer_T),
  sizeof(action_T),
  2*sizeof(uint32_T)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&raspberrypi_audioequalizer_B.Gain[0]), 1, 0, 13230 },

  { (char_T *)(&raspberrypi_audioequalizer_B.Add[0]), 1, 0, 4425 }
  ,

  { (char_T *)(&raspberrypi_audioequalize_DWork.FromWorkspace_PWORK.TimePtr), 11,
    0, 1 },

  { (char_T *)(&raspberrypi_audioequalize_DWork.UnitDelay_DSTATE[0]), 1, 0, 23 },

  { (char_T *)(&raspberrypi_audioequalize_DWork.FromWorkspace_IWORK.PrevIndex),
    10, 0, 1 }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  5U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&raspberrypi_audioequalizer_P.b0_Gain), 1, 0, 37 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  1U,
  rtPTransitions
};

/* [EOF] raspberrypi_audioequalizer_dt.h */

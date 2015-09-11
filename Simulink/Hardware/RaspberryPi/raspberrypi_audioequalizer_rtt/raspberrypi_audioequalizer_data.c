/*
 * File: raspberrypi_audioequalizer_data.c
 *
 * Code generated for Simulink model 'raspberrypi_audioequalizer'.
 *
 * Model version                  : 1.455
 * Simulink Coder version         : 8.4 (R2013a) 13-Feb-2013
 * TLC version                    : 8.4 (Jan 19 2013)
 * C/C++ source code generated on : Sat Aug 10 13:35:48 2013
 *
 * Target selection: realtime.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "raspberrypi_audioequalizer.h"
#include "raspberrypi_audioequalizer_private.h"

/* Block parameters (auto storage) */
Parameters_raspberrypi_audioequ raspberrypi_audioequalizer_P = {
  0.2F,                                /* Computed Parameter: b0_Gain
                                        * Referenced by: '<S8>/b0'
                                        */

  /*  Computed Parameter: UnitDelay_InitialCondition
   * Referenced by: '<S8>/Unit Delay'
   */
  { 1.11763632F, -1.68922007F, 0.580065072F, -1.68922007F, 0.697701454F },
  0.8F,                                /* Computed Parameter: a1_Gain
                                        * Referenced by: '<S8>/a1'
                                        */
  0.2F,                                /* Computed Parameter: b0_Gain_o
                                        * Referenced by: '<S10>/b0'
                                        */

  /*  Computed Parameter: UnitDelay_InitialCondition_j
   * Referenced by: '<S10>/Unit Delay'
   */
  { 1.06828189F, -1.63569796F, 0.600684285F, -1.63569796F, 0.668966174F },
  0.8F,                                /* Computed Parameter: a1_Gain_n
                                        * Referenced by: '<S10>/a1'
                                        */
  0.2F,                                /* Computed Parameter: b0_Gain_a
                                        * Referenced by: '<S12>/b0'
                                        */

  /*  Computed Parameter: UnitDelay_InitialCondition_g
   * Referenced by: '<S12>/Unit Delay'
   */
  { 0.894745409F, -1.45116627F, 0.624265134F, -1.45116627F, 0.519010544F },
  0.8F,                                /* Computed Parameter: a1_Gain_o
                                        * Referenced by: '<S12>/a1'
                                        */

  /*  Computed Parameter: CoeffsforBand1_Value
   * Referenced by: '<S1>/Coeffs for Band1'
   */
  { 1.11763632F, -1.68922007F, 0.580065072F, -1.68922007F, 0.697701454F },

  /*  Computed Parameter: CoeffsforBand2_Value
   * Referenced by: '<S1>/Coeffs for Band2'
   */
  { 1.06828189F, -1.63569796F, 0.600684285F, -1.63569796F, 0.668966174F },

  /*  Computed Parameter: CoeffsforBand3_Value
   * Referenced by: '<S1>/Coeffs for Band3'
   */
  { 0.894745409F, -1.45116627F, 0.624265134F, -1.45116627F, 0.519010544F },
  0.5F                                 /* Computed Parameter: Gain_Gain
                                        * Referenced by: '<S3>/Gain'
                                        */
};

/* Constant parameters (auto storage) */
const ConstParam_raspberrypi_audioequ raspberrypi_audioequaliz_ConstP = {
  /* Expression: queueDuration
   * Referenced by: '<Root>/ALSA Audio Playback'
   */
  0.5,

  /* Computed Parameter: ALSAAudioPlayback_p2
   * Referenced by: '<Root>/ALSA Audio Playback'
   */
  44100U,

  /* Expression: device
   * Referenced by: '<Root>/ALSA Audio Playback'
   */
  { 100U, 101U, 102U, 97U, 117U, 108U, 116U, 0U }
};

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

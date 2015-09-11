/*
 * File: raspberrypi_audioequalizer.h
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

#ifndef RTW_HEADER_raspberrypi_audioequalizer_h_
#define RTW_HEADER_raspberrypi_audioequalizer_h_
#ifndef raspberrypi_audioequalizer_COMMON_INCLUDES_
# define raspberrypi_audioequalizer_COMMON_INCLUDES_
#include <float.h>
#include <math.h>
#include <string.h>
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "dt_info.h"
#include "ext_work.h"
#include "MW_alsa_audio.h"
#include "rtGetInf.h"
#include "rtGetNaN.h"
#include "rt_nonfinite.h"
#endif                                 /* raspberrypi_audioequalizer_COMMON_INCLUDES_ */

#include "raspberrypi_audioequalizer_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetFinalTime
# define rtmGetFinalTime(rtm)          ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  ((rtm)->Timing.taskTime0)
#endif

#ifndef rtmGetTFinal
# define rtmGetTFinal(rtm)             ((rtm)->Timing.tFinal)
#endif

/* Block signals (auto storage) */
typedef struct {
  real32_T MatrixConcatenate[8820];    /* '<S4>/Matrix Concatenate' */
  real32_T Gain[4410];                 /* '<S3>/Gain' */
  real32_T BiquadFilter[4410];         /* '<S7>/Biquad Filter' */
  real32_T BiquadFilter_a[4410];       /* '<S5>/Biquad Filter' */
  int16_T u_o[8820];                   /* '<S4>/ 5' */
  int16_T MatrixSum[4410];             /* '<S3>/Matrix Sum' */
  real32_T Add[5];                     /* '<S12>/Add' */
  real32_T Add_o[5];                   /* '<S10>/Add' */
  real32_T BiquadFilter_m[4410];       /* '<S6>/Biquad Filter' */
  real32_T Add_j[5];                   /* '<S8>/Add' */
} BlockIO_raspberrypi_audioequali;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  struct {
    void *TimePtr;
    void *DataPtr;
    void *RSimInfoPtr;
  } FromWorkspace_PWORK;               /* '<S2>/From Workspace' */

  real32_T UnitDelay_DSTATE[5];        /* '<S12>/Unit Delay' */
  real32_T BiquadFilter_FILT_STATES[2];/* '<S7>/Biquad Filter' */
  real32_T UnitDelay_DSTATE_l[5];      /* '<S10>/Unit Delay' */
  real32_T BiquadFilter_FILT_STATES_d[2];/* '<S6>/Biquad Filter' */
  real32_T UnitDelay_DSTATE_m[5];      /* '<S8>/Unit Delay' */
  real32_T BiquadFilter_ZERO_STATES[2];/* '<S5>/Biquad Filter' */
  real32_T BiquadFilter_POLE_STATES[2];/* '<S5>/Biquad Filter' */
  struct {
    int_T PrevIndex;
  } FromWorkspace_IWORK;               /* '<S2>/From Workspace' */
} D_Work_raspberrypi_audioequaliz;

/* Constant parameters (auto storage) */
typedef struct {
  /* Expression: queueDuration
   * Referenced by: '<Root>/ALSA Audio Playback'
   */
  real_T ALSAAudioPlayback_p3;

  /* Computed Parameter: ALSAAudioPlayback_p2
   * Referenced by: '<Root>/ALSA Audio Playback'
   */
  uint32_T ALSAAudioPlayback_p2;

  /* Expression: device
   * Referenced by: '<Root>/ALSA Audio Playback'
   */
  uint8_T ALSAAudioPlayback_p1[8];
} ConstParam_raspberrypi_audioequ;

/* Parameters (auto storage) */
struct Parameters_raspberrypi_audioequ_ {
  real32_T b0_Gain;                    /* Computed Parameter: b0_Gain
                                        * Referenced by: '<S8>/b0'
                                        */
  real32_T UnitDelay_InitialCondition[5];/* Computed Parameter: UnitDelay_InitialCondition
                                          * Referenced by: '<S8>/Unit Delay'
                                          */
  real32_T a1_Gain;                    /* Computed Parameter: a1_Gain
                                        * Referenced by: '<S8>/a1'
                                        */
  real32_T b0_Gain_o;                  /* Computed Parameter: b0_Gain_o
                                        * Referenced by: '<S10>/b0'
                                        */
  real32_T UnitDelay_InitialCondition_j[5];/* Computed Parameter: UnitDelay_InitialCondition_j
                                            * Referenced by: '<S10>/Unit Delay'
                                            */
  real32_T a1_Gain_n;                  /* Computed Parameter: a1_Gain_n
                                        * Referenced by: '<S10>/a1'
                                        */
  real32_T b0_Gain_a;                  /* Computed Parameter: b0_Gain_a
                                        * Referenced by: '<S12>/b0'
                                        */
  real32_T UnitDelay_InitialCondition_g[5];/* Computed Parameter: UnitDelay_InitialCondition_g
                                            * Referenced by: '<S12>/Unit Delay'
                                            */
  real32_T a1_Gain_o;                  /* Computed Parameter: a1_Gain_o
                                        * Referenced by: '<S12>/a1'
                                        */
  real32_T CoeffsforBand1_Value[5];    /* Computed Parameter: CoeffsforBand1_Value
                                        * Referenced by: '<S1>/Coeffs for Band1'
                                        */
  real32_T CoeffsforBand2_Value[5];    /* Computed Parameter: CoeffsforBand2_Value
                                        * Referenced by: '<S1>/Coeffs for Band2'
                                        */
  real32_T CoeffsforBand3_Value[5];    /* Computed Parameter: CoeffsforBand3_Value
                                        * Referenced by: '<S1>/Coeffs for Band3'
                                        */
  real32_T Gain_Gain;                  /* Computed Parameter: Gain_Gain
                                        * Referenced by: '<S3>/Gain'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_raspberrypi_audioequali {
  const char_T *errorStatus;
  RTWExtModeInfo *extModeInfo;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T checksums[4];
  } Sizes;

  /*
   * SpecialInfo:
   * The following substructure contains special information
   * related to other components that are dependent on RTW.
   */
  struct {
    const void *mappingInfo;
  } SpecialInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    time_T taskTime0;
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    time_T tFinal;
    boolean_T stopRequestedFlag;
  } Timing;
};

/* Block parameters (auto storage) */
extern Parameters_raspberrypi_audioequ raspberrypi_audioequalizer_P;

/* Block signals (auto storage) */
extern BlockIO_raspberrypi_audioequali raspberrypi_audioequalizer_B;

/* Block states (auto storage) */
extern D_Work_raspberrypi_audioequaliz raspberrypi_audioequalize_DWork;

/* Constant parameters (auto storage) */
extern const ConstParam_raspberrypi_audioequ raspberrypi_audioequaliz_ConstP;

/* Model entry point functions */
extern void raspberrypi_audioequalizer_initialize(void);
extern void raspberrypi_audioequalizer_output(void);
extern void raspberrypi_audioequalizer_update(void);
extern void raspberrypi_audioequalizer_terminate(void);

/* Real-time Model object */
extern RT_MODEL_raspberrypi_audioequal *const raspberrypi_audioequalizer_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'raspberrypi_audioequalizer'
 * '<S1>'   : 'raspberrypi_audioequalizer/Equalizer'
 * '<S2>'   : 'raspberrypi_audioequalizer/Signal From Workspace'
 * '<S3>'   : 'raspberrypi_audioequalizer/Sum left & right channels  and to single'
 * '<S4>'   : 'raspberrypi_audioequalizer/Write to DAC'
 * '<S5>'   : 'raspberrypi_audioequalizer/Equalizer/Band 1  DF1'
 * '<S6>'   : 'raspberrypi_audioequalizer/Equalizer/Band 2  DF2'
 * '<S7>'   : 'raspberrypi_audioequalizer/Equalizer/Band 3  DF2T'
 * '<S8>'   : 'raspberrypi_audioequalizer/Equalizer/Band 1  DF1/Smooth Coefficients (Leaky Integrator)'
 * '<S9>'   : 'raspberrypi_audioequalizer/Equalizer/Band 1  DF1/Split Coefficients'
 * '<S10>'  : 'raspberrypi_audioequalizer/Equalizer/Band 2  DF2/Smooth Coefficients (Leaky Integrator)'
 * '<S11>'  : 'raspberrypi_audioequalizer/Equalizer/Band 2  DF2/Split Coefficients'
 * '<S12>'  : 'raspberrypi_audioequalizer/Equalizer/Band 3  DF2T/Smooth Coefficients (Leaky Integrator)'
 * '<S13>'  : 'raspberrypi_audioequalizer/Equalizer/Band 3  DF2T/Split Coefficients'
 */
#endif                                 /* RTW_HEADER_raspberrypi_audioequalizer_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

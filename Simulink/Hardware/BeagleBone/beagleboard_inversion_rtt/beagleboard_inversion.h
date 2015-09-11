/*
 * File: beagleboard_inversion.h
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

#ifndef RTW_HEADER_beagleboard_inversion_h_
#define RTW_HEADER_beagleboard_inversion_h_
#ifndef beagleboard_inversion_COMMON_INCLUDES_
# define beagleboard_inversion_COMMON_INCLUDES_
#include <float.h>
#include <string.h>
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "dt_info.h"
#include "ext_work.h"
#include "v4l2_capture.h"
#include "sdl_video_display.h"
#endif                                 /* beagleboard_inversion_COMMON_INCLUDES_ */

#include "beagleboard_inversion_types.h"

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
  uint8_T Add[76800];                  /* '<S1>/Add' */
  uint8_T V4L2VideoCapture_o1[76800];  /* '<Root>/V4L2 Video Capture' */
  uint8_T SetCbandCrtoblack[38400];    /* '<S1>/Set Cb and Cr to black' */
  uint8_T V4L2VideoCapture_o2[38400];  /* '<Root>/V4L2 Video Capture' */
  uint8_T V4L2VideoCapture_o3[38400];  /* '<Root>/V4L2 Video Capture' */
} BlockIO_beagleboard_inversion;

/* Constant parameters (auto storage) */
typedef struct {
  /* Expression: devName
   * Referenced by: '<Root>/V4L2 Video Capture'
   */
  uint8_T V4L2VideoCapture_p1[12];
} ConstParam_beagleboard_inversio;

/* Parameters (auto storage) */
struct Parameters_beagleboard_inversio_ {
  uint8_T Constant_Value;              /* Computed Parameter: Constant_Value
                                        * Referenced by: '<S1>/Constant'
                                        */
  uint8_T SetCbandCrtoblack_Value[38400];/* Expression: 128*ones(160, 240, 'uint8')
                                          * Referenced by: '<S1>/Set Cb and Cr to black'
                                          */
};

/* Real-time Model Data Structure */
struct tag_RTM_beagleboard_inversion {
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
extern Parameters_beagleboard_inversio beagleboard_inversion_P;

/* Block signals (auto storage) */
extern BlockIO_beagleboard_inversion beagleboard_inversion_B;

/* Constant parameters (auto storage) */
extern const ConstParam_beagleboard_inversio beagleboard_inversion_ConstP;

/* Model entry point functions */
extern void beagleboard_inversion_initialize(void);
extern void beagleboard_inversion_output(void);
extern void beagleboard_inversion_update(void);
extern void beagleboard_inversion_terminate(void);

/* Real-time Model object */
extern RT_MODEL_beagleboard_inversion *const beagleboard_inversion_M;

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
 * '<Root>' : 'beagleboard_inversion'
 * '<S1>'   : 'beagleboard_inversion/Inversion Algorithm'
 */
#endif                                 /* RTW_HEADER_beagleboard_inversion_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

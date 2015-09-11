/*
 * File: beagleboard_communication.h
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

#ifndef RTW_HEADER_beagleboard_communication_h_
#define RTW_HEADER_beagleboard_communication_h_
#ifndef beagleboard_communication_COMMON_INCLUDES_
# define beagleboard_communication_COMMON_INCLUDES_
#include <math.h>
#include <string.h>
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "HostLib_Network.h"
#endif                                 /* beagleboard_communication_COMMON_INCLUDES_ */

#include "beagleboard_communication_types.h"

/* Macros for accessing real-time model data structure */
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

/* Block signals (auto storage) */
typedef struct {
  real_T sine_wave;                    /* '<Root>/Sine Wave' */
} BlockIO_beagleboard_communicati;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  real_T UDPSend_NetworkLib[137];      /* '<Root>/UDP Send' */
  int32_T counter;                     /* '<Root>/Sine Wave' */
} D_Work_beagleboard_communicatio;

/* Parameters (auto storage) */
struct Parameters_beagleboard_communic_ {
  real_T SineWave_Amp;                 /* Expression: 1
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T SineWave_Bias;                /* Expression: 0
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T SineWave_NumSamp;             /* Expression: 50
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T SineWave_Offset;              /* Expression: 0
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_beagleboard_communicati {
  const char_T * volatile errorStatus;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    boolean_T stopRequestedFlag;
  } Timing;
};

/* Block parameters (auto storage) */
extern Parameters_beagleboard_communic beagleboard_communication_P;

/* Block signals (auto storage) */
extern BlockIO_beagleboard_communicati beagleboard_communication_B;

/* Block states (auto storage) */
extern D_Work_beagleboard_communicatio beagleboard_communication_DWork;

/* Model entry point functions */
extern void beagleboard_communication_initialize(void);
extern void beagleboard_communication_output(void);
extern void beagleboard_communication_update(void);
extern void beagleboard_communication_terminate(void);

/* Real-time Model object */
extern RT_MODEL_beagleboard_communicat *const beagleboard_communication_M;

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
 * '<Root>' : 'beagleboard_communication'
 */
#endif                                 /* RTW_HEADER_beagleboard_communication_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

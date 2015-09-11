/*
 * File: raspberrypi_audioequalizer_private.h
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

#ifndef RTW_HEADER_raspberrypi_audioequalizer_private_h_
#define RTW_HEADER_raspberrypi_audioequalizer_private_h_
#include "rtwtypes.h"

/* Private macros used by the generated code to access rtModel */
#ifndef rtmSetTFinal
# define rtmSetTFinal(rtm, val)        ((rtm)->Timing.tFinal = (val))
#endif

#ifndef rtmGetTPtr
# define rtmGetTPtr(rtm)               (&(rtm)->Timing.taskTime0)
#endif

/* Used by FromWorkspace Block: '<S2>/From Workspace' */
#ifndef rtInterpolate
# define rtInterpolate(v1,v2,f1,f2)    (((v1)==(v2))?((double)(v1)): (((f1)*((double)(v1)))+((f2)*((double)(v2)))))
#endif

#ifndef rtRound
# define rtRound(v)                    ( ((v) >= 0) ? floor((v) + 0.5) : ceil((v) - 0.5) )
#endif

#ifndef __RTWTYPES_H__
#error This file requires rtwtypes.h to be included
#else
#ifdef TMWTYPES_PREVIOUSLY_INCLUDED
#error This file requires rtwtypes.h to be included before tmwtypes.h
#else

/* Check for inclusion of an incorrect version of rtwtypes.h */
#ifndef RTWTYPES_ID_C08S16I32L32N32F1
#error This code was generated with a different "rtwtypes.h" than the file included
#endif                                 /* RTWTYPES_ID_C08S16I32L32N32F1 */
#endif                                 /* TMWTYPES_PREVIOUSLY_INCLUDED */
#endif                                 /* __RTWTYPES_H__ */

extern void raspberrypi_audio_Band1DF1_Init(void);
extern void raspberrypi_aud_Band1DF1_Update(void);
extern void raspberrypi_audioequal_Band1DF1(void);
extern void raspberrypi_audio_Band2DF2_Init(void);
extern void raspberrypi_aud_Band2DF2_Update(void);
extern void raspberrypi_audioequal_Band2DF2(void);
extern void raspberrypi_audi_Band3DF2T_Init(void);
extern void raspberrypi_au_Band3DF2T_Update(void);
extern void raspberrypi_audioequa_Band3DF2T(void);

#endif                                 /* RTW_HEADER_raspberrypi_audioequalizer_private_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

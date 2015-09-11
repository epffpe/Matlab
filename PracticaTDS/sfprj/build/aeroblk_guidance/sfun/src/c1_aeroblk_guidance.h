#ifndef __c1_aeroblk_guidance_h__
#define __c1_aeroblk_guidance_h__

/* Include files */
#include "sfc_sf.h"
#include "sfc_mex.h"
#include "rtw_capi.h"
#include "rtw_modelmap.h"

/* Type Definitions */
typedef struct {
  real_T c1_Acquire_time;
  real_T c1_incr;
  SimStruct *S;
  void *c1_testPointAddrMap[11];
  uint32_T chartNumber;
  uint32_T instanceNumber;
  uint8_T c1_is_Fuze;
  uint8_T c1_is_Guidance;
  uint8_T c1_is_active_Fuze;
  uint8_T c1_is_active_Guidance;
  uint8_T c1_is_active_c1_aeroblk_guidance;
  uint8_T c1_tp_Abort;
  uint8_T c1_tp_Armed;
  uint8_T c1_tp_Blind_Range;
  uint8_T c1_tp_Fuze;
  uint8_T c1_tp_Guidance;
  uint8_T c1_tp_Inert;
  uint8_T c1_tp_Radar_Guided;
  uint8_T c1_tp_Target_Lock;
  uint8_T c1_tp_Target_Search;
  rtwCAPI_ModelMappingInfo c1_testPointMappingInfo;
  ChartInfoStruct chartInfo;
} SFc1_aeroblk_guidanceInstanceStruct;

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
void c1_aeroblk_guidance(void);

/* Function Definitions */

extern void sf_c1_aeroblk_guidance_get_check_sum(mxArray *plhs[]);
extern void c1_aeroblk_guidance_method_dispatcher(SimStruct *S, int_T method,
 void *data);

#endif


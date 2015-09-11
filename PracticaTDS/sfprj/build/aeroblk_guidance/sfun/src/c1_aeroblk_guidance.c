/* Include files */
#include "aeroblk_guidance_sfun.h"
#include "c1_aeroblk_guidance.h"
#define CHARTINSTANCE_CHARTNUMBER       (chartInstance.chartNumber)
#define CHARTINSTANCE_INSTANCENUMBER    (chartInstance.instanceNumber)
#include "aeroblk_guidance_sfun_debug_macros.h"

/* Type Definitions */

/* Named Constants */
#define c1_event_Timeout                (0)
#define c1_entry_to_Target_Search       (1)
#define c1_IN_NO_ACTIVE_CHILD           (0)
#define c1_IN_Target_Search             (5)
#define c1_IN_Target_Lock               (4)
#define c1_IN_Abort                     (1)
#define c1_IN_Radar_Guided              (3)
#define c1_IN_Blind_Range               (2)
#define c1_IN_Inert                     (2)
#define c1_IN_Armed                     (1)

/* Variable Declarations */

/* Variable Definitions */
static SFc1_aeroblk_guidanceInstanceStruct chartInstance;

/* Function Declarations */
static void initialize_c1_aeroblk_guidance(void);
static void enable_c1_aeroblk_guidance(void);
static void disable_c1_aeroblk_guidance(void);
static void finalize_c1_aeroblk_guidance(void);
static void sf_c1_aeroblk_guidance(void);
static void c1_enter_atomic_Target_Search(void);
static void c1_Fuze(void);
static uint8_T c1__u8_d_(real_T c1_b);
static uint8_T c1__u8_s8_(int8_T c1_b);
static real_T *c1_Range(void);
static real_T *c1_Detonate(void);
static real_T *c1_b_Fuze(void);
static real_T *c1_Sigma_d(void);
static real_T *c1_Mode(void);
static real_T *c1_Acquire(void);
static real_T *c1_az_dem(void);
static real_T *c1_az_fix(void);
static void init_test_point_addr_map(void);
static void **get_test_point_address_map(void);
static rtwCAPI_ModelMappingInfo *get_test_point_mapping_info(void);

/* Function Definitions */
static void initialize_c1_aeroblk_guidance(void)
{
  uint8_T c1_previousEvent;
  chartInstance.c1_is_active_Fuze = 0;
  chartInstance.c1_is_Fuze = 0;
  chartInstance.c1_tp_Fuze = 0;
  chartInstance.c1_tp_Armed = 0;
  chartInstance.c1_tp_Inert = 0;
  chartInstance.c1_is_active_Guidance = 0;
  chartInstance.c1_is_Guidance = 0;
  chartInstance.c1_tp_Guidance = 0;
  chartInstance.c1_tp_Abort = 0;
  chartInstance.c1_tp_Blind_Range = 0;
  chartInstance.c1_tp_Radar_Guided = 0;
  chartInstance.c1_tp_Target_Lock = 0;
  chartInstance.c1_tp_Target_Search = 0;
  chartInstance.c1_is_active_c1_aeroblk_guidance = 0;
  chartInstance.c1_Acquire_time = 0.0;
  chartInstance.c1_incr = 0.0;
  if(!(cdrGetOutputPortReusable(chartInstance.S, 1) != 0)) {
    *c1_Detonate() = 0.0;
  }
  if(!(cdrGetOutputPortReusable(chartInstance.S, 2) != 0)) {
    *c1_b_Fuze() = 0.0;
  }
  if(!(cdrGetOutputPortReusable(chartInstance.S, 3) != 0)) {
    *c1_Sigma_d() = 0.0;
  }
  if(!(cdrGetOutputPortReusable(chartInstance.S, 4) != 0)) {
    *c1_Mode() = (real_T)c1__u8_d_(0.0);
  }
  if(!(cdrGetOutputPortReusable(chartInstance.S, 5) != 0)) {
    *c1_az_fix() = -9.81;
  }
  c1_previousEvent = _sfEvent_;
  _sfEvent_ = CALL_EVENT;
  c1_aeroblk_guidance();
  _sfEvent_ = c1_previousEvent;
}

static void enable_c1_aeroblk_guidance(void)
{
}

static void disable_c1_aeroblk_guidance(void)
{
}

static void finalize_c1_aeroblk_guidance(void)
{
}

static void sf_c1_aeroblk_guidance(void)
{
  uint8_T c1_previousEvent;
  _sfTime_ = (real_T)ssGetT(chartInstance.S);
  _SFD_DATA_RANGE_CHECK(*c1_Range(), 1U);
  _SFD_DATA_RANGE_CHECK(*c1_Detonate(), 5U);
  _SFD_DATA_RANGE_CHECK(*c1_b_Fuze(), 3U);
  _SFD_DATA_RANGE_CHECK(*c1_Sigma_d(), 7U);
  _SFD_DATA_RANGE_CHECK(*c1_Mode(), 8U);
  _SFD_DATA_RANGE_CHECK(*c1_Acquire(), 0U);
  _SFD_DATA_RANGE_CHECK(chartInstance.c1_Acquire_time, 9U);
  _SFD_DATA_RANGE_CHECK(chartInstance.c1_incr, 4U);
  _SFD_DATA_RANGE_CHECK(*c1_az_dem(), 2U);
  _SFD_DATA_RANGE_CHECK(*c1_az_fix(), 6U);
  c1_previousEvent = _sfEvent_;
  _sfEvent_ = CALL_EVENT;
  c1_aeroblk_guidance();
  _sfEvent_ = c1_previousEvent;
}

void c1_aeroblk_guidance(void)
{
  _SFD_CC_CALL(CHART_ENTER_DURING_FUNCTION_TAG,0);
  if(chartInstance.c1_is_active_c1_aeroblk_guidance == 0) {
    _SFD_CC_CALL(CHART_ENTER_ENTRY_FUNCTION_TAG,0);
    chartInstance.c1_is_active_c1_aeroblk_guidance = 1;
    _SFD_CC_CALL(EXIT_OUT_OF_FUNCTION_TAG,0);
    chartInstance.c1_is_active_Guidance = 1;
    _SFD_CS_CALL(STATE_ACTIVE_TAG,6);
    chartInstance.c1_tp_Guidance = 1;
    if(chartInstance.c1_is_active_Guidance != 0) {
      _SFD_CT_CALL(TRANSITION_ACTIVE_TAG,0);
      *c1_az_fix() = -9.81;
      _SFD_DATA_RANGE_CHECK(*c1_az_fix(), 6U);
      c1_enter_atomic_Target_Search();
      chartInstance.c1_is_active_Fuze = 1;
      _SFD_CS_CALL(STATE_ACTIVE_TAG,8);
      chartInstance.c1_tp_Fuze = 1;
      if(chartInstance.c1_is_active_Fuze != 0) {
        _SFD_CT_CALL(TRANSITION_ACTIVE_TAG,4);
        if(chartInstance.c1_is_Fuze != c1_IN_Inert) {
          chartInstance.c1_is_Fuze = (uint8_T)c1_IN_Inert;
          _SFD_CS_CALL(STATE_ACTIVE_TAG,1);
          chartInstance.c1_tp_Inert = 1;
          *c1_b_Fuze() = 0.0;
          _SFD_DATA_RANGE_CHECK(*c1_b_Fuze(), 3U);
        }
      }
    }
  } else {
    _SFD_CS_CALL(STATE_ENTER_DURING_FUNCTION_TAG,6);
    if(chartInstance.c1_is_active_Guidance != 0) {
      switch(chartInstance.c1_is_Guidance) {
       case c1_IN_Abort:
        CV_STATE_EVAL(6,0,1);
        _SFD_CS_CALL(STATE_ENTER_DURING_FUNCTION_TAG,3);
        _SFD_CS_CALL(EXIT_OUT_OF_FUNCTION_TAG,3);
        break;
       case c1_IN_Blind_Range:
        CV_STATE_EVAL(6,0,2);
        _SFD_CS_CALL(STATE_ENTER_DURING_FUNCTION_TAG,0);
        _SFD_CS_CALL(EXIT_OUT_OF_FUNCTION_TAG,0);
        break;
       case c1_IN_Radar_Guided:
        CV_STATE_EVAL(6,0,3);
        _SFD_CS_CALL(STATE_ENTER_DURING_FUNCTION_TAG,7);
        if(chartInstance.c1_is_Guidance == c1_IN_Radar_Guided) {
          if(CV_TRANSITION_EVAL(10U,
            (int32_T)_SFD_CCP_CALL(10,0,(c1__u8_d_(*c1_Acquire()) == 0))) != 0) {
            if(sf_debug_transition_conflict_check_enabled()) {
              unsigned int transitionList[2];
              unsigned int numTransitions=1;
              transitionList[0] = 10;
              sf_debug_transition_conflict_check_begin();
              if(*c1_Range() < 200.0) {
                transitionList[numTransitions] = 7;
                numTransitions++;
              }
              sf_debug_transition_conflict_check_end();
              if(numTransitions>1) {
                _SFD_TRANSITION_CONFLICT(&(transitionList[0]),numTransitions);
              }
            }
            _SFD_CT_CALL(TRANSITION_ACTIVE_TAG,10);
            if(chartInstance.c1_is_Guidance == c1_IN_Radar_Guided) {
              *c1_az_fix() = *c1_az_dem();
              _SFD_DATA_RANGE_CHECK(*c1_az_fix(), 6U);
              chartInstance.c1_tp_Radar_Guided = 0;
              chartInstance.c1_is_Guidance = (uint8_T)c1_IN_NO_ACTIVE_CHILD;
              _SFD_CS_CALL(STATE_INACTIVE_TAG,7);
            }
            if((chartInstance.c1_is_Guidance == c1_IN_NO_ACTIVE_CHILD) &&
             (chartInstance.c1_is_active_Guidance != 0)) {
              c1_enter_atomic_Target_Search();
            }
          } else if(CV_TRANSITION_EVAL(7U,
            (int32_T)_SFD_CCP_CALL(7,0,(*c1_Range() < 200.0))) != 0) {
            _SFD_CT_CALL(TRANSITION_ACTIVE_TAG,7);
            if(chartInstance.c1_is_Guidance == c1_IN_Radar_Guided) {
              *c1_az_fix() = *c1_az_dem();
              _SFD_DATA_RANGE_CHECK(*c1_az_fix(), 6U);
              chartInstance.c1_tp_Radar_Guided = 0;
              chartInstance.c1_is_Guidance = (uint8_T)c1_IN_NO_ACTIVE_CHILD;
              _SFD_CS_CALL(STATE_INACTIVE_TAG,7);
            }
            if((chartInstance.c1_is_Guidance == c1_IN_NO_ACTIVE_CHILD) &&
             (chartInstance.c1_is_active_Guidance != 0) && (chartInstance.
              c1_is_Guidance != c1_IN_Blind_Range)) {
              chartInstance.c1_is_Guidance = (uint8_T)c1_IN_Blind_Range;
              _SFD_CS_CALL(STATE_ACTIVE_TAG,0);
              chartInstance.c1_tp_Blind_Range = 1;
              *c1_Mode() = (real_T)c1__u8_s8_(4);
              _SFD_DATA_RANGE_CHECK(*c1_Mode(), 8U);
            }
          }
        }
        _SFD_CS_CALL(EXIT_OUT_OF_FUNCTION_TAG,7);
        break;
       case c1_IN_Target_Lock:
        CV_STATE_EVAL(6,0,4);
        _SFD_CS_CALL(STATE_ENTER_DURING_FUNCTION_TAG,5);
        if((chartInstance.c1_is_Guidance == c1_IN_Target_Lock) &&
         (CV_TRANSITION_EVAL(1U, (int32_T)_SFD_CCP_CALL(1,0,(_sfTime_ -
             chartInstance.c1_Acquire_time > 0.2))) != 0)) {
          _SFD_CT_CALL(TRANSITION_ACTIVE_TAG,1);
          chartInstance.c1_tp_Target_Lock = 0;
          chartInstance.c1_is_Guidance = (uint8_T)c1_IN_NO_ACTIVE_CHILD;
          _SFD_CS_CALL(STATE_INACTIVE_TAG,5);
          if(chartInstance.c1_is_Guidance != c1_IN_Radar_Guided) {
            chartInstance.c1_is_Guidance = (uint8_T)c1_IN_Radar_Guided;
            _SFD_CS_CALL(STATE_ACTIVE_TAG,7);
            chartInstance.c1_tp_Radar_Guided = 1;
            *c1_Mode() = (real_T)c1__u8_s8_(3);
            _SFD_DATA_RANGE_CHECK(*c1_Mode(), 8U);
          }
        }
        _SFD_CS_CALL(EXIT_OUT_OF_FUNCTION_TAG,5);
        break;
       case c1_IN_Target_Search:
        CV_STATE_EVAL(6,0,5);
        _SFD_CS_CALL(STATE_ENTER_DURING_FUNCTION_TAG,4);
        if(CV_TRANSITION_EVAL(3U,
          (int32_T)_SFD_CCP_CALL(3,0,(c1__u8_d_(*c1_Acquire()) == 1))) != 0) {
          if(sf_debug_transition_conflict_check_enabled()) {
            unsigned int transitionList[2];
            unsigned int numTransitions=1;
            transitionList[0] = 3;
            sf_debug_transition_conflict_check_begin();
            if(_sfTime_ - chartInstance.c1_Acquire_time > 7.0) {
              transitionList[numTransitions] = 2;
              numTransitions++;
            }
            sf_debug_transition_conflict_check_end();
            if(numTransitions>1) {
              _SFD_TRANSITION_CONFLICT(&(transitionList[0]),numTransitions);
            }
          }
          _SFD_CT_CALL(TRANSITION_ACTIVE_TAG,3);
          chartInstance.c1_tp_Target_Search = 0;
          chartInstance.c1_is_Guidance = (uint8_T)c1_IN_NO_ACTIVE_CHILD;
          _SFD_CS_CALL(STATE_INACTIVE_TAG,4);
          if(chartInstance.c1_is_Guidance != c1_IN_Target_Lock) {
            chartInstance.c1_is_Guidance = (uint8_T)c1_IN_Target_Lock;
            _SFD_CS_CALL(STATE_ACTIVE_TAG,5);
            chartInstance.c1_tp_Target_Lock = 1;
            *c1_Mode() = (real_T)c1__u8_s8_(2);
            _SFD_DATA_RANGE_CHECK(*c1_Mode(), 8U);
            chartInstance.c1_Acquire_time = _sfTime_;
            _SFD_DATA_RANGE_CHECK(chartInstance.c1_Acquire_time, 9U);
          }
        } else if(CV_TRANSITION_EVAL(2U, (int32_T)_SFD_CCP_CALL(2,0,(_sfTime_ -
            chartInstance.c1_Acquire_time > 7.0))) != 0) {
          _SFD_CT_CALL(TRANSITION_ACTIVE_TAG,2);
          chartInstance.c1_tp_Target_Search = 0;
          chartInstance.c1_is_Guidance = (uint8_T)c1_IN_NO_ACTIVE_CHILD;
          _SFD_CS_CALL(STATE_INACTIVE_TAG,4);
          {
            uint8_T c1_previousEvent;
            c1_previousEvent = _sfEvent_;
            _sfEvent_ = c1_event_Timeout;
            _SFD_CE_CALL(EVENT_ENTER_BROADCAST_FUNCTION_TAG,c1_event_Timeout);
            c1_aeroblk_guidance();
            _SFD_CE_CALL(EVENT_AFTER_BROADCAST_TAG,c1_event_Timeout);
            _sfEvent_ = c1_previousEvent;
          }
          if(chartInstance.c1_is_Guidance == c1_IN_NO_ACTIVE_CHILD) {
            if(chartInstance.c1_is_active_Guidance == 0) {
              _SFD_CT_CALL(TRANSITION_INACTIVE_TAG,2);
            } else if(chartInstance.c1_is_Guidance != c1_IN_Abort) {
              chartInstance.c1_is_Guidance = (uint8_T)c1_IN_Abort;
              _SFD_CS_CALL(STATE_ACTIVE_TAG,3);
              chartInstance.c1_tp_Abort = 1;
              *c1_Detonate() = 1.0;
              _SFD_DATA_RANGE_CHECK(*c1_Detonate(), 5U);
            }
          } else {
            _SFD_CT_CALL(TRANSITION_INACTIVE_TAG,2);
          }
        } else {
          *c1_Sigma_d() += 0.01 * chartInstance.c1_incr;
          _SFD_DATA_RANGE_CHECK(*c1_Sigma_d(), 7U);
          if(CV_TRANSITION_EVAL(9U, (_SFD_CCP_CALL(9,0,(*c1_Sigma_d() > 30.0))
             != 0) || (_SFD_CCP_CALL(9,1,(*c1_Sigma_d() < -30.0)) != 0)) !=
           0) {
            _SFD_CT_CALL(TRANSITION_ACTIVE_TAG,9);
            chartInstance.c1_incr = -chartInstance.c1_incr;
            _SFD_DATA_RANGE_CHECK(chartInstance.c1_incr, 4U);
          }
        }
        _SFD_CS_CALL(EXIT_OUT_OF_FUNCTION_TAG,4);
        break;
       default:
        CV_STATE_EVAL(6,0,0);
        break;
      }
    }
    _SFD_CS_CALL(EXIT_OUT_OF_FUNCTION_TAG,6);
    c1_Fuze();
  }
  _SFD_CC_CALL(EXIT_OUT_OF_FUNCTION_TAG,0);
}

static void c1_enter_atomic_Target_Search(void)
{
  if(chartInstance.c1_is_Guidance != c1_IN_Target_Search) {
    chartInstance.c1_is_Guidance = (uint8_T)c1_IN_Target_Search;
    _SFD_CS_CALL(STATE_ACTIVE_TAG,4);
    chartInstance.c1_tp_Target_Search = 1;
    *c1_Mode() = (real_T)c1__u8_s8_(1);
    _SFD_DATA_RANGE_CHECK(*c1_Mode(), 8U);
    *c1_Sigma_d() = 0.0;
    _SFD_DATA_RANGE_CHECK(*c1_Sigma_d(), 7U);
    chartInstance.c1_incr = -100.0;
    _SFD_DATA_RANGE_CHECK(chartInstance.c1_incr, 4U);
    chartInstance.c1_Acquire_time = _sfTime_;
    _SFD_DATA_RANGE_CHECK(chartInstance.c1_Acquire_time, 9U);
    {
      uint8_T c1_previousEvent;
      c1_previousEvent = _sfEvent_;
      _sfEvent_ = c1_entry_to_Target_Search;
      _SFD_CE_CALL(EVENT_ENTER_BROADCAST_FUNCTION_TAG,c1_entry_to_Target_Search);
      c1_Fuze();
      _SFD_CE_CALL(EVENT_AFTER_BROADCAST_TAG,c1_entry_to_Target_Search);
      _sfEvent_ = c1_previousEvent;
    }
  }
}

static void c1_Fuze(void)
{
  _SFD_CS_CALL(STATE_ENTER_DURING_FUNCTION_TAG,8);
  if(chartInstance.c1_is_active_Fuze != 0) {
    switch(chartInstance.c1_is_Fuze) {
     case c1_IN_Armed:
      CV_STATE_EVAL(8,0,1);
      _SFD_CS_CALL(STATE_ENTER_DURING_FUNCTION_TAG,2);
      if((chartInstance.c1_is_Fuze == c1_IN_Armed) && (CV_TRANSITION_EVAL(5U,
         (int32_T)_SFD_CCP_CALL(5,0,(_sfEvent_ ==
           c1_entry_to_Target_Search))) != 0)) {
        _SFD_CT_CALL(TRANSITION_ACTIVE_TAG,5);
        chartInstance.c1_tp_Armed = 0;
        chartInstance.c1_is_Fuze = (uint8_T)c1_IN_NO_ACTIVE_CHILD;
        _SFD_CS_CALL(STATE_INACTIVE_TAG,2);
        if(chartInstance.c1_is_Fuze != c1_IN_Inert) {
          chartInstance.c1_is_Fuze = (uint8_T)c1_IN_Inert;
          _SFD_CS_CALL(STATE_ACTIVE_TAG,1);
          chartInstance.c1_tp_Inert = 1;
          *c1_b_Fuze() = 0.0;
          _SFD_DATA_RANGE_CHECK(*c1_b_Fuze(), 3U);
        }
      }
      _SFD_CS_CALL(EXIT_OUT_OF_FUNCTION_TAG,2);
      break;
     case c1_IN_Inert:
      CV_STATE_EVAL(8,0,2);
      _SFD_CS_CALL(STATE_ENTER_DURING_FUNCTION_TAG,1);
      if(chartInstance.c1_is_Fuze == c1_IN_Inert) {
        if(CV_TRANSITION_EVAL(8U, (int32_T)_SFD_CCP_CALL(8,0,(_sfEvent_ ==
            c1_event_Timeout))) != 0) {
          _SFD_CT_CALL(TRANSITION_ACTIVE_TAG,8);
          chartInstance.c1_tp_Inert = 0;
          chartInstance.c1_is_Fuze = (uint8_T)c1_IN_NO_ACTIVE_CHILD;
          _SFD_CS_CALL(STATE_INACTIVE_TAG,1);
          if(chartInstance.c1_is_Fuze != c1_IN_Armed) {
            chartInstance.c1_is_Fuze = (uint8_T)c1_IN_Armed;
            _SFD_CS_CALL(STATE_ACTIVE_TAG,2);
            chartInstance.c1_tp_Armed = 1;
            *c1_b_Fuze() = 1.0;
            _SFD_DATA_RANGE_CHECK(*c1_b_Fuze(), 3U);
          }
        } else if(CV_TRANSITION_EVAL(6U,
          (_SFD_CCP_CALL(6,0,(chartInstance.c1_is_Guidance ==
             c1_IN_Radar_Guided)) != 0) && (_SFD_CCP_CALL(6,1,(
             *c1_Range() < 1000.0)) != 0)) != 0) {
          _SFD_CT_CALL(TRANSITION_ACTIVE_TAG,6);
          chartInstance.c1_tp_Inert = 0;
          chartInstance.c1_is_Fuze = (uint8_T)c1_IN_NO_ACTIVE_CHILD;
          _SFD_CS_CALL(STATE_INACTIVE_TAG,1);
          if(chartInstance.c1_is_Fuze != c1_IN_Armed) {
            chartInstance.c1_is_Fuze = (uint8_T)c1_IN_Armed;
            _SFD_CS_CALL(STATE_ACTIVE_TAG,2);
            chartInstance.c1_tp_Armed = 1;
            *c1_b_Fuze() = 1.0;
            _SFD_DATA_RANGE_CHECK(*c1_b_Fuze(), 3U);
          }
        }
      }
      _SFD_CS_CALL(EXIT_OUT_OF_FUNCTION_TAG,1);
      break;
     default:
      CV_STATE_EVAL(8,0,0);
      break;
    }
  }
  _SFD_CS_CALL(EXIT_OUT_OF_FUNCTION_TAG,8);
}

static uint8_T c1__u8_d_(real_T c1_b)
{
  uint8_T c1_a;
  c1_a = (uint8_T)c1_b;
  if((real_T)c1_a != (c1_b < 0.0 ? ceil(c1_b) : floor(c1_b))) {
    sf_debug_overflow_detection(0);
  }
  return c1_a;
}

static uint8_T c1__u8_s8_(int8_T c1_b)
{
  uint8_T c1_a;
  c1_a = (uint8_T)c1_b;
  if(c1_b < 0) {
    sf_debug_overflow_detection(0);
  }
  return c1_a;
}

static real_T *c1_Range(void)
{
  return (real_T *)ssGetInputPortSignal(chartInstance.S, 0);
}

static real_T *c1_Detonate(void)
{
  return (real_T *)ssGetOutputPortSignal(chartInstance.S, 1);
}

static real_T *c1_b_Fuze(void)
{
  return (real_T *)ssGetOutputPortSignal(chartInstance.S, 2);
}

static real_T *c1_Sigma_d(void)
{
  return (real_T *)ssGetOutputPortSignal(chartInstance.S, 3);
}

static real_T *c1_Mode(void)
{
  return (real_T *)ssGetOutputPortSignal(chartInstance.S, 4);
}

static real_T *c1_Acquire(void)
{
  return (real_T *)ssGetInputPortSignal(chartInstance.S, 1);
}

static real_T *c1_az_dem(void)
{
  return (real_T *)ssGetInputPortSignal(chartInstance.S, 2);
}

static real_T *c1_az_fix(void)
{
  return (real_T *)ssGetOutputPortSignal(chartInstance.S, 5);
}

static void init_test_point_addr_map(void)
{
  chartInstance.c1_testPointAddrMap[0] = &chartInstance.c1_Acquire_time;
  chartInstance.c1_testPointAddrMap[1] = &chartInstance.c1_incr;
  chartInstance.c1_testPointAddrMap[2] = &chartInstance.c1_tp_Fuze;
  chartInstance.c1_testPointAddrMap[3] = &chartInstance.c1_tp_Armed;
  chartInstance.c1_testPointAddrMap[4] = &chartInstance.c1_tp_Inert;
  chartInstance.c1_testPointAddrMap[5] = &chartInstance.c1_tp_Guidance;
  chartInstance.c1_testPointAddrMap[6] = &chartInstance.c1_tp_Abort;
  chartInstance.c1_testPointAddrMap[7] = &chartInstance.c1_tp_Blind_Range;
  chartInstance.c1_testPointAddrMap[8] = &chartInstance.c1_tp_Radar_Guided;
  chartInstance.c1_testPointAddrMap[9] = &chartInstance.c1_tp_Target_Lock;
  chartInstance.c1_testPointAddrMap[10] = &chartInstance.c1_tp_Target_Search;
}

static void **get_test_point_address_map(void)
{
  return &chartInstance.c1_testPointAddrMap[0];
}

static rtwCAPI_ModelMappingInfo *get_test_point_mapping_info(void)
{
  return &chartInstance.c1_testPointMappingInfo;
}

/* SFunction Glue Code */
static void init_test_point_mapping_info(SimStruct *S);
void sf_c1_aeroblk_guidance_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2626108607U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(983794551U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(993301206U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2307371711U);
}

mxArray *sf_c1_aeroblk_guidance_get_autoinheritance_info(void)
{
  const char *autoinheritanceInfoStructFieldNames[] =
  {"checksum","inputTypes","outputSizes","outputTypes"};
  mxArray *mxAutoinheritanceInfo = NULL;
  mxArray *mxChecksum = NULL;
  mxArray *mxInputTypes = NULL;
  mxArray *mxOutputSizes = NULL;
  mxArray *mxOutputTypes = NULL;

  mxAutoinheritanceInfo = mxCreateStructMatrix(1,1,
   sizeof(autoinheritanceInfoStructFieldNames)/sizeof(char *),
   autoinheritanceInfoStructFieldNames);

  mxChecksum = mxCreateDoubleMatrix(4,1,mxREAL);
  ((real_T *)mxGetPr((mxChecksum)))[0] = (real_T)(0U);
  ((real_T *)mxGetPr((mxChecksum)))[1] = (real_T)(0U);
  ((real_T *)mxGetPr((mxChecksum)))[2] = (real_T)(0U);
  ((real_T *)mxGetPr((mxChecksum)))[3] = (real_T)(0U);

  mxInputTypes = mxCreateDoubleMatrix(1,3,mxREAL);
  ((real_T *)mxGetPr((mxInputTypes)))[0] = (real_T)(10U);
  ((real_T *)mxGetPr((mxInputTypes)))[1] = (real_T)(1U);
  ((real_T *)mxGetPr((mxInputTypes)))[2] = (real_T)(10U);

  mxOutputSizes = mxCreateDoubleMatrix(2,5,mxREAL);
  mxOutputTypes = mxCreateDoubleMatrix(1,5,mxREAL);
  ((real_T *)mxGetPr((mxOutputSizes)))[0] = (real_T)(1U);
  ((real_T *)mxGetPr((mxOutputSizes)))[1] = (real_T)(1U);
  ((real_T *)mxGetPr((mxOutputTypes)))[0] = (real_T)(1U);
  ((real_T *)mxGetPr((mxOutputSizes)))[2] = (real_T)(1U);
  ((real_T *)mxGetPr((mxOutputSizes)))[3] = (real_T)(1U);
  ((real_T *)mxGetPr((mxOutputTypes)))[1] = (real_T)(1U);
  ((real_T *)mxGetPr((mxOutputSizes)))[4] = (real_T)(1U);
  ((real_T *)mxGetPr((mxOutputSizes)))[5] = (real_T)(1U);
  ((real_T *)mxGetPr((mxOutputTypes)))[2] = (real_T)(10U);
  ((real_T *)mxGetPr((mxOutputSizes)))[6] = (real_T)(1U);
  ((real_T *)mxGetPr((mxOutputSizes)))[7] = (real_T)(1U);
  ((real_T *)mxGetPr((mxOutputTypes)))[3] = (real_T)(3U);
  ((real_T *)mxGetPr((mxOutputSizes)))[8] = (real_T)(1U);
  ((real_T *)mxGetPr((mxOutputSizes)))[9] = (real_T)(1U);
  ((real_T *)mxGetPr((mxOutputTypes)))[4] = (real_T)(10U);

  mxSetFieldByNumber(mxAutoinheritanceInfo,0,0,mxChecksum);
  mxSetFieldByNumber(mxAutoinheritanceInfo,0,1,mxInputTypes);
  mxSetFieldByNumber(mxAutoinheritanceInfo,0,2,mxOutputSizes);
  mxSetFieldByNumber(mxAutoinheritanceInfo,0,3,mxOutputTypes);

  return(mxAutoinheritanceInfo);
}

static void chart_debug_initialization(SimStruct *S)
{
  if(ssIsFirstInitCond(S)) {
    /* do this only if simulation is starting */
    {
      unsigned int chartAlreadyPresent;
      chartAlreadyPresent =
        sf_debug_initialize_chart(_aeroblk_guidanceMachineNumber_,
       1,
       9,
       11,
       10,
       1,
       0,
       1,
       0,
       &(chartInstance.chartNumber),
       &(chartInstance.instanceNumber),
       ssGetPath(S),
       (void *)S);
      if(chartAlreadyPresent==0) {
        /* this is the first instance */
        _SFD_STATE_ENTRY_EVENT_COUNT(0,4);
        sf_debug_set_chart_disable_implicit_casting(_aeroblk_guidanceMachineNumber_,chartInstance.chartNumber,0);
        sf_debug_set_chart_event_thresholds(_aeroblk_guidanceMachineNumber_,
         chartInstance.chartNumber,
         1,
         1,
         2);

        _SFD_SET_DATA_PROPS(1,1,1,0,SF_DOUBLE,0,NULL,0,0.0,1.0,0,"Range",0);
        _SFD_SET_DATA_PROPS(5,2,0,1,SF_UINT8,0,NULL,0,0.0,1.0,0,"Detonate",0);
        _SFD_SET_DATA_PROPS(3,2,0,1,SF_UINT8,0,NULL,0,0.0,1.0,0,"Fuze",0);
        _SFD_SET_DATA_PROPS(7,2,0,1,SF_DOUBLE,0,NULL,0,0.0,1.0,0,"Sigma_d",0);
        _SFD_SET_DATA_PROPS(8,2,0,1,SF_UINT8,0,NULL,0,0.0,1.0,0,"Mode",0);
        _SFD_SET_DATA_PROPS(0,1,1,0,SF_UINT8,0,NULL,0,0.0,1.0,0,"Acquire",0);
        _SFD_SET_DATA_PROPS(9,0,0,0,SF_DOUBLE,0,NULL,0,0.0,1.0,0,"Acquire_time",0);
        _SFD_SET_DATA_PROPS(4,0,0,0,SF_DOUBLE,0,NULL,0,0.0,1.0,0,"incr",0);
        _SFD_SET_DATA_PROPS(2,1,1,0,SF_DOUBLE,0,NULL,0,0.0,1.0,0,"az_dem",0);
        _SFD_SET_DATA_PROPS(6,2,0,1,SF_DOUBLE,0,NULL,0,0.0,1.0,0,"az_fix",0);
        _SFD_EVENT_SCOPE(0,0);
        _SFD_STATE_INFO(8,0,1);
        _SFD_STATE_INFO(2,0,0);
        _SFD_STATE_INFO(1,0,0);
        _SFD_STATE_INFO(6,0,1);
        _SFD_STATE_INFO(3,0,0);
        _SFD_STATE_INFO(0,0,0);
        _SFD_STATE_INFO(7,0,0);
        _SFD_STATE_INFO(5,0,0);
        _SFD_STATE_INFO(4,0,0);
        _SFD_CH_SUBSTATE_COUNT(2);
        _SFD_CH_SUBSTATE_DECOMP(1);
        _SFD_CH_SUBSTATE_INDEX(0,6);
        _SFD_CH_SUBSTATE_INDEX(1,8);
        _SFD_ST_SUBSTATE_COUNT(6,5);
        _SFD_ST_SUBSTATE_INDEX(6,0,3);
        _SFD_ST_SUBSTATE_INDEX(6,1,0);
        _SFD_ST_SUBSTATE_INDEX(6,2,7);
        _SFD_ST_SUBSTATE_INDEX(6,3,5);
        _SFD_ST_SUBSTATE_INDEX(6,4,4);
        _SFD_ST_SUBSTATE_COUNT(3,0);
        _SFD_ST_SUBSTATE_COUNT(0,0);
        _SFD_ST_SUBSTATE_COUNT(7,0);
        _SFD_ST_SUBSTATE_COUNT(5,0);
        _SFD_ST_SUBSTATE_COUNT(4,0);
        _SFD_ST_SUBSTATE_COUNT(8,2);
        _SFD_ST_SUBSTATE_INDEX(8,0,2);
        _SFD_ST_SUBSTATE_INDEX(8,1,1);
        _SFD_ST_SUBSTATE_COUNT(2,0);
        _SFD_ST_SUBSTATE_COUNT(1,0);
      }
      _SFD_CV_INIT_CHART(2,0,0,0);
      {
        _SFD_CV_INIT_STATE(8,2,1,0,0,0,NULL,NULL);
      }
      {
        _SFD_CV_INIT_STATE(2,0,0,0,0,0,NULL,NULL);
      }
      {
        _SFD_CV_INIT_STATE(1,0,0,0,0,0,NULL,NULL);
      }
      {
        _SFD_CV_INIT_STATE(6,5,1,0,0,0,NULL,NULL);
      }
      {
        _SFD_CV_INIT_STATE(3,0,0,0,0,0,NULL,NULL);
      }
      {
        _SFD_CV_INIT_STATE(0,0,0,0,0,0,NULL,NULL);
      }
      {
        _SFD_CV_INIT_STATE(7,0,0,0,0,0,NULL,NULL);
      }
      {
        _SFD_CV_INIT_STATE(5,0,0,0,0,0,NULL,NULL);
      }
      {
        _SFD_CV_INIT_STATE(4,0,0,0,0,0,NULL,NULL);
      }

      _SFD_CV_INIT_TRANS(0,0,NULL,NULL,0,NULL);

      {
        static unsigned int sStartGuardMap[] = {1};
        static unsigned int sEndGuardMap[] = {11};
        static int sPostFixPredicateTree[] = {0};
        _SFD_CV_INIT_TRANS(10,1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),1,&(sPostFixPredicateTree[0]));
      }
      {
        static unsigned int sStartGuardMap[] = {1,13};
        static unsigned int sEndGuardMap[] = {11,24};
        static int sPostFixPredicateTree[] = {0,1,-2};
        _SFD_CV_INIT_TRANS(9,2,&(sStartGuardMap[0]),&(sEndGuardMap[0]),3,&(sPostFixPredicateTree[0]));
      }
      {
        static unsigned int sStartGuardMap[] = {1};
        static unsigned int sEndGuardMap[] = {17};
        static int sPostFixPredicateTree[] = {0};
        _SFD_CV_INIT_TRANS(2,1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),1,&(sPostFixPredicateTree[0]));
      }
      {
        static unsigned int sStartGuardMap[] = {1};
        static unsigned int sEndGuardMap[] = {11};
        static int sPostFixPredicateTree[] = {0};
        _SFD_CV_INIT_TRANS(3,1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),1,&(sPostFixPredicateTree[0]));
      }
      {
        static unsigned int sStartGuardMap[] = {1};
        static unsigned int sEndGuardMap[] = {19};
        static int sPostFixPredicateTree[] = {0};
        _SFD_CV_INIT_TRANS(1,1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),1,&(sPostFixPredicateTree[0]));
      }
      {
        static unsigned int sStartGuardMap[] = {1};
        static unsigned int sEndGuardMap[] = {10};
        static int sPostFixPredicateTree[] = {0};
        _SFD_CV_INIT_TRANS(7,1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),1,&(sPostFixPredicateTree[0]));
      }
      _SFD_CV_INIT_TRANS(4,0,NULL,NULL,0,NULL);

      {
        static unsigned int sStartGuardMap[] = {3};
        static unsigned int sEndGuardMap[] = {29};
        static int sPostFixPredicateTree[] = {0};
        _SFD_CV_INIT_TRANS(5,1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),1,&(sPostFixPredicateTree[0]));
      }
      {
        static unsigned int sStartGuardMap[] = {0};
        static unsigned int sEndGuardMap[] = {7};
        static int sPostFixPredicateTree[] = {0};
        _SFD_CV_INIT_TRANS(8,1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),1,&(sPostFixPredicateTree[0]));
      }
      {
        static unsigned int sStartGuardMap[] = {1,28};
        static unsigned int sEndGuardMap[] = {26,38};
        static int sPostFixPredicateTree[] = {0,1,-3};
        _SFD_CV_INIT_TRANS(6,2,&(sStartGuardMap[0]),&(sEndGuardMap[0]),3,&(sPostFixPredicateTree[0]));
      }
      _SFD_TRANS_COV_WTS(0,0,0,1,0);
      if(chartAlreadyPresent==0)
      {
        _SFD_TRANS_COV_MAPS(0,
         0,NULL,NULL,
         0,NULL,NULL,
         1,NULL,NULL,
         0,NULL,NULL);
      }
      _SFD_TRANS_COV_WTS(10,0,1,0,0);
      if(chartAlreadyPresent==0)
      {
        static unsigned int sStartGuardMap[] = {1};
        static unsigned int sEndGuardMap[] = {11};
        _SFD_TRANS_COV_MAPS(10,
         0,NULL,NULL,
         1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),
         0,NULL,NULL,
         0,NULL,NULL);
      }
      _SFD_TRANS_COV_WTS(9,0,2,0,1);
      if(chartAlreadyPresent==0)
      {
        static unsigned int sStartGuardMap[] = {1,13};
        static unsigned int sEndGuardMap[] = {11,24};
        _SFD_TRANS_COV_MAPS(9,
         0,NULL,NULL,
         2,&(sStartGuardMap[0]),&(sEndGuardMap[0]),
         0,NULL,NULL,
         1,NULL,NULL);
      }
      _SFD_TRANS_COV_WTS(2,0,1,0,1);
      if(chartAlreadyPresent==0)
      {
        static unsigned int sStartGuardMap[] = {1};
        static unsigned int sEndGuardMap[] = {17};
        _SFD_TRANS_COV_MAPS(2,
         0,NULL,NULL,
         1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),
         0,NULL,NULL,
         1,NULL,NULL);
      }
      _SFD_TRANS_COV_WTS(3,0,1,0,0);
      if(chartAlreadyPresent==0)
      {
        static unsigned int sStartGuardMap[] = {1};
        static unsigned int sEndGuardMap[] = {11};
        _SFD_TRANS_COV_MAPS(3,
         0,NULL,NULL,
         1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),
         0,NULL,NULL,
         0,NULL,NULL);
      }
      _SFD_TRANS_COV_WTS(1,0,1,0,0);
      if(chartAlreadyPresent==0)
      {
        static unsigned int sStartGuardMap[] = {1};
        static unsigned int sEndGuardMap[] = {19};
        _SFD_TRANS_COV_MAPS(1,
         0,NULL,NULL,
         1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),
         0,NULL,NULL,
         0,NULL,NULL);
      }
      _SFD_TRANS_COV_WTS(7,0,1,0,0);
      if(chartAlreadyPresent==0)
      {
        static unsigned int sStartGuardMap[] = {1};
        static unsigned int sEndGuardMap[] = {10};
        _SFD_TRANS_COV_MAPS(7,
         0,NULL,NULL,
         1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),
         0,NULL,NULL,
         0,NULL,NULL);
      }
      _SFD_TRANS_COV_WTS(4,0,0,0,0);
      if(chartAlreadyPresent==0)
      {
        _SFD_TRANS_COV_MAPS(4,
         0,NULL,NULL,
         0,NULL,NULL,
         0,NULL,NULL,
         0,NULL,NULL);
      }
      _SFD_TRANS_COV_WTS(5,0,1,0,0);
      if(chartAlreadyPresent==0)
      {
        static unsigned int sStartGuardMap[] = {3};
        static unsigned int sEndGuardMap[] = {29};
        _SFD_TRANS_COV_MAPS(5,
         0,NULL,NULL,
         1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),
         0,NULL,NULL,
         0,NULL,NULL);
      }
      _SFD_TRANS_COV_WTS(8,0,1,0,0);
      if(chartAlreadyPresent==0)
      {
        static unsigned int sStartGuardMap[] = {0};
        static unsigned int sEndGuardMap[] = {7};
        _SFD_TRANS_COV_MAPS(8,
         0,NULL,NULL,
         1,&(sStartGuardMap[0]),&(sEndGuardMap[0]),
         0,NULL,NULL,
         0,NULL,NULL);
      }
      _SFD_TRANS_COV_WTS(6,0,2,0,0);
      if(chartAlreadyPresent==0)
      {
        static unsigned int sStartGuardMap[] = {1,28};
        static unsigned int sEndGuardMap[] = {26,38};
        _SFD_TRANS_COV_MAPS(6,
         0,NULL,NULL,
         2,&(sStartGuardMap[0]),&(sEndGuardMap[0]),
         0,NULL,NULL,
         0,NULL,NULL);
      }
      _SFD_SET_DATA_VALUE_PTR(1U, c1_Range());
      _SFD_SET_DATA_VALUE_PTR(5U, c1_Detonate());
      _SFD_SET_DATA_VALUE_PTR(3U, c1_b_Fuze());
      _SFD_SET_DATA_VALUE_PTR(7U, c1_Sigma_d());
      _SFD_SET_DATA_VALUE_PTR(8U, c1_Mode());
      _SFD_SET_DATA_VALUE_PTR(0U, c1_Acquire());
      _SFD_SET_DATA_VALUE_PTR(9U, &chartInstance.c1_Acquire_time);
      _SFD_SET_DATA_VALUE_PTR(4U, &chartInstance.c1_incr);
      _SFD_SET_DATA_VALUE_PTR(2U, c1_az_dem());
      _SFD_SET_DATA_VALUE_PTR(6U, c1_az_fix());
    }
  } else {
    sf_debug_reset_current_state_configuration(_aeroblk_guidanceMachineNumber_,chartInstance.chartNumber,chartInstance.instanceNumber);
  }
}

static void sf_opaque_initialize_c1_aeroblk_guidance(void *chartInstanceVar)
{
  chart_debug_initialization(chartInstance.S);
  initialize_c1_aeroblk_guidance();
}

static void sf_opaque_enable_c1_aeroblk_guidance(void *chartInstanceVar)
{
  enable_c1_aeroblk_guidance();
}

static void sf_opaque_disable_c1_aeroblk_guidance(void *chartInstanceVar)
{
  disable_c1_aeroblk_guidance();
}

static void sf_opaque_gateway_c1_aeroblk_guidance(void *chartInstanceVar)
{
  sf_c1_aeroblk_guidance();
}

static void sf_opaque_terminate_c1_aeroblk_guidance(void *chartInstanceVar)
{
  finalize_c1_aeroblk_guidance();
}

static void mdlSetWorkWidths_c1_aeroblk_guidance(SimStruct *S)
{
  if(sim_mode_is_rtw_gen(S)) {
    int_T chartIsInlinable =
      (int_T)sf_is_chart_inlinable("aeroblk_guidance",1);
    int_T chartIsMultiInstanced =
      (int_T)sf_is_chart_multi_instanced("aeroblk_guidance",1);
    ssSetStateflowIsInlinable(S,chartIsInlinable);
    ssSetEnableFcnIsTrivial(S,1);
    ssSetDisableFcnIsTrivial(S,1);
    if(chartIsInlinable) {
      ssSetInputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 1, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 2, SS_REUSABLE_AND_LOCAL);
      sf_mark_chart_expressionable_inputs(S,"aeroblk_guidance",1,3);
      sf_mark_chart_reusable_outputs(S,"aeroblk_guidance",1,5);
    }
    if (!sf_is_chart_instance_optimized_out("aeroblk_guidance",1)) {
      int dtId;
      char *chartInstanceTypedefName =
        sf_chart_instance_typedef_name("aeroblk_guidance",1);
      dtId = ssRegisterDataType(S, chartInstanceTypedefName);
      if (dtId == INVALID_DTYPE_ID ) return;
      /* Register the size of the udt */
      if (!ssSetDataTypeSize(S, dtId, 8)) return;
      if(!ssSetNumDWork(S,1)) return;
      ssSetDWorkDataType(S, 0, dtId);
      ssSetDWorkWidth(S, 0, 1);
      ssSetDWorkName(S, 0, "ChartInstance"); /*optional name, less than 16 chars*/
      sf_set_rtw_identifier(S);
    }
    ssSetHasSubFunctions(S,!(chartIsInlinable));
    ssSetOptions(S,ssGetOptions(S)|SS_OPTION_WORKS_WITH_CODE_REUSE);
    ssSetCallsOutputInInitFcn(S,1);
  }

  ssSetChecksum0(S,(2626108607U));
  ssSetChecksum1(S,(983794551U));
  ssSetChecksum2(S,(993301206U));
  ssSetChecksum3(S,(2307371711U));

  ssSetExplicitFCSSCtrl(S,1);
}

static void mdlRTW_c1_aeroblk_guidance(SimStruct *S)
{
  sf_write_symbol_mapping(S, "aeroblk_guidance", 1);
  ssWriteRTWStrParam(S, "StateflowChartType", "Stateflow");
}

static void mdlStart_c1_aeroblk_guidance(SimStruct *S)
{
  chartInstance.chartInfo.chartInstance = NULL;
  chartInstance.chartInfo.isEMLChart = 0;
  chartInstance.chartInfo.chartInitialized = 0;
  chartInstance.chartInfo.sFunctionGateway =
    sf_opaque_gateway_c1_aeroblk_guidance;
  chartInstance.chartInfo.initializeChart =
    sf_opaque_initialize_c1_aeroblk_guidance;
  chartInstance.chartInfo.terminateChart =
    sf_opaque_terminate_c1_aeroblk_guidance;
  chartInstance.chartInfo.enableChart = sf_opaque_enable_c1_aeroblk_guidance;
  chartInstance.chartInfo.disableChart = sf_opaque_disable_c1_aeroblk_guidance;
  chartInstance.chartInfo.mdlRTW = mdlRTW_c1_aeroblk_guidance;
  chartInstance.chartInfo.mdlStart = mdlStart_c1_aeroblk_guidance;
  chartInstance.chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c1_aeroblk_guidance;
  chartInstance.chartInfo.restoreLastMajorStepConfiguration = NULL;
  chartInstance.chartInfo.restoreBeforeLastMajorStepConfiguration = NULL;
  chartInstance.chartInfo.storeCurrentConfiguration = NULL;
  chartInstance.S = S;
  ssSetUserData(S,(void *)(&(chartInstance.chartInfo))); /* register the chart instance with simstruct */

  if(!sim_mode_is_rtw_gen(S)) {
    init_test_point_mapping_info(S);
  }
}

void c1_aeroblk_guidance_method_dispatcher(SimStruct *S, int_T method, void
 *data)
{
  switch (method) {
   case SS_CALL_MDL_START:
    mdlStart_c1_aeroblk_guidance(S);
    break;
   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c1_aeroblk_guidance(S);
    break;
   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
     "Error calling c1_aeroblk_guidance_method_dispatcher.\n"
     "Can't handle method %d.\n", method);
    break;
  }
}

static const rtwCAPI_DataTypeMap dataTypeMap[] = {
  /* cName, mwName, numElements, elemMapIndex, dataSize, slDataId, isComplex, isPointer */
  {"real_T", "real_T", 0, 0, sizeof(real_T), SS_DOUBLE, 0, 0},
  {"uint8_T", "uint8_T", 0, 0, sizeof(uint8_T), SS_UINT8, 0, 0}
};

static real_T fixPtSlopeBiasVals[2] = {
  0,
  1
};

static const rtwCAPI_FixPtMap fixedPointMap[] = {
  /* *fracSlope, *bias, scaleType, exponent, isSigned */
  {NULL, NULL, rtwCAPI_FIX_RESERVED, 0, 0}
};

static const rtwCAPI_DimensionMap dimensionMap[] = {
  /* dataOrientation, dimArrayIndex, numDims*/
  {rtwCAPI_SCALAR, 0, 2}
};

static const uint_T dimensionArray[] = {
  1, 1
};

static real_T sfCAPIsampleTimeZero = 0.0;
static const rtwCAPI_SampleTimeMap sampleTimeMap[] = {
  /* *period, *offset, taskId, contextTid, mode */
  {&sfCAPIsampleTimeZero, &sfCAPIsampleTimeZero, 0, 0, 0}
};

static const rtwCAPI_Signals testPointSignals[] = {
  /* addrMapIndex, sysNum, SFRelativePath, dataName, portNumber, dataTypeIndex, dimIndex, fixPtIdx, sTimeIndex */
  {0, 0,"StateflowChart/Acquire_time", "Acquire_time", 0, 0, 0, 0, 0},
  {1, 0,"StateflowChart/incr", "incr", 0, 0, 0, 0, 0},
  {2, 0, "StateflowChart/Fuze", "Fuze", 0, 1, 0, 0, 0},
  {3, 0, "StateflowChart/Fuze.Armed", "Armed", 0, 1, 0, 0, 0},
  {4, 0, "StateflowChart/Fuze.Inert", "Inert", 0, 1, 0, 0, 0},
  {5, 0, "StateflowChart/Guidance", "Guidance", 0, 1, 0, 0, 0},
  {6, 0, "StateflowChart/Guidance.Abort", "Abort", 0, 1, 0, 0, 0},
  {7, 0, "StateflowChart/Guidance.Blind_Range", "Blind_Range", 0, 1, 0, 0, 0},
  {8, 0, "StateflowChart/Guidance.Radar_Guided", "Radar_Guided", 0, 1, 0, 0, 0},
  {9, 0, "StateflowChart/Guidance.Target_Lock", "Target_Lock", 0, 1, 0, 0, 0},
  {10, 0, "StateflowChart/Guidance.Target_Search", "Target_Search", 0, 1, 0, 0,
    0}
};

static rtwCAPI_ModelMappingStaticInfo testPointMappingStaticInfo = {
  /* block signal monitoring */
  {
    testPointSignals,                   /* Block signals Array  */
    11                                  /* Num Block IO signals */
  },

  /* parameter tuning */
  {
    NULL,                               /* Block parameters Array    */
    0,                                  /* Num block parameters      */
    NULL,                               /* Variable parameters Array */
    0                                   /* Num variable parameters   */
  },

  /* block states */
  {
    NULL,                               /* Block States array        */
    0                                   /* Num Block States          */
  },

  /* Static maps */
  {
    dataTypeMap,                        /* Data Type Map            */
    dimensionMap,                       /* Data Dimension Map       */
    fixedPointMap,                      /* Fixed Point Map          */
    NULL,                               /* Structure Element map    */
    sampleTimeMap,                      /* Sample Times Map         */
    dimensionArray                      /* Dimension Array          */
  },

  /* Target type */
  "float"
};

static void init_test_point_mapping_info(SimStruct *S) {
  rtwCAPI_ModelMappingInfo *testPointMappingInfo;
  void **testPointAddrMap;

  init_test_point_addr_map();
  testPointMappingInfo = get_test_point_mapping_info();
  testPointAddrMap = get_test_point_address_map();

  rtwCAPI_SetStaticMap(*testPointMappingInfo, &testPointMappingStaticInfo);
  rtwCAPI_SetPath(*testPointMappingInfo, "");
  rtwCAPI_SetFullPath(*testPointMappingInfo, NULL);
  rtwCAPI_SetDataAddressMap(*testPointMappingInfo, testPointAddrMap);
  rtwCAPI_SetChildMMIArray(*testPointMappingInfo, NULL);
  rtwCAPI_SetChildMMIArrayLen(*testPointMappingInfo, 0);

  ssSetModelMappingInfoPtr(S, testPointMappingInfo);
}


/* Include files */
#include "aeroblk_guidance_sfun.h"
#include "c1_aeroblk_guidance.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
uint8_T _sfEvent_;
uint32_T _aeroblk_guidanceMachineNumber_;
real_T _sfTime_;

/* Function Declarations */

/* Function Definitions */
void aeroblk_guidance_initializer(void)
{
  _sfEvent_ = CALL_EVENT;
}

void aeroblk_guidance_terminator(void)
{
}

/* SFunction Glue Code */
unsigned int sf_aeroblk_guidance_method_dispatcher(SimStruct *simstructPtr,
 const char *chartName, int_T method, void *data)
{
  if(!strcmp_ignore_ws(chartName,"aeroblk_guidance/Guidance/Guidance Processor (Updated @100Hz)/ SFunction "))
  {
    c1_aeroblk_guidance_method_dispatcher(simstructPtr, method, data);
    return 1;
  }
  return 0;
}
unsigned int sf_aeroblk_guidance_process_check_sum_call( int nlhs, mxArray *
 plhs[], int nrhs, const mxArray * prhs[] )
{
#ifdef MATLAB_MEX_FILE
  char commandName[20];
  if (nrhs<1 || !mxIsChar(prhs[0]) ) return 0;
  /* Possible call to get the checksum */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if(strcmp(commandName,"sf_get_check_sum")) return 0;
  plhs[0] = mxCreateDoubleMatrix( 1,4,mxREAL);
  if(nrhs>1 && mxIsChar(prhs[1])) {
    mxGetString(prhs[1], commandName,sizeof(commandName)/sizeof(char));
    commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
    if(!strcmp(commandName,"machine")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(4225759016U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(4111051978U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(277503052U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2789704274U);
    }else if(!strcmp(commandName,"exportedFcn")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(0U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(0U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(0U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(0U);
    }else if(!strcmp(commandName,"makefile")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(582644908U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(3653793599U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(4048590707U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2762531596U);
    }else if(nrhs==3 && !strcmp(commandName,"chart")) {
      unsigned int chartFileNumber;
      chartFileNumber = (unsigned int)mxGetScalar(prhs[2]);
      switch(chartFileNumber) {
       case 1:
        {
          extern void sf_c1_aeroblk_guidance_get_check_sum(mxArray *plhs[]);
          sf_c1_aeroblk_guidance_get_check_sum(plhs);
          break;
        }

       default:
        ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(0.0);
        ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(0.0);
        ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(0.0);
        ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(0.0);
      }
    }else if(!strcmp(commandName,"target")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(153506083U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(3317610629U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(261399803U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3228920707U);
    }else {
      return 0;
    }
  } else{
    ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2519589659U);
    ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2524562202U);
    ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3715709205U);
    ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2805653403U);
  }
  return 1;
#else
  return 0;
#endif
}

unsigned int sf_aeroblk_guidance_autoinheritance_info( int nlhs, mxArray *
 plhs[], int nrhs, const mxArray * prhs[] )
{
#ifdef MATLAB_MEX_FILE
  char commandName[32];
  if (nrhs<2 || !mxIsChar(prhs[0]) ) return 0;
  /* Possible call to get the autoinheritance_info */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if(strcmp(commandName,"get_autoinheritance_info")) return 0;
  {
    unsigned int chartFileNumber;
    chartFileNumber = (unsigned int)mxGetScalar(prhs[1]);
    switch(chartFileNumber) {
     case 1:
      {
        extern mxArray *sf_c1_aeroblk_guidance_get_autoinheritance_info(void);
        plhs[0] = sf_c1_aeroblk_guidance_get_autoinheritance_info();
        break;
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }
  return 1;
#else
  return 0;
#endif
}
void aeroblk_guidance_debug_initialize(void)
{
  _aeroblk_guidanceMachineNumber_ =
    sf_debug_initialize_machine("aeroblk_guidance","sfun",0,1,0,0,0);
  sf_debug_set_machine_event_thresholds(_aeroblk_guidanceMachineNumber_,0,0);
  sf_debug_set_machine_data_thresholds(_aeroblk_guidanceMachineNumber_,0);
}


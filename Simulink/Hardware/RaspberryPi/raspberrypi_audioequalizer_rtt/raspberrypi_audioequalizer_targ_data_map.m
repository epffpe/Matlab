  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 1;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (raspberrypi_audioequalizer_P)
    ;%
      section.nData     = 13;
      section.data(13)  = dumData; %prealloc
      
	  ;% raspberrypi_audioequalizer_P.b0_Gain
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% raspberrypi_audioequalizer_P.UnitDelay_InitialCondition
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% raspberrypi_audioequalizer_P.a1_Gain
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 6;
	
	  ;% raspberrypi_audioequalizer_P.b0_Gain_o
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 7;
	
	  ;% raspberrypi_audioequalizer_P.UnitDelay_InitialCondition_j
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 8;
	
	  ;% raspberrypi_audioequalizer_P.a1_Gain_n
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 13;
	
	  ;% raspberrypi_audioequalizer_P.b0_Gain_a
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 14;
	
	  ;% raspberrypi_audioequalizer_P.UnitDelay_InitialCondition_g
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 15;
	
	  ;% raspberrypi_audioequalizer_P.a1_Gain_o
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 20;
	
	  ;% raspberrypi_audioequalizer_P.CoeffsforBand1_Value
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 21;
	
	  ;% raspberrypi_audioequalizer_P.CoeffsforBand2_Value
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 26;
	
	  ;% raspberrypi_audioequalizer_P.CoeffsforBand3_Value
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 31;
	
	  ;% raspberrypi_audioequalizer_P.Gain_Gain
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 36;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 2;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (raspberrypi_audioequalizer_B)
    ;%
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% raspberrypi_audioequalizer_B.Gain
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% raspberrypi_audioequalizer_B.BiquadFilter
	  section.data(2).logicalSrcIdx = 2;
	  section.data(2).dtTransOffset = 4410;
	
	  ;% raspberrypi_audioequalizer_B.BiquadFilter_a
	  section.data(3).logicalSrcIdx = 6;
	  section.data(3).dtTransOffset = 8820;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% raspberrypi_audioequalizer_B.Add
	  section.data(1).logicalSrcIdx = 1;
	  section.data(1).dtTransOffset = 0;
	
	  ;% raspberrypi_audioequalizer_B.Add_o
	  section.data(2).logicalSrcIdx = 3;
	  section.data(2).dtTransOffset = 5;
	
	  ;% raspberrypi_audioequalizer_B.BiquadFilter_m
	  section.data(3).logicalSrcIdx = 4;
	  section.data(3).dtTransOffset = 10;
	
	  ;% raspberrypi_audioequalizer_B.Add_j
	  section.data(4).logicalSrcIdx = 5;
	  section.data(4).dtTransOffset = 4420;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 3;
    sectIdxOffset = 2;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (raspberrypi_audioequalize_DWork)
    ;%
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% raspberrypi_audioequalize_DWork.FromWorkspace_PWORK.TimePtr
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 7;
      section.data(7)  = dumData; %prealloc
      
	  ;% raspberrypi_audioequalize_DWork.UnitDelay_DSTATE
	  section.data(1).logicalSrcIdx = 1;
	  section.data(1).dtTransOffset = 0;
	
	  ;% raspberrypi_audioequalize_DWork.BiquadFilter_FILT_STATES
	  section.data(2).logicalSrcIdx = 2;
	  section.data(2).dtTransOffset = 5;
	
	  ;% raspberrypi_audioequalize_DWork.UnitDelay_DSTATE_l
	  section.data(3).logicalSrcIdx = 3;
	  section.data(3).dtTransOffset = 7;
	
	  ;% raspberrypi_audioequalize_DWork.BiquadFilter_FILT_STATES_d
	  section.data(4).logicalSrcIdx = 4;
	  section.data(4).dtTransOffset = 12;
	
	  ;% raspberrypi_audioequalize_DWork.UnitDelay_DSTATE_m
	  section.data(5).logicalSrcIdx = 5;
	  section.data(5).dtTransOffset = 14;
	
	  ;% raspberrypi_audioequalize_DWork.BiquadFilter_ZERO_STATES
	  section.data(6).logicalSrcIdx = 6;
	  section.data(6).dtTransOffset = 19;
	
	  ;% raspberrypi_audioequalize_DWork.BiquadFilter_POLE_STATES
	  section.data(7).logicalSrcIdx = 7;
	  section.data(7).dtTransOffset = 21;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% raspberrypi_audioequalize_DWork.FromWorkspace_IWORK.PrevIndex
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 764694365;
  targMap.checksum1 = 253652238;
  targMap.checksum2 = 1950994378;
  targMap.checksum3 = 4045298559;


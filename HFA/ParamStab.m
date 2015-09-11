function varargout = ParamStab(varargin)
% PARAMSTAB M-file for ParamStab.fig
%      PARAMSTAB, by itself, creates a new PARAMSTAB or raises the existing
%      singleton*.
%
%      H = PARAMSTAB returns the handle to a new PARAMSTAB or the handle to
%      the existing singleton*.
%
%      PARAMSTAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARAMSTAB.M with the given input arguments.
%
%      PARAMSTAB('Property','Value',...) creates a new PARAMSTAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ParamStab_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ParamStab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help ParamStab

% Last Modified by GUIDE v2.5 01-Jul-2011 20:41:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ParamStab_OpeningFcn, ...
                   'gui_OutputFcn',  @ParamStab_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ParamStab is made visible.
function ParamStab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ParamStab (see VARARGIN)

% Choose default command line output for ParamStab
handles.output = hObject;

%Parámetros
% handles.parametrosy.ki=0;
% handles.parametrosy.kr=0;
% handles.parametrosy.kf=0;
% handles.parametrosy.ko=0;
handles.parametrosy.ki=(20+j*10)*1e-3;
handles.parametrosy.kr=(-1-j*0.5)*1e-3;
handles.parametrosy.kf=(40-j*100)*1e-3;
handles.parametrosy.ko=(1+j*5)*1e-3;
% handles.parametrosy.yie=0;
% handles.parametrosy.yre=0;
% handles.parametrosy.yfe=0;
% handles.parametrosy.yoe=0;
% handles.parametrosy.yib=0;
% handles.parametrosy.yrb=0;
% handles.parametrosy.yfb=0;
% handles.parametrosy.yob=0;
% handles.parametrosy.yic=0;
% handles.parametrosy.yrc=0;
% handles.parametrosy.yfc=0;
% handles.parametrosy.yoc=0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ParamStab wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ParamStab_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editi_Callback(hObject, eventdata, handles)
% hObject    handle to editi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editi as text
%        str2double(get(hObject,'String')) returns contents of editi as a double
ki = str2double(get(hObject,'string'))*1e-3;
if isnan(ki)
    errordlg('Debes introducir un valor numérico','Bad Input','modal')
end
handles.parametrosy.ki=ki;
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function editi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function editr_Callback(hObject, eventdata, handles)
% hObject    handle to editr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editr as text
%        str2double(get(hObject,'String')) returns contents of editr as a double
kr = str2double(get(hObject,'string'))*1e-3;
if isnan(kr)
    errordlg('Debes introducir un valor numérico','Bad Input','modal')
end
handles.parametrosy.kr=kr;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function editf_Callback(hObject, eventdata, handles)
% hObject    handle to editf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editf as text
%        str2double(get(hObject,'String')) returns contents of editf as a double
kf = str2double(get(hObject,'string'))*1e-3;
if isnan(kf)
    errordlg('Debes introducir un valor numérico','Bad Input','modal')
end
handles.parametrosy.kf=kf;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edito_Callback(hObject, eventdata, handles)
% hObject    handle to edito (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edito as text
%        str2double(get(hObject,'String')) returns contents of edito as a double
ko = str2double(get(hObject,'string'))*1e-3;
if isnan(ko)
    errordlg('Debes introducir un valor numérico','Bad Input','modal')
end
handles.parametrosy.ko=ko;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edito_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edito (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in rbce.
function rbce_Callback(hObject, eventdata, handles)
% hObject    handle to rbce (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbce


% --- Executes on button press in rbcb.
function rbcb_Callback(hObject, eventdata, handles)
% hObject    handle to rbcb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbcb


% --- Executes on button press in rbcc.
function rbcc_Callback(hObject, eventdata, handles)
% hObject    handle to rbcc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbcc


% --- Executes on button press in PBAP.
function PBAP_Callback(hObject, eventdata, handles)
% hObject    handle to PBAP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%user_entry = str2double(get(handles.,'string'));
gi=real(handles.parametrosy.ki);
go=real(handles.parametrosy.ko);
set(handles.editgi,'String',num2str(1e3*gi));
set(handles.editgo,'String',num2str(1e3*go));
temp=abs(handles.parametrosy.kf + handles.parametrosy.kr')^2/4;
set(handles.editUU,'String',num2str(1e3*temp));
if (gi*go >= temp & gi>=0 & go>=0)
    set(handles.editActivoPasivo,'String','Pasivo');
else
    set(handles.editActivoPasivo,'String','Activo');
end
% --------------------------------------------------------------------
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (hObject == handles.rbce)

    set(handles.text1, 'String', 'yie');
    set(handles.text2, 'String', 'yre');
    set(handles.text3, 'String', 'yfe');
    set(handles.text4, 'String', 'yoe');
    %set(handles.edit11,'BackgroundColor',[1 0 0])
    yie=handles.parametrosy.ki;
    yre=handles.parametrosy.kr;
    yfe=handles.parametrosy.kf;
    yoe=handles.parametrosy.ko;
    yrc= - yie - yre;
    yfc= - yie - yfe;
    yfb= - yfe - yoe;
    yrb= - yre - yoe;
    yic= yie;
    yob= yoe;
    yoc= - yfc - yrb;
    yib=yoc;
elseif (hObject == handles.rbcb)
    set(handles.text1, 'String', 'yib');
    set(handles.text2, 'String', 'yrb');
    set(handles.text3, 'String', 'yfb');
    set(handles.text4, 'String', 'yob');
    yib=handles.parametrosy.ki;         %%%%%%Hay que arreglar esto
    yrb=handles.parametrosy.kr;
    yfb=handles.parametrosy.kf;
    yob=handles.parametrosy.ko;
    yfe= - yfb - yob;
    yre= - yrb - yob;
    yfc= - yib - yrb;
    yrc= - yib - yfb;
    yic= - yrc - yre;
    yoc= yib;
    yie= yic;
    yoe= yob;
    
%     yrc= - yie - yre;
%     yfc= - yie - yfe;
%     yfb= - yfe - yoe;
%     yrb= - yre - yoe;
%     yic= yie;
%     yob= yoe;
%     yoc= - yfc - yrb;
%     yib=yoc;
else
    set(handles.text1, 'String', 'yic');
    set(handles.text2, 'String', 'yrc');
    set(handles.text3, 'String', 'yfc');
    set(handles.text4, 'String', 'yoc');
    yic=handles.parametrosy.ki;              %%%%%%Hay que arreglar esto
    yrc=handles.parametrosy.kr;
    yfc=handles.parametrosy.kf;
    yoc=handles.parametrosy.ko;
    yie= yic;
    yre= - yic - yrc;
    yfe= - yic - yfc;
    yib= yoc;
    yfb= - yrc - yoc;
    yrb= - yfc - yoc;
    yob= - yre - yrb;
    yoe= yob;
%     yrc= - yie - yre;
%     yfc= - yie - yfe;
%     yfb= - yfe - yoe;
%     yrb= - yre - yoe;
%     yic= yie;
%     yob= yoe;
%     yoc= - yfc - yrb;
%     yib=yoc;
end
handles.parametrosy.yie=yie;
handles.parametrosy.yre=yre;
handles.parametrosy.yfe=yfe;
handles.parametrosy.yoe=yoe;
handles.parametrosy.yib=yib;
handles.parametrosy.yrb=yrb;
handles.parametrosy.yfb=yfb;
handles.parametrosy.yob=yob;
handles.parametrosy.yic=yic;
handles.parametrosy.yrc=yrc;
handles.parametrosy.yfc=yfc;
handles.parametrosy.yoc=yoc;
set(handles.edit11,'String',num2str(yie*1e3));
set(handles.edit12,'String',num2str(yrc*1e3));
set(handles.edit13,'String',num2str(yre*1e3));
set(handles.edit21,'String',num2str(yfc*1e3));
set(handles.edit22,'String',num2str(yoc*1e3));
set(handles.edit23,'String',num2str(yrb*1e3));
%set(handles.editPM2,'String',num2str(yfc*1e3));
%set(handles.editestable,'String',num2str(yoc*1e3));
%set(handles.editLinvill,'String',num2str(yrb*1e3));
set(handles.edit31,'String',num2str(yfe*1e3));
set(handles.edit32,'String',num2str(yfb*1e3));
set(handles.edit33,'String',num2str(yoe*1e3));

guidata(hObject, handles);

%color=0.8862745098039215;

function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double

%H=get(hObject,'BackgroundColor')

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function editLinvill_Callback(hObject, eventdata, handles)
% hObject    handle to editLinvill (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editLinvill as text
%        str2double(get(hObject,'String')) returns contents of editLinvill as a double


% --- Executes during object creation, after setting all properties.
function editLinvill_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editLinvill (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function editPM2_Callback(hObject, eventdata, handles)
% hObject    handle to editPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPM2 as text
%        str2double(get(hObject,'String')) returns contents of editPM2 as a double


% --- Executes during object creation, after setting all properties.
function editPM2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function editestable_Callback(hObject, eventdata, handles)
% hObject    handle to editestable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editestable as text
%        str2double(get(hObject,'String')) returns contents of editestable as a double


% --- Executes during object creation, after setting all properties.
function editestable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editestable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit33 as text
%        str2double(get(hObject,'String')) returns contents of edit33 as a double


% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit31 as text
%        str2double(get(hObject,'String')) returns contents of edit31 as a double


% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit32 as text
%        str2double(get(hObject,'String')) returns contents of edit32 as a double


% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function editgi_Callback(hObject, eventdata, handles)
% hObject    handle to editgi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editgi as text
%        str2double(get(hObject,'String')) returns contents of editgi as a double


% --- Executes during object creation, after setting all properties.
function editgi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editgi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function editgo_Callback(hObject, eventdata, handles)
% hObject    handle to editgo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editgo as text
%        str2double(get(hObject,'String')) returns contents of editgo as a double


% --- Executes during object creation, after setting all properties.
function editgo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editgo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function editUU_Callback(hObject, eventdata, handles)
% hObject    handle to editUU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editUU as text
%        str2double(get(hObject,'String')) returns contents of editUU as a double


% --- Executes during object creation, after setting all properties.
function editUU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editUU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function editActivoPasivo_Callback(hObject, eventdata, handles)
% hObject    handle to editActivoPasivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editActivoPasivo as text
%        str2double(get(hObject,'String')) returns contents of editActivoPasivo as a double


% --- Executes during object creation, after setting all properties.
function editActivoPasivo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editActivoPasivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function editSgi_Callback(hObject, eventdata, handles)
% hObject    handle to editSgi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSgi as text
%        str2double(get(hObject,'String')) returns contents of editSgi as a double


% --- Executes during object creation, after setting all properties.
function editSgi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSgi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function editSgo_Callback(hObject, eventdata, handles)
% hObject    handle to editSgo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSgo as text
%        str2double(get(hObject,'String')) returns contents of editSgo as a double


% --- Executes during object creation, after setting all properties.
function editSgo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSgo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in PBStable.
function PBStable_Callback(hObject, eventdata, handles)
% hObject    handle to PBStable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gi=real(handles.parametrosy.ki);
go=real(handles.parametrosy.ko);
yf=handles.parametrosy.kf;
yr=handles.parametrosy.kr;
set(handles.editSgi,'String',num2str(1e3*gi));
set(handles.editSgo,'String',num2str(1e3*go));
M=abs(handles.parametrosy.kf * handles.parametrosy.kr);
P=real(handles.parametrosy.kf * handles.parametrosy.kr);
temp=(P+M)/2;
set(handles.editPM2,'String',num2str(1e3*temp));
if (gi*go >= temp & gi>0 & go>0)
    set(handles.editestable,'String','Incondicionalmete Estable');
else
    set(handles.editestable,'String','Potencialmente Inestable');
end
C=M/(2*gi*go-P);
set(handles.editLinvill,'String',num2str(C));

activo=2*M/(abs(yf)^2+abs(yr)^2);
set(handles.editActvS,'String',num2str(activo));
if (activo < C)
    set(handles.CBAS,'Value',1);
else
    set(handles.CBAS,'Value',0);
end


function editActvS_Callback(hObject, eventdata, handles)
% hObject    handle to editActvS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editActvS as text
%        str2double(get(hObject,'String')) returns contents of editActvS as a double


% --- Executes during object creation, after setting all properties.
function editActvS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editActvS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in CBAS.
function CBAS_Callback(hObject, eventdata, handles)
% hObject    handle to CBAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBAS




% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function editYin_Callback(hObject, eventdata, handles)
% hObject    handle to editYin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYin as text
%        str2double(get(hObject,'String')) returns contents of editYin as a double


% --- Executes during object creation, after setting all properties.
function editYin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function editYout_Callback(hObject, eventdata, handles)
% hObject    handle to editYout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYout as text
%        str2double(get(hObject,'String')) returns contents of editYout as a double


% --- Executes during object creation, after setting all properties.
function editYout_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit29_Callback(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit29 as text
%        str2double(get(hObject,'String')) returns contents of edit29 as a double


% --- Executes during object creation, after setting all properties.
function edit29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit30 as text
%        str2double(get(hObject,'String')) returns contents of edit30 as a double


% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --------------------------------------------------------------------
function m_archivo_Callback(hObject, eventdata, handles)
% hObject    handle to m_archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_preview_Callback(hObject, eventdata, handles)
% hObject    handle to m_preview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%axes(handles.axes1)
printpreview


% --------------------------------------------------------------------
function m_conf_pag_Callback(hObject, eventdata, handles)
% hObject    handle to m_conf_pag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%axes(handles.axes1)
pagesetupdlg

% --------------------------------------------------------------------
function m_print_Callback(hObject, eventdata, handles)
% hObject    handle to m_print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%axes(handles.axes1)
printdlg

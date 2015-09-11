function varargout = S_adapt_Conj(varargin)
% S_ADAPT_CONJ M-file for S_adapt_Conj.fig
%      S_ADAPT_CONJ, by itself, creates a new S_ADAPT_CONJ or raises the existing
%      singleton*.
%
%      H = S_ADAPT_CONJ returns the handle to a new S_ADAPT_CONJ or the handle to
%      the existing singleton*.
%
%      S_ADAPT_CONJ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in S_ADAPT_CONJ.M with the given input arguments.
%
%      S_ADAPT_CONJ('Property','Value',...) creates a new S_ADAPT_CONJ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before S_adapt_Conj_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to S_adapt_Conj_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help S_adapt_Conj

% Last Modified by GUIDE v2.5 17-May-2009 03:59:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @S_adapt_Conj_OpeningFcn, ...
                   'gui_OutputFcn',  @S_adapt_Conj_OutputFcn, ...
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


% --- Executes just before S_adapt_Conj is made visible.
function S_adapt_Conj_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to S_adapt_Conj (see VARARGIN)

% Choose default command line output for S_adapt_Conj
handles.output = hObject;
%Dibujar la carta de smith
axes(handles.axes1)
scplain;
TITLE('SMITH CHART FOR \Gamma_S');
AXIS([-1.2 +1.2 -1.5 +1.3]);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes S_adapt_Conj wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = S_adapt_Conj_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function S11_Callback(hObject, eventdata, handles)
% hObject    handle to S11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of S11 as text
%        str2double(get(hObject,'String')) returns contents of S11 as a double


% --- Executes during object creation, after setting all properties.
function S11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function S12_Callback(hObject, eventdata, handles)
% hObject    handle to S12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of S12 as text
%        str2double(get(hObject,'String')) returns contents of S12 as a double


% --- Executes during object creation, after setting all properties.
function S12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function F12_Callback(hObject, eventdata, handles)
% hObject    handle to F12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of F12 as text
%        str2double(get(hObject,'String')) returns contents of F12 as a double


% --- Executes during object creation, after setting all properties.
function F12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to F12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function S21_Callback(hObject, eventdata, handles)
% hObject    handle to S21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of S21 as text
%        str2double(get(hObject,'String')) returns contents of S21 as a double


% --- Executes during object creation, after setting all properties.
function S21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S21 (see GCBO)
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



function S22_Callback(hObject, eventdata, handles)
% hObject    handle to S22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of S22 as text
%        str2double(get(hObject,'String')) returns contents of S22 as a double


% --- Executes during object creation, after setting all properties.
function S22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


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



function FmindB_Callback(hObject, eventdata, handles)
% hObject    handle to FmindB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FmindB as text
%        str2double(get(hObject,'String')) returns contents of FmindB as a double


% --- Executes during object creation, after setting all properties.
function FmindB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FmindB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function rn_Callback(hObject, eventdata, handles)
% hObject    handle to rn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rn as text
%        str2double(get(hObject,'String')) returns contents of rn as a double


% --- Executes during object creation, after setting all properties.
function rn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% %Dibujar la carta de smith
% axes(handles.axes1)
% scplain;
% TITLE('SMITH CHART FOR \Gamma_S');

axes(handles.axes1)
%Cargar los parámetros
S11=str2num(get(handles.S11,'String'));
S12=str2num(get(handles.S12,'String'));
S21=str2num(get(handles.S21,'String'));
S22=str2num(get(handles.S22,'String'));
F11=str2num(get(handles.F11,'String'));
F12=str2num(get(handles.F12,'String'));
F21=str2num(get(handles.F21,'String'));
F22=str2num(get(handles.F22,'String'));
ropt=str2num(get(handles.ropt,'String'));
Fropt=str2num(get(handles.Fropt,'String'));
FmindB=str2num(get(handles.FmindB,'String'));
rn=str2num(get(handles.rn,'String'));
%en estas primeras líneas se colocan los datos del transistor
s(1,1)=S11*(cos(F11*pi/180)+j*sin(F11*pi/180));
s(2,1)=S21*(cos(F21*pi/180)+j*sin(F21*pi/180));
s(1,2)=S12*(cos(F12*pi/180)+j*sin(F12*pi/180));
s(2,2)=S22*(cos(F22*pi/180)+j*sin(F22*pi/180));
%FmindB=0.29;
%rn=0.06;

%punto de factor de ruido minimo (Gama optima)
xopt=ropt*cos(Fropt*pi/180);
yopt=ropt*sin(Fropt*pi/180);
%aquí se acaban los datos de entrada

det=s(1,1)*s(2,2)-s(1,2)*s(2,1);
%estabilidad incondicional
k=(1+(abs(det))^2-(abs(s(1,1)))^2-(abs(s(2,2)))^2)/2/abs(s(1,2)*s(2,1));
%dibujo la carta de Smith:
AXIS([-1.2 +1.2 -1.5 +1.3]);

%estabilidad a la salida:

denom=((abs(s(1,1)))^2-(abs(det))^2);
centro=(conj(s(1,1))-conj(det)*s(2,2))/denom;
radio=abs(s(1,2)*s(2,1))/abs(denom);

limitinfx=real(centro)-radio;
limitsupx=real(centro)+radio;
x=linspace(limitinfx,limitsupx,1000);
y=[imag(centro)+sqrt(radio^2-(x-real(centro)).^2) imag(centro)-sqrt(radio^2-(x-real(centro)).^2)];
x=[x x];
plot(x,y,'.b');
legend('| \Gamma _2 | =1');
%punto de factor de ruido minimo
plot(xopt,yopt,'*y')
%circulos de factor de ruido constante:
for ii=1:5
    Fmin=10^(FmindB/10);
    FdB=FmindB+0.2*ii;
    F=10^(FdB/10);
n=(F-Fmin)/4/rn*(abs(1+xopt+j*yopt))^2;
centro=(xopt+j*yopt)/(1+n);
radio=sqrt((n*(1+n-(abs(xopt+j*yopt))^2)))/(1+n);
limitinfx=real(centro)-radio;
limitsupx=real(centro)+radio;
x=linspace(limitinfx,limitsupx);
y=real([imag(centro)+sqrt(radio^2-(x-real(centro)).^2) imag(centro)-sqrt(radio^2-(x-real(centro)).^2)]);
x=[x x];
plot(x,y,'.y');
end;
%circulo de estabilidad para gamaL (gamaL=1)
c1=s(1,1)-det*conj(s(2,2));
centro=conj(c1)/(1-(abs(s(2,2)))^2);
radio=abs(s(1,2)*s(2,1))/(1-(abs(s(2,2)))^2);
limitinfx=real(centro)-radio;
limitsupx=real(centro)+radio;
x=linspace(limitinfx,limitsupx);
y=real([imag(centro)+sqrt(radio^2-(x-real(centro)).^2) imag(centro)-sqrt(radio^2-(x-real(centro)).^2)]);
x=[x x];
plot(x,y,'.k');

% uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.05,0.8,0.1,0.05],'string','S(1,1):','hori','left');
%  uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.05,0.75,0.1,0.05],'string','S(1,2):','hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.05,0.7,0.1,0.05],'string','S(2,1):','hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.05,0.65,0.1,0.05],'string','S(2,2):','hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.05,0.6,0.1,0.05],'string','Phase(1,1):','hori','left');
%     uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.05,0.55,0.1,0.05],'string','Phase(1,2):','hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.05,0.5,0.1,0.05],'string','Phase(2,1):','hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.05,0.45,0.1,0.05],'string','Phase(2,2):','hori','left');
%   
%     uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.05,0.4,0.1,0.05],'string','Gamma_opt:','hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.05,0.35,0.1,0.05],'string','Phase_Gamma_opt:','hori','left'); 
%    
%     uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.05,0.3,0.1,0.05],'string','FmindB:','hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.05,0.25,0.1,0.05],'string','rn:','hori','left'); 
%   
%   
%   
%   
%   
%   
%   
%   uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.14,0.8,0.1,0.05],'string',S11,'hori','left');
%  uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.14,0.75,0.1,0.05],'string',S12,'hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.14,0.7,0.1,0.05],'string',S21,'hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.14,0.65,0.1,0.05],'string',S22,'hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.14,0.6,0.1,0.05],'string',F11,'hori','left');
%     uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.14,0.55,0.1,0.05],'string',F12,'hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.14,0.5,0.1,0.05],'string',F21,'hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.14,0.45,0.1,0.05],'string',F22,'hori','left');
%     uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.14,0.4,0.1,0.05],'string',ropt,'hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.14,0.35,0.1,0.05],'string',Fropt,'hori','left'); 
%  
%     uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.16,0.3,0.1,0.05],'string',FmindB,'hori','left');
% 	uicontrol(hw_ACE,'style','text','fore','b','back','w','units','norm','pos',...
%       [0.09,0.25,0.1,0.05],'string',rn,'hori','left'); 
%   

%guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset')
%Dibujar la carta de smith
axes(handles.axes1)
scplain;
TITLE('SMITH CHART FOR \Gamma_S');
AXIS([-1.2 +1.2 -1.5 +1.3]);


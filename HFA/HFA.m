function varargout = HFA(varargin)
% HFA M-file for HFA.fig
%      HFA, by itself, creates a new HFA or raises the existing
%      singleton*.
%
%      H = HFA returns the handle to a new HFA or the handle to
%      the existing singleton*.
%
%      HFA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HFA.M with the given input arguments.
%
%      HFA('Property','Value',...) creates a new HFA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HFA_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HFA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE'pushbutton3 Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help HFA

% Last Modified by GUIDE v2.5 19-May-2009 00:53:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HFA_OpeningFcn, ...
                   'gui_OutputFcn',  @HFA_OutputFcn, ...
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


% --- Executes just before HFA is made visible.
function HFA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HFA (see VARARGIN)

% Choose default command line output for HFA
handles.output = hObject;
% axes(handles.axes1)
% cla(handles.axes1)
% mytexstr = '$\epf S_Upersonic$';
%     h = text('string',mytexstr,...
%              'interpreter','latex',...
%              'fontsize',5,...
%              'units','norm',...
%              'pos',[0 0]);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HFA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HFA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in PBparam.
function PBparam_Callback(hObject, eventdata, handles)
% hObject    handle to PBparam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

h=ParamStab;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Sat_apunt;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S_adapt_Conj



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Unilateral


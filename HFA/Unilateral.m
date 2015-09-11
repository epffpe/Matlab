function varargout = Unilateral(varargin)
% UNILATERAL M-file for Unilateral.fig
%      UNILATERAL, by itself, creates a new UNILATERAL or raises the existing
%      singleton*.
%
%      H = UNILATERAL returns the handle to a new UNILATERAL or the handle to
%      the existing singleton*.
%
%      UNILATERAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNILATERAL.M with the given input arguments.
%
%      UNILATERAL('Property','Value',...) creates a new UNILATERAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Unilateral_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Unilateral_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help Unilateral

% Last Modified by GUIDE v2.5 19-May-2009 21:27:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Unilateral_OpeningFcn, ...
                   'gui_OutputFcn',  @Unilateral_OutputFcn, ...
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


% --- Executes just before Unilateral is made visible.
function Unilateral_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Unilateral (see VARARGIN)

% Choose default command line output for Unilateral
handles.output = hObject;
%Dibujar la carta de smith
axes(handles.axes1)
scplain;
TITLE('SMITH CHART FOR \Gamma_L');
mytexstr = '$y=\frac{G_L}{go} + j\frac{B_L+bo}{go}$';
    h = text('string',mytexstr,...
             'interpreter','latex',...
             'fontsize',20,...
             'units','norm',...
             'pos',[.7 1]);
text('string','\bf{epf Supersonic}',...
     'interpreter','latex',...
     'fontsize',20,...
     'units','norm',...
     'pos',[0 -1.5]);
 set(gcf, 'PaperPositionMode', 'auto');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Unilateral wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Unilateral_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edityi_Callback(hObject, eventdata, handles)
% hObject    handle to edityi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edityi as text
%        str2double(get(hObject,'String')) returns contents of edityi as a double


% --- Executes during object creation, after setting all properties.
function edityi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edityi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edityf_Callback(hObject, eventdata, handles)
% hObject    handle to edityf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edityf as text
%        str2double(get(hObject,'String')) returns contents of edityf as a double


% --- Executes during object creation, after setting all properties.
function edityf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edityf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edityo_Callback(hObject, eventdata, handles)
% hObject    handle to edityo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edityo as text
%        str2double(get(hObject,'String')) returns contents of edityo as a double


% --- Executes during object creation, after setting all properties.
function edityo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edityo (see GCBO)
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
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called





function editG_Callback(hObject, eventdata, handles)
% hObject    handle to editG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editG as text
%        str2double(get(hObject,'String')) returns contents of editG as a double


% --- Executes during object creation, after setting all properties.
function editG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editG (see GCBO)
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
axes(handles.axes1)
G=str2num(get(handles.editG,'String'));
yi=1e-3* str2num(get(handles.edityi,'String'));
yo=1e-3* str2num(get(handles.edityo,'String'));
yf=1e-3* str2num(get(handles.edityf,'String'));
g=10.^(-abs(G)/10);
radio=sqrt(1-g);
for i=1:length(radio)
    phi=linspace(0,2*pi,1000);
    U=radio(i)*cos(phi);
    V=radio(i)*sin(phi);
    plot(U,V,'.y');
%     U=linspace(-radio(i),radio(i),1000);
%     V=[sqrt(radio(i).^2 - U.^2) -sqrt(radio(i).^2 - U.^2)];
%     plot([U U],V,'*y')
    text(U(200),V(200),['\bf' num2str(-abs(G(i))) 'dB']);
end

gpmax=abs(yf)^2/(4*real(yi)*real(yo));
Gpmax=10*log10(gpmax);
text(0,0,['\bfGp_{max}=' num2str(-abs(Gpmax)) 'dB'])
plot(0,0,'*y')

% mytexstr = '$\frac{1}{2}$';
%     h = text('string',mytexstr,...
%              'interpreter','latex',...
%              'fontsize',40,...
%              'units','norm',...
%              'pos',[.5 .5]);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Reset la imagen
cla(handles.axes1,'reset')
%Dibujar la carta de smith
axes(handles.axes1)
scplain;
TITLE('SMITH CHART FOR \Gamma_L');
mytexstr = '$y=\frac{G_L}{go} + j\frac{B_L+bo}{go}$';
    h = text('string',mytexstr,...
             'interpreter','latex',...
             'fontsize',20,...
             'units','norm',...
             'pos',[.7 1]);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
Av=str2num(get(handles.editAv,'String'));
yi=1e-3* str2num(get(handles.edityi,'String'));
yo=1e-3* str2num(get(handles.edityo,'String'));
yf=1e-3* str2num(get(handles.edityf,'String'));
radio=2*abs(Av);
for i=1:length(radio)
    phi=linspace(pi/2,3*pi/2,1000);
    U=1+radio(i)*cos(phi);
    V=radio(i)*sin(phi);
    plot(U,V,'.b')
%     U=linspace(1-radio(i),1,1000);
%     V=[sqrt(radio(i).^2 - (U-1).^2) -sqrt(radio(i).^2 - (U-1).^2)];
%     plot([U U],V,'*b')
    text(U(400),V(400),['\bf' num2str(-abs(Av(i)))]);
end

avmax=abs(yf/real(yo))
Avmax=20*log10(avmax);
h=text(-1.155,0,['\bfAv_{max}=' num2str(abs(avmax))])
h2= text(-1.155,-0.05,['\bf' '=' num2str(abs(Avmax)) ' dB'])
set(h,'HorizontalAlignment', 'right')
set(h2,'HorizontalAlignment', 'right')
plot(-1,0,'*b')
AXIS([-1.2 +1.2 -1.4 +1.2]);

function editAv_Callback(hObject, eventdata, handles)
% hObject    handle to editAv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAv as text
%        str2double(get(hObject,'String')) returns contents of editAv as a double


% --- Executes during object creation, after setting all properties.
function editAv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% % --------------------------------------------------------------------
% function Untitled_4_Callback(hObject, eventdata, handles)
% % hObject    handle to Untitled_4 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% 
% % --------------------------------------------------------------------
% function Untitled_5_Callback(hObject, eventdata, handles)
% % hObject    handle to Untitled_5 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% 
% % --------------------------------------------------------------------
% function Untitled_7_Callback(hObject, eventdata, handles)
% % hObject    handle to Untitled_7 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% 
% % --------------------------------------------------------------------
% function Untitled_1_Callback(hObject, eventdata, handles)
% % hObject    handle to Untitled_1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% 
% % --------------------------------------------------------------------
function m_Archivo_Callback(hObject, eventdata, handles)
% hObject    handle to m_Archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_preview_Callback(hObject, eventdata, handles)
% hObject    handle to m_preview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
printpreview

% --------------------------------------------------------------------
function m_conf_pag_Callback(hObject, eventdata, handles)
% hObject    handle to m_conf_pag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
pagesetupdlg
% --------------------------------------------------------------------
function m_imprimir_Callback(hObject, eventdata, handles)
% hObject    handle to m_imprimir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
printdlg


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
yi=1e-3* str2num(get(handles.edityi,'String'));
%yo=1e-3* str2num(get(handles.edityo,'String'));
yf=1e-3* str2num(get(handles.edityf,'String'));
yo=str2num(get(handles.edityo,'String'));
go=real(yo);
bo=imag(yo);
[x y]=ginput(1);
tau=x+y*j;
set(handles.edittau,'String',num2str(tau))
set(handles.editmod,'String',num2str(abs(tau)))
set(handles.editphase,'String',num2str(angle(tau)*180/pi))
ynorm=(1+tau)/(1-tau);
g=real(ynorm);
b=imag(ynorm);
GL=real(ynorm)*go;
BL=imag(ynorm)*go - bo;
YL=GL + BL*j;
set(handles.editYL,'String',num2str(YL))
g11=real(yi);
g22=1e-3*go;
gp=abs(yf)^2*g/(g11*g22*((g+1)^2+b^2));
Gp=10*log10(gp);
av=abs(yf/g22)^2/((g+1)^2 + b^2);
set(handles.edit_gp,'String',num2str(Gp))
set(handles.edit_gv,'String',num2str(av))

function editYL_Callback(hObject, eventdata, handles)
% hObject    handle to editYL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYL as text
%        str2double(get(hObject,'String')) returns contents of editYL as a double


% --- Executes during object creation, after setting all properties.
function editYL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edittau_Callback(hObject, eventdata, handles)
% hObject    handle to edittau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edittau as text
%        str2double(get(hObject,'String')) returns contents of edittau as a double


% --- Executes during object creation, after setting all properties.
function edittau_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edittau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function editmod_Callback(hObject, eventdata, handles)
% hObject    handle to editmod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editmod as text
%        str2double(get(hObject,'String')) returns contents of editmod as a double


% --- Executes during object creation, after setting all properties.
function editmod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editmod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function editphase_Callback(hObject, eventdata, handles)
% hObject    handle to editphase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editphase as text
%        str2double(get(hObject,'String')) returns contents of editphase as a double


% --- Executes during object creation, after setting all properties.
function editphase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editphase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function edit_gp_Callback(hObject, eventdata, handles)
% hObject    handle to edit_gp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_gp as text
%        str2double(get(hObject,'String')) returns contents of edit_gp as a double


% --- Executes during object creation, after setting all properties.
function edit_gp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit_gv_Callback(hObject, eventdata, handles)
% hObject    handle to edit_gv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_gv as text
%        str2double(get(hObject,'String')) returns contents of edit_gv as a double


% --- Executes during object creation, after setting all properties.
function edit_gv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



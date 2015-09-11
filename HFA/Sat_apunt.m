function varargout = Sat_apunt(varargin)
% SAT_APUNT M-file for Sat_apunt.fig
%      SAT_APUNT, by itself, creates a new SAT_APUNT or raises the existing
%      singleton*.
%
%      H = SAT_APUNT returns the handle to a new SAT_APUNT or the handle to
%      the existing singleton*.
%
%      SAT_APUNT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAT_APUNT.M with the given input arguments.
%
%      SAT_APUNT('Property','Value',...) creates a new SAT_APUNT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sat_apunt_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sat_apunt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help Sat_apunt

% Last Modified by GUIDE v2.5 24-Apr-2009 19:38:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sat_apunt_OpeningFcn, ...
                   'gui_OutputFcn',  @Sat_apunt_OutputFcn, ...
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


% --- Executes just before Sat_apunt is made visible.
function Sat_apunt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sat_apunt (see VARARGIN)

% Choose default command line output for Sat_apunt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.pop_lonant,'Value',2)
% UIWAIT makes Sat_apunt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sat_apunt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function lon_sat_Callback(hObject, eventdata, handles)
% hObject    handle to lon_sat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lon_sat as text
%        str2double(get(hObject,'String')) returns contents of lon_sat as a double


% --- Executes during object creation, after setting all properties.
function lon_sat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lon_sat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function lon_est_Callback(hObject, eventdata, handles)
% hObject    handle to lon_est (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lon_est as text
%        str2double(get(hObject,'String')) returns contents of lon_est as a double


% --- Executes during object creation, after setting all properties.
function lon_est_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lon_est (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function lat_est_Callback(hObject, eventdata, handles)
% hObject    handle to lat_est (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lat_est as text
%        str2double(get(hObject,'String')) returns contents of lat_est as a double


% --- Executes during object creation, after setting all properties.
function lat_est_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lat_est (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
val = get(hObject,'Value');
string_list = get(hObject,'String');
selected_string = string_list{val};
switch selected_string
case 'Astra'
set(handles.lon_sat,'String',19)
set(handles.pop_lonsat,'Value',1)
case 'EUTELSAT'
set(handles.lon_sat,'String',13)
set(handles.pop_lonsat,'Value',1)
case 'HISPASAT-1B'
set(handles.lon_sat,'String',31)
set(handles.pop_lonsat,'Value',2)
case 'METEOSAT-7'
set(handles.lon_sat,'String',0)
set(handles.pop_lonsat,'Value',1)
case 'GOES-8'
set(handles.lon_sat,'String',75)
set(handles.pop_lonsat,'Value',2)
case 'INMARSAT-POR'
set(handles.lon_sat,'String',178)
set(handles.pop_lonsat,'Value',1)
case 'INMARSAT-AOR/W'
set(handles.lon_sat,'String',54)
set(handles.pop_lonsat,'Value',2)
case 'INMARSAT-AOR/E'
set(handles.lon_sat,'String',15.5)
set(handles.pop_lonsat,'Value',2)
case 'INMARSAT-IOR'
set(handles.lon_sat,'String',64)
set(handles.pop_lonsat,'Value',1)
end
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function e_distancia_Callback(hObject, eventdata, handles)
% hObject    handle to e_distancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_distancia as text
%        str2double(get(hObject,'String')) returns contents of e_distancia as a double


% --- Executes during object creation, after setting all properties.
function e_distancia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_distancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in pb_acimut.
function pb_acimut_Callback(hObject, eventdata, handles)
% hObject    handle to pb_acimut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.pop_lonsat,'Value')==1)
    lon_sat = abs(str2num(get(handles.lon_sat,'String')));
else
    lon_sat = - abs(str2num(get(handles.lon_sat,'String')));
end
if(get(handles.pop_lonant,'Value')==1)
    lon_ant = abs(str2num(get(handles.lon_est, 'String')));
else
    lon_ant = - abs(str2num(get(handles.lon_est, 'String')));
end
if(get(handles.pop_latant,'Value')==1)
    lat_ant= abs(str2num (get(handles.lat_est, 'String')));
else
    lat_ant= -abs(str2num (get(handles.lat_est, 'String')));
end


Ro=35786;   %Altura de la orbita geoestacionaria
Rt=6378;    %radio medio de la tierra en Km
L=abs(lon_sat - lon_ant);   %diferencia de longitudes

a=(180/pi)*atan(tan(L*pi/180)/sin(lat_ant*pi/180));
if (lon_sat < lon_ant)     %Satélite al oeste de la antena
    if (lat_ant > 0)         %Hemisferio norte
        A=180 + a;
    else                    %Hemisferio Sur
        A=360 - a;
    end
else                        %Satélite al este de la antena
    if (lat_ant > 0)         %Hemisferio norte
        A=180 - a;
    else
        A = a;
    end
end
set(handles.e_acimut,'String',A);
% --- Executes on button press in pb_elevacion.
function pb_elevacion_Callback(hObject, eventdata, handles)
% hObject    handle to pb_elevacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.pop_lonsat,'Value')==1)
    lon_sat = abs(str2num(get(handles.lon_sat,'String')));
else
    lon_sat = - abs(str2num(get(handles.lon_sat,'String')));
end
if(get(handles.pop_lonant,'Value')==1)
    lon_ant = abs(str2num(get(handles.lon_est, 'String')));
else
    lon_ant = - abs(str2num(get(handles.lon_est, 'String')));
end
if(get(handles.pop_latant,'Value')==1)
    lat_ant= abs(str2num (get(handles.lat_est, 'String')));
else
    lat_ant= -abs(str2num (get(handles.lat_est, 'String')));
end
% lon_sat = abs(str2num(get(handles.lon_sat,'String')));
% lon_ant = abs(str2num(get(handles.lon_est, 'String')));
% lat_ant= abs(str2num (get(handles.lat_est, 'String')));

Ro=35786;   %Altura de la orbita geoestacionaria
Rt=6378;    %radio medio de la tierra en Km
L=abs(lon_sat - lon_ant);   %diferencia de longitudes

e=(180/pi)*atan((cos(lat_ant*pi/180)*cos(L*pi/180)-(Rt/(Rt+Ro)))/sqrt(1-(cos(lat_ant*pi/180)*cos(L*pi/180))^2));
set(handles.e_elevacion,'String',e);
% --- Executes on button press in pb_distancia.
function pb_distancia_Callback(hObject, eventdata, handles)
% hObject    handle to pb_distancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.pop_lonsat,'Value')==1)
    lon_sat = abs(str2num(get(handles.lon_sat,'String')));
else
    lon_sat = - abs(str2num(get(handles.lon_sat,'String')));
end
if(get(handles.pop_lonant,'Value')==1)
    lon_ant = abs(str2num(get(handles.lon_est, 'String')));
else
    lon_ant = - abs(str2num(get(handles.lon_est, 'String')));
end
if(get(handles.pop_latant,'Value')==1)
    lat_ant= abs(str2num (get(handles.lat_est, 'String')));
else
    lat_ant= -abs(str2num (get(handles.lat_est, 'String')));
end

Ro=35786;   %Altura de la orbita geoestacionaria
Rt=6378;    %radio medio de la tierra en Km
L=abs(lon_sat - lon_ant);   %diferencia de longitudes

d=Ro*sqrt(1+0.42*(1-cos(lat_ant*pi/180)*cos(L*pi/180)));
set(handles.e_distancia,'String',d);


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
val = get(hObject,'Value');
string_list = get(hObject,'String');
selected_string = string_list{val};
switch selected_string
case 'Tafira'
set(handles.lon_est,'String',15.451)
set(handles.pop_lonant,'Value',2)
set(handles.lat_est,'String',28.074)
set(handles.pop_latant,'Value',1)
case 'Casa'
set(handles.lon_sat,'String',15)
set(handles.pop_lonsat,'Value',1)
set(handles.lat_est,'String',28)
set(handles.pop_latant,'Value',1)
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on selection change in pop_lonant.
function pop_lonant_Callback(hObject, eventdata, handles)
% hObject    handle to pop_lonant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns pop_lonant contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_lonant


% --- Executes during object creation, after setting all properties.
function pop_lonant_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_lonant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in pop_latant.
function pop_latant_Callback(hObject, eventdata, handles)
% hObject    handle to pop_latant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns pop_latant contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_latant


% --- Executes during object creation, after setting all properties.
function pop_latant_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_latant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in pop_lonsat.
function pop_lonsat_Callback(hObject, eventdata, handles)
% hObject    handle to pop_lonsat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns pop_lonsat contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_lonsat


% --- Executes during object creation, after setting all properties.
function pop_lonsat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_lonsat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over lon_sat.
function lon_sat_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to lon_sat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


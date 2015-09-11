%COMUNICACION_SERIE M-Code for communicating with an instrument.
%
%   This is the machine generated represenation of an instrument control
%   session. The instrument control session comprises all the steps you are
%   likely to take when communicating with your instrument. These steps are:
%   
%       1. Create an instrument object
%       2. Connect to the instrument
%       3. Configure properties
%       4. Write and read data
%       5. Disconnect from the instrument
% 
%   To run the instrument control session, type the name of the M-file,
%   comunicacion_serie, at the MATLAB command prompt.
% 
%   The M-file, COMUNICACION_SERIE.M must be on your MATLAB PATH. For additional information 
%   on setting your MATLAB PATH, type 'help addpath' at the MATLAB command 
%   prompt.
% 
%   Example:
%       comunicacion_serie;
% 
%   See also SERIAL, GPIB, TCPIP, UDP, VISA.
% 
 
%   Creation time: 03-Feb-2009 04:46:35

% Create a serial port object.
obj1 = instrfind('Type', 'serial', 'Port', 'COM3', 'Tag', '');

% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(obj1)
    obj1 = serial('COM3');
else
    fclose(obj1);
    obj1 = obj1(1)
end

% Connect to instrument object, obj1.
fopen(obj1);

% Communicating with instrument object, obj1.
fprintf(obj1, 'helo');
data1 = fscanf(obj1);
data2 = query(obj1, 'helo');
fprintf(obj1, '%c', 'helo');
data3 = fscanf(obj1);
fprintf(obj1, '%c\n', 'helo');
data4 = fscanf(obj1);
fprintf(obj1, '%c\n', 'helo');
data5 = fscanf(obj1);
fprintf(obj1, '%c\n', 'helo');
data6 = fscanf(obj1);
fprintf(obj1, '%c\n', 'helo');
data7 = fscanf(obj1);
fprintf(obj1, 'helo');
data8 = fscanf(obj1);
data9 = fscanf(obj1);
data10 = fscanf(obj1);
data11 = fscanf(obj1);
data12 = fscanf(obj1);
data13 = fscanf(obj1);
data14 = fscanf(obj1, '%s\n');
data15 = fscanf(obj1, '%s\n');
data16 = fscanf(obj1, '%s\n');
data17 = fscanf(obj1, '%s\n');
data18 = fscanf(obj1, '%s\n');
data19 = fscanf(obj1, '%s\n');
data20 = fscanf(obj1, '%s\n');

% Disconnect all objects.
fclose(obj1);

% Clean up all objects.
delete(obj1);


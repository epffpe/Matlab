%Create a device object -- Create the analog input object ai for a sound card. 
ai = analoginput('winsound');
%Add channels -- Add two hardware channels to ai. 
addchannel(ai,1:2);
%Configure property values -- Configure the sampling rate to 44.1 kHz and collect 1 second of data (44,100 samples) for each channel. 
set(ai,'SampleRate',44100)
set(ai,'SamplesPerTrigger',44100)
%Acquire data -- Start the acquisition. When all the data is acquired, ai automatically stops executing. 
start(ai)
data = getdata(ai);
plot(data)
%Clean up -- When you no longer need ai, you should remove it from memory and from the MATLAB workspace. 
delete(ai)
clear ai

%Create a device object -- Create the analog output object ao for a sound card. 
ao = analogoutput('winsound');
%Add channels -- Add two hardware channels to ao. 
addchannel(ao,1:2);
%Configure property values -- Configure the sampling rate to 44.1 kHz for each channel. 
set(ao,'SampleRate',44100)
%Output data -- Create 1 second of output data, and queue the data in the engine for eventual output to the analog output subsystem. You must queue one column of data for each hardware channel added. 
data = sin(linspace(0,2*pi*500,44100)');
putdata(ao,[data data])
%Start the output. When all the data is output, ao automatically stops executing. 
start(ao)
%Clean up -- When you no longer need ao, you should remove it from memory and from the MATLAB workspace. 
delete(ao)
clear ao

%%Analizador de espectro
figure

blocksize=1024;
Fs=8000;
while(1)
vocal=wavrecord(blocksize,Fs,'double');
V=abs(fft(vocal));
mag = 20*log10(V);
mag = mag(1:floor(blocksize/2));
f = (0:length(mag)-1)*Fs/blocksize;
f = f(:);
[ymax,maxindex]= max(mag);
plot(f,mag)
axis([0 Fs/2 -60 60])
grid on 
ylabel('Magnitude (dB)')
xlabel('Frequency (Hz)')
pause(0.1)
end


%Analizador de un diapazon para ajustar instrumentos

blocksize=2^13;
Fs=44100;
Wp=[400 500]*2/Fs;
Ws=[300 600]*2/Fs;
[N Wn]=cheb2ord(Wp, Ws, 0.5, 20);
[B, A]=cheby2(N,0.5,Wn);
while(1)
vocal=wavrecord(blocksize,Fs,'double');
y=filter(B,A,vocal);
V=abs(fft(y));
mag = 20*log10(V);
mag = mag(1:floor(blocksize/2));
f = (0:length(mag)-1)*Fs/blocksize;
f = f(:);
[ymax,maxindex]= max(mag);
plot(f,mag)
axis([400 500 -40 60])
grid on 
ylabel('Magnitude (dB)')
xlabel('Frequency (Hz)')
pause(0.1)
end


%osciloscopio

ai = analoginput('mcc',0)
addchannel(ai,0:1)
softscope(ai)


%Create a device object -- Create the analog input object AI for a sound card. The installed adaptors and hardware IDs are found with daqhwinfo. 
AI = analoginput('winsound');
%Add channels -- Add one channel to AI. 
chan = addchannel(AI,1);
%Configure property values -- Assign values to the basic setup properties, and create the variables blocksize and Fs, which are used for subsequent analysis. The actual sampling rate is retrieved because it might be set by the engine to a value that differs from the specified value. 
duration = 0.1; %1 second acquisition
set(AI,'SampleRate',44100)
ActualRate = get(AI,'SampleRate');
set(AI,'SamplesPerTrigger',duration*ActualRate)
set(AI,'TriggerType','Manual')
blocksize = get(AI,'SamplesPerTrigger');
Fs = ActualRate;
%Acquire data -- Start AI, issue a manual trigger, and extract all data from the engine. Before trigger is issued, you should begin inputting data from the tuning fork into the sound card. 
Wp=[400 500]*2/Fs;
Ws=[300 600]*2/Fs;
[N Wn]=cheb2ord(Wp, Ws, 0.5, 20);
[B, A]=cheby2(N,0.5,Wn);

while(1)
start(AI)
trigger(AI)
data = getdata(AI);
y=filter(B,A,data);
V=abs(fft(y));
mag = 20*log10(V);
mag = mag(1:floor(blocksize/2));
f = (0:length(mag)-1)*Fs/blocksize;
f = f(:);
[ymax,maxindex]= max(mag);
plot(f,mag)
axis([400 500 -40 60])
grid on 
ylabel('Magnitude (dB)')
xlabel('Frequency (Hz)')
pause(0.05)
end

%Clean up -- When you no longer need AI, you should remove it from memory and from the MATLAB workspace. 
delete(AI)
clear AI
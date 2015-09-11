%Acquiring Data with a Sound Card

%Create a device object -- Create the analog input object AI for a sound card. The installed adaptors and hardware IDs are found with daqhwinfo. 
AI = analoginput('winsound');
%Add channels -- Add one channel to AI. 
chan = addchannel(AI,1);
%Configure property values -- Assign values to the basic setup properties, and create the variables blocksize and Fs, which are used for subsequent analysis. The actual sampling rate is retrieved because it might be set by the engine to a value that differs from the specified value. 
duration = 1; %1 second acquisition
set(AI,'SampleRate',8000)
ActualRate = get(AI,'SampleRate');
set(AI,'SamplesPerTrigger',duration*ActualRate)
set(AI,'TriggerType','Manual')
blocksize = get(AI,'SamplesPerTrigger');
Fs = ActualRate;
%Acquire data -- Start AI, issue a manual trigger, and extract all data from the engine. Before trigger is issued, you should begin inputting data from the tuning fork into the sound card. 
start(AI)
trigger(AI)
data = getdata(AI);
%Clean up -- When you no longer need AI, you should remove it from memory and from the MATLAB workspace. 
delete(AI)
clear AI

%    [F,MAG]=DAQDOCFFT(X,FS,BLOCKSIZE) calculates the FFT of X
%    using sampling frequency FS and the SamplesPerTrigger
%    provided in BLOCKSIZE

xfft = abs(fft(data));

% Avoid taking the log of 0.
index = find(xfft == 0);
xfft(index) = 1e-17;

mag = 20*log10(xfft);
mag = mag(1:floor(blocksize/2));
f = (0:length(mag)-1)*Fs/blocksize;
f = f(:);

plot(f,mag)
grid on 
ylabel('Magnitude (dB)')
xlabel('Frequency (Hz)')
title('Frequency Components of Tuning Fork')
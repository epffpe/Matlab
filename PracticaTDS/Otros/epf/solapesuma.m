%load spcap3;
%fs=8000;
%voz=wavrecor(3*fs,fs,'double');
%wavwrite(voz,fs,16,'3.wav');


%%solape gurardar
long=length(voz);
L=256;
P=length(h);
%vozext=[zeros(P-1,1),voz];
M=length(voz);
D=L-(P-1);
nt=ceil(long/D);
vm=nt*D+L;
voze=[voz,zeros(vm-M,1)];
H=fft(h,L);
yt=[];
for i=0:nt-1
    t=voz(i*D+1:i*D+1+L);
    y=ifft(fft(t).*H);
    yt=[yt,y(P:end)];
end
plot(yt);
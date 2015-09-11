n=[0:1999];
x=sin(0.3*pi*n)+sin(0.5*pi*n)+randn(1,2000)*0.1;
h=spectrum.periodogram;
figure(1)
psd(h,x)
figure(2)
h.WindowName='hamming';
psd(h,x)
%usamos el estimador welch y modificamos sus parametros para ver las
%diferentes respuestas
figure(3)
hw=spectrum.welch;
hw.SegmentLength=128;
hw.OverlapPercent=50;
psd(hw,x);
figure(4)
hw.SegmentLength=64;
psd(hw,x);
figure(5)
hw.SegmentLength=32;
psd(hw,x);
figure(6)
hw=spectrum.welch;
hw.SegmentLength=128;
hw.OverlapPercent=30;
psd(hw,x);
figure(7)
hw=spectrum.welch;
hw.SegmentLength=128;
hw.OverlapPercent=70;
psd(hw,x);
figure(8)
hw=spectrum.welch;
hw.SegmentLength=128;
hw.OverlapPercent=99;
psd(hw,x);
%espectograma
figure(9)
n=[0:19999];
x=sin(0.3*pi*n)+sin(0.5*pi*n)+randn(1,20000)*0.1;
axis xy
spectrogram(x,hamming(128),64);
t=0:0.001:2;                    % 2 secs @ 1kHz sample rate
y=chirp(t,100,1,200,'q'); %  funcion que  modifica la frecuencia con el tiempo
spectrogram(y,hamming(128),64,'yaxis');
%grabamos nuestra propia voz intentando modificar la frecuencia y hacemos
%el spectrograma
a=wavrecord(8000,8000,'double');
spectrogram(a,hamming(512),64,'yaxis');

%reconocimiento de voz;
%grabamos todas las vocales y hacemos su cepstrum
a=wavrecord(8000,8000,'double');
e=wavrecord(8000,8000,'double');
i=wavrecord(8000,8000,'double');
o=wavrecord(8000,8000,'double');
u=wavrecord(8000,8000,'double');
a=a(1001:end-1000);
ca=rceps(a);
ca=ca(2:14);
e=e(1001:end-1000);
ce=rceps(e);
ce=ce(2:14);
i=i(1001:end-1000);
ci=rceps(i);
ci=ci(2:14);
o=o(1001:end-1000);
co=rceps(o);
co=co(2:14);
u=u(1001:end-1000);
cu=rceps(u);
cu=cu(2:14);

disp('grabe su vocal')
pause
test=wavrecord(8000,8000,'double');
test=test(1001:end-1000);
ct=rceps(test);
ct=ct(2:14);

ta=sum(abs(ct-ca))
te=sum(abs(ct-ce))
ti=sum(abs(ct-ci))
to=sum(abs(ct-co))
tu=sum(abs(ct-cu))

total=[ta te ti to tu]';

[d,vocal]=min(total)




%prueba grabado por el otro
a1=wavrecord(8000,8000,'double');
e1=wavrecord(8000,8000,'double');
a1=a1(1001:end-1000);
ca1=rceps(a1);
ca1=ca1(2:14);
e1=e1(1001:end-1000);
ce1=rceps(e1);
ce1=ce1(2:14);

verdadera=sum(abs(ca1-ca))
falsa=sum(abs(ca1-ce))
min(verdadera,falsa)

verdadera1=sum(abs(ce1-ce))
falsa1=sum(abs(ce1-ca))
min(verdadera1,falsa1)

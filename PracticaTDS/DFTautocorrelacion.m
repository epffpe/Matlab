%Calclulo de la magnitud de la DFT mediante la autocorrelacion
w=0.3*pi;
L=64;
N=127;
x=[0:L-1];
s=sin(w*x);
S=fft(s,N);
mag=abs(S).^2;
plot(2*[0:N-1]/N,mag)
shg

r=xcorr(s);
R=fft(r,N);
hold on
plot(2*[0:N-1]/N,abs(R),'r')
shg

error=sum(abs(mag-abs(R)).^2);
fprintf('Error cuadratico medio : %d\n',error);
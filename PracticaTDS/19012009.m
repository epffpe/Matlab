s=sin(0.3*pi.*[0:999])+randn(1,1000)*0.3;
a=lpc(s,2);
figure(1)
freqz(1,a)
h=spectrum.welch;
figure(2)
psd(h,s)

avoz=wavrecord(8000*4,8000,'double');

pp=zeros(1,(8000*4));
pp(1:160)=avoz(1:160);
[app,Gc]=lpc(pp,14);
y=filter(sqrt(Gc),app,randn(80,1));
ytotal(1:80)=y(1:80);
for n=1:398
    pp=avoz(80*n:(160+80*n));
    [app,Gc]=lpc(pp,14);
    y=filter(sqrt(Gc),app,randn(80,1));
    ytotal(80*n:(79+80*n))=y';
end



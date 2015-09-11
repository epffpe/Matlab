%programa para dibujar los circulos de estabilidad en la Carta de Smith para ACE.
scplain;
TITLE('CARTA DE SMITH PARA LA \Gamma_S');
%en estas primeras líneas se colocan los datos del transistor
s(1,1)=0.69*(cos(-162*pi/180)+j*sin(-162*pi/180));
s(2,1)=4.762*(cos(62*pi/180)+j*sin(62*pi/180));
s(1,2)=0.102*(cos(7*pi/180)+j*sin(7*pi/180));
s(2,2)=0.23*(cos(-156*pi/180)+j*sin(-156*pi/180));
FmindB=0.29;
rn=0.06;
%punto de factor de ruido minimo (Gama optima)
xopt=0.59*cos(102*pi/180);
yopt=0.59*sin(102*pi/180);

%aquí se acaban los datos de entrada

det=s(1,1)*s(2,2)-s(1,2)*s(2,1);
%estabilidad incondicional
k=(1+(abs(det))^2-(abs(s(1,1)))^2-(abs(s(2,2)))^2)/2/abs(s(1,2)*s(2,1))
%dibujo la carta de Smith:
AXIS([-1.2 +1.2 -1.5 +1.3])


%estabilidad a la salida:

denom=((abs(s(1,1)))^2-(abs(det))^2);
centro=(conj(s(1,1))-conj(det)*s(2,2))/denom;
radio=abs(s(1,2)*s(2,1))/abs(denom);

limitinfx=real(centro)-radio;
limitsupx=real(centro)+radio;
x=linspace(limitinfx,limitsupx,1000);
y=[imag(centro)+sqrt(radio^2-(x-real(centro)).^2) imag(centro)-sqrt(radio^2-(x-real(centro)).^2)];
x=[x x];
legend('| \Gamma _2 | =1');
plot(x,y,'.b');


%punto de factor de ruido minimo
plot(xopt,yopt,'*y')
%circulos de factor de ruido constante:
for ii=1:5
    Fmin=10^(FmindB/10);
    FdB=FmindB+0.2*ii;
    F=10^(FdB/10);
n=(F-Fmin)/4/rn*(abs(1+xopt+j*yopt))^2;
centro=(xopt+j*yopt)/(1+n);
radio=sqrt((n*(1+n-(abs(xopt+j*yopt))^2)))/(1+n);
limitinfx=real(centro)-radio;
limitsupx=real(centro)+radio;
x=linspace(limitinfx,limitsupx);
y=[imag(centro)+sqrt(radio^2-(x-real(centro)).^2) imag(centro)-sqrt(radio^2-(x-real(centro)).^2)];
x=[x x];
plot(x,y,'.y');
end;
%circulo de estabilidad para gamaL (gamaL=1)
c1=s(1,1)-det*conj(s(2,2));
centro=conj(c1)/(1-(abs(s(2,2)))^2);
radio=abs(s(1,2)*s(2,1))/(1-(abs(s(2,2)))^2);
limitinfx=real(centro)-radio;
limitsupx=real(centro)+radio;
x=linspace(limitinfx,limitsupx);
y=[imag(centro)+sqrt(radio^2-(x-real(centro)).^2) imag(centro)-sqrt(radio^2-(x-real(centro)).^2)];
x=[x x];
plot(x,y,'.k');
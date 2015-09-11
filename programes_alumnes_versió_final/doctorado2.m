%programa para dibujar los circulos de estabilidad en la Carta de Smith para F=F1 Y M=M1.
%representacion de la carta de smith
scplain;
TITLE('CARTA DE SMITH PARA LA \Gamma_L');
%en estas primeras líneas se colocan los datos del transistor
s(1,1)=0.69*(cos(-162*pi/180)+j*sin(-162*pi/180));
s(2,1)=4.762*(cos(62*pi/180)+j*sin(62*pi/180));
s(1,2)=0.102*(cos(7*pi/180)+j*sin(7*pi/180));
s(2,2)=0.23*(cos(-156*pi/180)+j*sin(-156*pi/180));
FmindB=0.29;
rn=0.06;
%punto de factor de ruido minimo (Gama optima)
x=0.59*cos(102*pi/180);
y=0.59*sin(102*pi/180);

%aquí se acaban los datos de entrada


% VALORES A ESCOGER. PROBAR VARIAS OPCIONES!!
%FACTOR DE RUIDO A LA ENTRADA
FdB=0.32; %por encima del valor mínimo. Escoger un valor adecuado!!!
% Escogemos el valor de la desadaptacion a la entrada:
M1=1.2;
%escogemos la separación entre los círculos de ganancia de potencia (se dibujaran 10)
%Gp=incrgp*(ii-1);%10 valores para Gp (en lineal) se puede cambiar 

incrgp=5;%es un valor de incremento en unidades lineales. 

det=s(1,1)*s(2,2)-s(1,2)*s(2,1);
%estabilidad incondicional
k=(1+(abs(det))^2-(abs(s(1,1)))^2-(abs(s(2,2)))^2)/2/abs(s(1,2)*s(2,1))
%dibujo la carta de Smith:
AXIS([-1.2 +1.2 -1.5 +1.3]);


F=10^(FdB/10);
Fmin=10^(FmindB/10);

n=(F-Fmin)/4/rn*(abs(1+x+j*y))^2;
centro=(x+j*y)/(1+n);
radio=sqrt((n*(1+n-(abs(x+j*y))^2)))/(1+n);
limitinfx=real(centro)-radio;
limitsupx=real(centro)+radio;
x=linspace(limitinfx,limitsupx,100);
y=[imag(centro)+sqrt(radio^2-(x-real(centro)).^2) imag(centro)-sqrt(radio^2-(x-real(centro)).^2)];
x=[x x];
%plot(x,y,'.y');
%Hemos de escoger n puntos sobre este círculo que son justo los anteriores:
gamas=x+j*y;%tengo 100 puntos.
for ii=1:200
   m1=M1*(1-abs(gamas(ii))^2);
   term1=conj((s(2,2))-det*conj(s(1,1)));
   term2=gamas(ii)*det-s(2,2);
   term3=1-gamas(ii)*s(1,1);
   num=m1*term1+conj(term2)*term3;
   term4=abs(s(2,2))^2-abs(det)^2;
   denom=m1*term4-abs(term2)^2;
   centro=num/denom;
   radio=sqrt(abs(centro)^2+(abs(term3)^2-m1*(1-abs(s(1,1)^2)))/denom);
   limitinfx=real(centro)-radio;
   limitsupx=real(centro)+radio;
   x=linspace(limitinfx,limitsupx,1000);
   y=[imag(centro)+sqrt(radio^2-(x-real(centro)).^2) imag(centro)-sqrt(radio^2-(x-real(centro)).^2)];
   x=[x x];
   plot(x,y,'.y');
end
%circulo estabilidad para gama_1 (gama_1=1)   

denom=((abs(s(2,2)))^2-(abs(det))^2);
centro=(conj(s(2,2))-conj(det)*s(1,1))/denom;
radio=abs(s(1,2)*s(2,1))/abs(denom);

limitinfx=real(centro)-radio;
limitsupx=real(centro)+radio;
x=linspace(limitinfx,limitsupx,1000);
y=[imag(centro)+sqrt(radio^2-(x-real(centro)).^2) imag(centro)-sqrt(radio^2-(x-real(centro)).^2)];
x=[x x];
plot(x,y,'.b');

%circulos de ganancia Gp constante:
for ii=1:20
   Gp=incrgp*(ii-1);%10 valores para Gp que estan entre 0 y 45 (en lineal) se puede cambiar 
   %valores de la ganancia en dB:
   GpdB=10*log10(Gp)
   g=Gp/abs(s(2,1))^2;
   c2=s(2,2)-det*conj(s(1,1));
   term1=abs(s(2,2))^2-abs(det)^2;
   centro=g*conj(c2)/(1+g*term1);
   radio=sqrt(abs(s(1,2)*s(2,1))^2*g^2-2*k*abs(s(1,2)*s(2,1))*g+1)/abs(1+g*term1);
   limitinfx=real(centro)-radio;
   limitsupx=real(centro)+radio;
   x=linspace(limitinfx,limitsupx);
   y=[imag(centro)+sqrt(radio^2-(x-real(centro)).^2) imag(centro)-sqrt(radio^2-(x-real(centro)).^2)];
   x=[x x];
   plot(x,y,'.k');
end

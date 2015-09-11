                     %%%%%%%%%%%%%%PRACTICA TEMA2 CURSO 06-07%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%METODO CIFRADO DE VOZ%%%%%%%%%%%%%%%%%%%%

load spcap2;
bcifrado=[1.0000 -2.6515 3.7329 -3.5249 1.4256];
acifrado=[1.0000 3.4630 4.6134 2.8050 0.6561];
ceros=roots(bcifrado);   %calculo sus ceros 
polos=roots(acifrado);   %calculo sus polos
fprintf('modulo y fase de los ceros de Hcifrado(z)\n');
mod_ceros=abs(ceros) %modulo de los ceros  (es el radio)
fase_ceros=180/pi*angle(ceros)  %fase de los ceros, en grados, ya que angle me lo da en radianes
fprintf('modulo y fase de los polos de Hcifrado(z)\n');
mod_polos=abs(polos)
fase_polos=180/pi*angle(polos)
pause;

clf;zplane(ceros,polos); %Diagrama de polos y ceros
title('polos y ceros de Hcifrado(z)');
pause;

x=[1 zeros(1,399)];
h=filter(bcifrado,acifrado,x); %Calculo su respuesta al impulso
clf;subplot(221);plot([0:199],h);grid;
title('respuesta al impulso h[n] de Hcifrado(z)');
pause;

[H,w]=freqz(bcifrado,acifrado,256);   %Calculo su magnitud
subplot(222);semilogy(w/(pi),abs(H).^2);grid;
title('MAGNITUD DE Hcifrado(z)');
pause;


subplot(223);plot(w/pi,unwrap(angle(H)));grid;
title('FASE CONTINUA DE Hcifrado(z)');
pause;

GdH=grpdelay(bcifrado,acifrado,256);
subplot(224);plot(w/pi,GdH);grid;
title('RETARDO DE GRUPO DE Hcifrado(z)');
pause;
%Sistema IIR porque tiene polos
%Causal y estable porque todos los polos estan dentro del circulo unidad
%Es paso alto porque los polos estan en pi
%No es fase minima porque hay ceros fuera del circulo unidad
%No es fase lineal porque es IIR, deberia ser FIR (cuaternas)
%Un polo dentro de r=1 y un cero fuera introducen picos en retardo de grupo 


%%%%%%%%%%%%%%%%Otra forma de calcular la magnitud que no es con freqz (esta formaa pasa el filtro IIR
%%%%%%%%%%%%%%%%a un filtro FIR, por lo que sera aproximada
%%comparo TF con fft de h y H
clf;
H1=fft(h,256);
semilogy(abs(H1).^2);
pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%GABACION DE LA SEÑAL DE VOZ A CIFRAR%%%%%%%%%%%%

fs=8000;
%voz = wavrecord (3*fs, fs, 'double'); % 3 segundos de voz a fs
%wavwrite (voz,fs,16,'voztema2.wav'); %guardo esa voz en el fichero voztema2.wav
voz=wavread('voztema2.wav'); 
soundsc(voz,fs); %escucho la voz a la frecuencia de muestreo
pause;
plot([1:3*fs],voz);
pause;


%%%%%%%%REALIZACION DE LA OPERACION DE CIFRADO MEDIANTE EC EN DIFERENCIAS%%%%%%%%%%

vozcifradaec_dif=filter(bcifrado,acifrado,voz);
soundsc(vozcifradaec_dif,fs);
pause;

%%%%%%%%%%%%%%%Ahora con mifilter%%%%%%%%%%%%%%%

y=mifilter(bcifrado,acifrado,voz);



%%%%%%%%%%%%%error entre folter y mi filter%%%%%%%%%%%%

error=sum(abs(y-vozcifradaec_dif).^2)


%%%%%%%%%REALIZACION DE LA OPERACION DE CIFRADO MEDIANTE CONVOLUCION%%%%%%%%%%

vozcifradaconv=conv(voz,h);
soundsc(vozcifradaconv,fs);
pause;


%%%%%%%%%Ahora con mi conv%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%%%%%%%%%error entre conv y mi conv%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%REALIZACION DE LA OPERACION DE CIFRADO MEDIANTE EC DE ESTADO%%%%%%%%%%

[A,B,C,D]=tf2ss(bcifrado,acifrado);
N=size(A,1);
S=zeros(N,1);
for n=1:length(voz)
    vozcifradass(n)=C*S+D*voz(n);
    S=A*S+B*voz(n);
end
soundsc(vozcifradass,fs);
pause;

clf;

eje=[0:3*fs-1];
subplot(311);plot(eje,vozcifradaconv(1:24000));grid;
title('Salida del filtro Hcifrado(z) a la voz');
ylabel('convolucion');

Econvolucion=sum((vozcifradaec_dif-vozcifradaconv(1:24000)).^2)/length(voz);
xlabel(['Error cometido entre ecuaciones en diferencias y convolucion: ',num2str(Econvolucion)]);
subplot(312);plot(eje,vozcifradaec_dif);grid;
ylabel('Ecuaciones en diferencias');
subplot(313);plot(eje,vozcifradass);grid;
ylabel('Variables de estado');
Evariablesdeestado=sum((vozcifradaec_dif'-vozcifradass).^2)/length(voz);
xlabel(['Error cometido entre ecuaciones en diferencias y variables de estado: ',num2str(Evariablesdeestado)]);

 
%%%%%%%%%CALCULO DEL SISTEMA DE FASE MINIMA PARA DESCIFRADO%%%%%%%%%%%%%%

[bmin,amin]=h2hmin(bcifrado,acifrado);
clf;

ceros_min=roots(bmin); 
polos_min=roots(amin);
zplane(ceros_min,polos_min);  %verifico que los polos y ceros estan dentro de circulo unidad
pause;

[H,W]=freqz(bcifrado,acifrado);  %verifico que sus magnitudes coinciden
MagH=H.*conj(H);

[Hmin,Wmin]=freqz(bmin,amin); 
MagHmin=Hmin.*conj(Hmin);

subplot(211);semilogy(W/pi,MagH); grid;
title('MAGNITUD DE Hcifrado(z)');

subplot(212);semilogy(Wmin/pi,MagHmin); grid;
title('MAGNITUD DE Hcifradomin(z)');

Error=sum(abs(MagH-MagHmin).^2)/(length(MagH));
xlabel(['Error entre Hcifrado(z) y Hmincifrado(z): ',num2str(Error)]);
% xlabel lo saca junto a la grafica 
% num2str lo saca en un string

pause;

FaseH=unwrap(angle(H));
FaseHmin=unwrap(angle(Hmin));
subplot(211);plot(W/pi,FaseH,'b',Wmin/pi,FaseHmin,'r');grid; 
title('Fase de Hcifrado(z)(azul) y Hmincifrado(z) (rojo)');
%Si los ceros estan fuera del circulo unidad hacen que la fase sea mas negativa en los ptos de inflexion
%Si los ceros estan dentro del circulo unidad hacen que la fase sea mas positiva

GdH=grpdelay(bcifrado,acifrado);
GdHmin=grpdelay(bmin,amin);
subplot(212);plot(W/pi,GdH,'b',Wmin/pi,GdHmin,'r'); 
title('Retardo de grupo de H(z)(azul) y Hmin(z) (rojo)');grid;
pause;
clf;


Magh=h.*conj(h);
hmin=filter(bmin,amin,x);
Maghmin=hmin.*conj(hmin);
plot((0:length(Magh)-1),cumsum(Magh),'b',(0:length(Maghmin)-1),cumsum(Maghmin),'r');
%con cumsum hacemos la suma acumulatica de todos los valores de Magh
%si ponemos dos puntos en el color hace que la grafica salga discontinua
title('Energia acumulada: h[n] (azul), hmin[n] (rojo)');
pause;


%%%%%%%%%%%%%%SISTEMA DE DESCIFRADO%%%%%%%%%%%%%%%%

adescifrado=bmin; %invertimos los coeficientes
bdescifrado=amin;

[Hdescifrado,Wdescifrado]=freqz(bdescifrado,adescifrado);  %Calculo de las magnitudes

Magdescifrado=Hdescifrado.*conj(Hdescifrado);

subplot(311);semilogy(W/pi,MagH); grid;
title('Magnitud de Hcifrado(z)');

subplot(312);semilogy(Wdescifrado/pi,Magdescifrado); grid;
title('Magnitud de Hdescifradomin(z)');
%%%%%Comprobamos que las magnitudes son iguales por 3 metodos:

%%%%%a)multiplicando sus magnitudes)
Magmul=MagH.*Magdescifrado;
subplot(313);plot(W/pi,Magmul); grid;
title('Magnitud de Hmul(z)');
pause;
clf;


%%%%%%b)introduciendo una delta por el sistema global y calculando H(w):
%como queremos el inverso del sistema de fase minima los ceros iran donde los polos y viceversa

y=filter(amin,bmin,h);
plot(fft(y).*conj(fft(y)))


%%%%%%C) multiplicar los polinomios de ceros y de polos, y ver la respuesta en frecuencia
cert=conv(amin,bcifrado);
>> polt=conv(bmin,acifrado);
>> [Y,W]=freqz(cert,polt,256);
>> plot(Y.*conj(Y))




%%%Respuesta al impulso(cuidado xq es un filtro IIR)
hcif=filter(bcifrado,acifrado,x);
hdes=filter(bdescifrado,adescifrado,x);
a=conv(acifrado,adescifrado);
b=conv(bcifrado,bdescifrado);
h=filter(b,a,x)
plot(h);
pause;
vozdescifrada=filter(bdescifrado,adescifrado,vozcifradaec_dif);
soundsc(vozdescifrada,fs);
subplot(211);plot((0:length(voz)-1),voz); grid;
title('Voz original');

subplot(212);plot((0:length(vozdescifrada)-1),vozdescifrada); grid;
title('Voz cifrada y descifrada');

ErrorD=sum((voz-vozdescifrada).^2)/length(voz);
xlabel(['Error entre vozcifradaec dif y vozdescifrada: ',num2str(ErrorD)]);



%%%%%%%%%%%%%DESCIFRADO DE LA VOZ%%%%%%%%%%%%%
vozdescifrada=filter(bdescifrado,adescifrado,vozcifradaec_dif);
soundsc(vozdescifrada,fs);
subplot(211);plot((0:length(voz)-1),voz); grid;
title('Voz original');

subplot(212);plot((0:length(vozdescifrada)-1),vozdescifrada); grid;
title('Voz cifrada y descifrada');

ErrorD=sum((voz-vozdescifrada).^2)/length(voz);
xlabel(['Error entre vozcifradaec dif y vozdescifrada: ',num2str(ErrorD)]);

%%%%%%%%%%%%FILTRO FIR DE FASE LINEAL TIPO I%%%%%%%%%%%%%%%%
hi=[-0.0052 -0.0080 0.0134 0.1057 0.2405 0.3072 0.2405 0.1057 0.0134 -0.0080 -0.0052];
ceros=roots(hi);
%Calculo su respuesta al impulso
clf;stem(hi);grid;
title('respuesta al impulso hi[n]');
pause;
zplane(ceros); %Diagrama de polos y ceros
title('ceros de Hi');
pause;


[H,w]=freqz(hi,1,256);   %Calculo su magnitud
semilogy(w/(pi),abs(H).^2);grid;
title('MAGNITUD DE Hi(z)');
pause;

plot(w/pi,unwrap(angle(H)));grid;
title('FASE CONTINUA DE Hi(z)');
pause;

GdH=grpdelay(hi,1,256);
plot(w/pi,GdH);grid;
title('RETARDO DE GRUPO DE Hi(z)');
pause;
load spcap2
%%%%%%%%%%%FILTRO FIR DE FASE LINEAL TIPO II%%%%%%%%%%%%%%%%
ceros=roots(hii);
%Calculo su respuesta al impulso
clf;stem(hii);grid;
title('respuesta al impulso hi[n]');
pause;
zplane(ceros); %Diagrama de polos y ceros
title('ceros de Hi');
pause;


[H,w]=freqz(hii,1,256);   %Calculo su magnitud
semilogy(w/(pi),abs(H).^2);grid;
title('MAGNITUD DE Hi(z)');
pause;

plot(w/pi,unwrap(angle(H)));grid;
title('FASE CONTINUA DE Hi(z)');
pause;

GdH=grpdelay(hii,1,256);
plot(w/pi,GdH);grid;
title('RETARDO DE GRUPO DE Hi(z)');
pause;

%%%%%%%%%%%FILTRO FIR DE FASE LINEAL TIPO III%%%%%%%%%%%%%%%%
ceros=roots(hiii);
%Calculo su respuesta al impulso
clf;stem(hiii);grid;
title('respuesta al impulso hi[n]');
pause;
zplane(ceros); %Diagrama de polos y ceros
title('ceros de Hi');
pause;


[H,w]=freqz(hiii,1,256);   %Calculo su magnitud
semilogy(w/(pi),abs(H).^2);grid;
title('MAGNITUD DE Hi(z)');
pause;

plot(w/pi,unwrap(angle(H)));grid;
title('FASE CONTINUA DE Hi(z)');
pause;

GdH=grpdelay(hiii,1,256);
plot(w/pi,GdH);grid;
title('RETARDO DE GRUPO DE Hi(z)');
pause;

%%%%%%%%%%%FILTRO FIR DE FASE LINEAL TIPO IV%%%%%%%%%%%%%%%%
ceros=roots(hiv);
%Calculo su respuesta al impulso
clf;stem(hiv);grid;
title('respuesta al impulso hi[n]');
pause;
zplane(ceros); %Diagrama de polos y ceros
title('ceros de Hi');
pause;


[H,w]=freqz(hiv,1);   %Calculo su magnitud
semilogy(w/(pi),abs(H).^2);grid;
title('MAGNITUD DE Hi(z)');
pause;

plot(w/pi,unwrap(angle(H)));grid;
title('FASE CONTINUA DE Hi(z)');
pause;

GdH=grpdelay(hiv,1,512);
plot(w/pi,GdH);grid;
title('RETARDO DE GRUPO DE Hi(z)');

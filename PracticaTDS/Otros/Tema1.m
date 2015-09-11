%%Practica 1 de TDS curso 2006-07
%%GRABACION DE UNA SEÑAL DE VOZ
fs=8000;

% Esto lo hacemos en matlab solo una vez, es para grabar la voz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%voz = wavrecord (3*fs, fs, 'double'); % 3 segundos de voz a fs (a fs se le puede sumar mil para evitar el transitorio 
                                       % de la tarjeta de sonido,pero si lo hago despues le quito las 1000 primeras muestras y le
                                       %puedo restar la media como voz=voz-mean(voz)
%wavwrite (voz,fs,16,'voztema1.wav'); %guardo esa voz en el fichero voztema1.wav
%soundsc(voz,fs); %escucho la voz a la frecuencia de muestreo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%Esto lo haria una vez tenga la voz grabada y quisiese volver a usar el programa sin
%%%%%%tener que volver a grabar otra voz nueva, lo que hago es cargar el fichero de voz que grabe 
%%%%%%y meterlo en la variable voz
voz=wavread('voztema1.wav'); 
voz=voz-mean(voz);
soundsc(voz,fs); %escucho la voz a la frecuencia de muestreo

%%%%%%
plot(voz);
pause;

%%%DESPLAZAMIENTO DE UNA SEÑAL

%%%Desplazar 100mseg de 3seg (24000 muestras) seria (con una regla de tres) 800 muestras

%%despla=[zeros(1,800) voz']; %cuidado si lo hago asi porque tendre 24800 muestras y con la convolucion 24799
delta=[zeros(1,799) 1]; %%necesito una delta de 800 muestras para poder desplazarla

% vector desplazado     %size me da las filas y la columnas,hay que mirar si trabajo con vector filas o columnas
vozdesp=conv(voz,delta); %la convolucion me desplaza la voz a la posicion 800

%ahora hacemos la suma
vozeco=voz+vozdesp(1:24000); %%para sumarlos los dos vectores deben de tener las mismas dimensiones,
									  %%y la longitud de vozdesp es la convolucion l+m-1 = 24799 muestras,
                                      %tambien puedo añadir en voz


subplot(311); plot (voz);
subplot(312); plot (vozdesp);
subplot(313); plot (vozeco);
pause;
soundsc(voz);
pause;
soundsc(vozeco);
pause;



%%INVERSION DE ESPECTROS

n=[0:23999]; %%tengo 24000 muestras de voz
 
factor=real(exp(i*pi*n)); % he de coger la parte real xq me salen 0.00000i y solo quiero el 1 y -1
                          %quiero desplazar pi hacia la izq,como es periodica de periodo 2pi,desplazando pi invierto en espectro 

vozinvertida= voz.*factor'; %multiplico por ese factor para invertir los espectros, hago la
						    %traspuesta xq voz me viene dada en forma de vector columna
                            %.* es componente a componente
soundsc(vozinvertida);
pause;

vozoriginal=vozinvertida.*factor'; %al despazar otra vez vuelvo el espectro a tenerlo como antes

soundsc(vozoriginal);


%%EFECTOS EN LA REPRESENTACION DE LA MAGNITUD DE LA DFT

n=0:63;                    %%64 muestras
w=0.5*pi;                 %%pulsacion
seno=sin(w.*n);              %%la señal, un seno de pulsacion 0.5*pi
Seno=fft(seno,length(n));       %%calculo de fft con 64 muestras

%si no pongo nada esto me empieza en 1, no en cero...y yo quiero empezar en cero,por eso pongo el eje)
eje1=[0:63];
eje2=2*pi.*[0:63]/64;   %Para que el eje vaya de 0 a 2pi   me pone las pulsaciones en 0.5 pi
eje=2.*[0:63]/64;   %si le quito el pi me sale en 0.5 (ya no me sale el pi

plot(eje,abs(Seno));grid;title('DFT con stem');    %represento la magnitud
pause;
stem(eje,abs(Seno));grid;title('DFT con plot, escala lineal'); 
pause;
semilogy(eje,abs(Seno));grid;title('DFT en db');   %representacion en db.
pause;

%%Esto lo hago para observar las sinc
Sinc=fft(seno,128);  %Calculo la fft con 128 muestras, con esto muestreo mas y `podre observar la sinc que tengo realmente
%LA TF de un seno desde +inf a -inf son dos deltas,pero yo tengo 64 muestras,y el efecto seria el mismo que enventanar la
%señal,asi que en la TF observare la sinc de la ventana...con 64 muestras no se observa y en los puntos que muestreo parece una
%delta,pero si muestreo a 128,cojo mas muestras y puedo ver la sinc
eje2=2.*[0:127]/128; %ahora tengo mas muestras, otro eje

plot (eje,abs(Seno),'r',eje2,abs(Sinc),'g');grid;  
pause;
semilogy (eje,abs(Seno),'r',eje2,abs(Sinc),'g');grid;
pause;

%%Hago la fft de una señal con muestras no multiplo de la original
Snosub=fft(seno,65);  %hago la fft de una señal no submultiplo de 64
eje3=2.*[0:64]/65;   %nuevo eje

plot (eje,abs(Seno),'r',eje3,abs(Snosub),'g');title('Con muestras no multiplos de 64');
pause;
semilogy (eje,abs(Seno),'r',eje3,abs(Snosub),'g');title('En eje semilogaritmico');
% Fijarse que ahora queda desplazada la señal Snosub, esto no pasaba antes pq
%128 era multiplo de 64, entonces los espacios entre muestras eran equivalentes
%Con 65 muestras, esto no ocurre.
pause;

%%Efectos de aumentar la longitud de señal
n2=1:32;
n3=1:128;
sc1=sin(w.*n2);
sc2=sin(w.*n3);  %%dos senos de 32 y 128 muestras

SC1=abs(fft(sc1,256))./max(abs(fft(sc1,256)));   %%Caluclo las magnitudes normalizadas de la fft de 256 muestras
SC2=abs(fft(sc2,256))./max(abs(fft(sc2,256)));
eje4=2.*[0:255]/256;  %%nuevo eje 
plot (eje4,SC1,'r',eje4,SC2,'g');title('DFT 256 muestras de 32 y de 128');
pause; %%puede verse qie miestras mas muestras tiene la señal,mas estrecha es la sinc

scp1=sin(0.48*pi.*(1:16))+sin(0.52*pi.*(1:16));   %las otras dos señales
scp2=sin(0.48*pi.*(1:128))+sin(0.52*pi.*(1:128));

SCP1=abs(fft(scp1,256))./max(abs(fft(scp1,256)));  %%las normalizo a 1
SCP2=abs(fft(scp2,256))./max(abs(fft(scp2,256)));

eje5=2.*[0:255]/256;

subplot(211);plot(eje5,SCP1,'r');title('DFT 256 muestras de 16');
subplot(212);plot(eje5,SCP2,'g');title('DFT 256 muestras de 128'); %aqui se ve que 16 muestras las sinc son tan anchas que
pause;  %que no se diferencian,pero com 128 si se diferencia una sinc de otra


%%CALCULO DE LA DFT DE SECUENCIAS NO CAUSALES  (rebisar)

x=[zeros(1,25),-1.*ones(1,4),ones(1,7),-1.*ones(1,4),zeros(1,25)]; %Genero la señal
subplot (311);stem(-32:32,x) %la represento de -32 a +32
title('Representacion de x[n]');

Xk=fft(x,65); %calculo fft de 65 muestras

Xk1=Xk.*exp(-i*2*pi*[0:64]*33/65); % Desplazamos (al multiplicar por la exp)
%Aunque la tenga representada de -32 a 32,la DFT me calcula la TF suponiendo que el primer dato esta en cero,asi que tengo que
%multuplicar por una exponencial para desplazar el resultado es frecuencia
eje=2.*(0:64)/65; %el eje va de 0 a 2pi

subplot (312); semilogy(eje,abs(Xk1)) %abs para ver la magnitud
title('Magnitud de la DFT')
grid

subplot (313); stem(2*[0:64]*33/65,angle(Xk1)); %angle para ver la fase
grid;
title('Fase de DFT')

% Nota: Para ver el efecto de no desplazar la señal multiplicando por la exponencial, basta con
% poner Xk en vez de Xk1 en los distintos plots

pause

%Expandimos de forma periodica para hacer un desplazamiento circular 


%xa=[ones(1,4),-1.*ones(1,4),zeros(1,25),zeros(1,25),-1.*ones(1,4),ones(1,3)];

xa=[ones(1,4),-1.*ones(1,4),zeros(1,56),zeros(1,57),-1.*ones(1,4),ones(1,3)];

subplot (311);stem(0:127,xa); grid;
title('Representacion de x[n] tras el desplazamiento circular')

Xka=fft(xa,128);

Xk1a=Xka%.*exp(-i*2*pi*[0:127]*33/128); % Desplazamos (al multiplicar por la exp)

eje2=2.*[0:127]/128; %el eje va de 0 a 2

subplot (312); semilogy(eje2,abs(Xka)) %abs para ver la magnitud
title('Magnitud de la DFT con 128 muestras y previo desplazamiento circular')
grid



subplot (313); plot(2*[0:127]*33/128,angle(Xka)); %angle para ver la fase
grid;
title('Fase de DFT con 128 muestras')


pause;

%%%comparacion espectro de la de 128 y la de 65 muestras

semilogy(eje,abs(Xk1).^2,'r');hold on; %abs para ver la magnitud
semilogy(eje2,abs(Xka).^2);hold off;

pause;


%%CONVOLUCION LINEAL Y CIRCULAR


n=(0:15);
x=[ones(size(0:15))];  
h=[zeros(size(0:15))];   
h(1:16)=(-0.9).^n; 
y=conv(x,h);
subplot(311);
stem(y);grid;title('Convolucion lineal de x[n] y h[n]')

X=fft(x);
H=fft(h);
Y=X.*H;
z=real(ifft(Y));
subplot(312);
stem(z);grid;title('Convolucion circular de x[n] y h[n] con 16')

x1=[x,zeros(size(16:31))];
n1=(0:31);
h1=[h,[zeros(size(16:31))]];  
X1=fft(x1);    %El efecto seria el mismo si en vez de añadir ceros calculo la fft de 32 muestras? SIIII
H1=fft(h1);
Y1=X1.*H1;
z1=real(ifft(Y1));
subplot(313);
stem(1:32,z1);grid;title('Convolucion circular de x[n] y h[n] con 32')

%X1=fft(x1,32);    %El efecto seria el mismo si en vez de añadir ceros calculo la fft de 32 muestras?
%H1=fft(h1,32);


%%CALCULO DE LA DFT DE SECUENCIAS REALES

n=[0:63];     %%genero la señal
w=0.3*pi;
seno4=sin(w*n);
Seno4=fft(seno4);
g=seno4(1:2:end)+(j*seno4(2:2:end)); %cojo las muestras pares e impares (n=0 es par, y en matlab el 1er indice es 1)
G=fft(g,32);

Spares(1)=(G(1)+conj(G(1)))/2; %aprovechando la periodicidad creamos la primera muestra
Ginvertida=G(end:-1:2); %vemos q la G[N-k] es nuestra señal invertida (aprovechando la periodicidad)
Spares(2:32)=(G(2:end)+conj(Ginvertida))/2;
stem(real(Spares));
pause;
stem(imag(Spares));
Simpares(1)=-j*(G(1)-conj(G(1)))/2;
Simpares(2:32)=-j*(G(2:end)-conj(Ginvertida))/2;
k=[0:63];
Spares2=[Spares Spares]; %hemos de duplicar la señal para que coincida el numero de muestras al multiplicar por la exponencial
Simpares2=[Simpares Simpares];
Srecuperada=Spares2+(exp(-j*2*pi*k/64).*Simpares2);

error=(sum(abs(Seno4-Srecuperada).^2))/64;
fprintf('Error cuadratico medio entre S[k] y SN/2[k]: %g\n',error); %\n para retorno de carro



%%CALCULO DE LA MAGNITUD DE LA DFT MEDIANTE LA AUTOCORRELACION
%%%para 127 muestras
Seno4=fft(seno4,127);
MagSeno4=Seno4.*conj(Seno4);
ejeSeno4=[0:2/127:2-(2/127)]; %colocamos el eje de menos a mas
subplot(311)
plot(ejeSeno4,MagSeno4);grid
title('Magnitud de la DFT de la señal s[n]:S[k]');


autocorrelacion=xcorr(seno4);
subplot(312);
ejeautocorr=[-80:161/127:80];
plot(ejeautocorr,autocorrelacion);grid
title('autocorrelacion de la señal s[n]');

autocorrelacioncircular=[autocorrelacion(64:127),autocorrelacion(1:63)]; %se pude hacer asi, o calclundo 1º la fft y
Autocorrelacioncircular=real(fft(autocorrelacioncircular));              %multiplicando despues por una exponencial para desplazar
ejeautocorr=[0:2/length(Autocorrelacioncircular):2-(2/length(Autocorrelacioncircular))]; %%%63 muestras
subplot(313);
plot(ejeautocorr,Autocorrelacioncircular);grid
title('DFT de la autocorrelacion R[k]');
pause;
error=(sum(abs(Autocorrelacioncircular-MagSeno4).^2))/128;
fprintf('Error cuadratico medio entre S[k] y R[k]: %g',error);

%%%para 256 muestras
Seno4=fft(seno4,256);
MagSeno4=Seno4.*conj(Seno4);
ejeSeno4=[0:2/256:2-(2/256)]; %colocamos el eje de menos a mas
subplot(311)
plot(ejeSeno4,MagSeno4);grid
title('Magnitud de la DFT de la señal s[n]:S[k]');


autocorrelacion=xcorr(seno4);
subplot(312);
ejeautocorr=[-80:161/127:80];
plot(ejeautocorr,autocorrelacion);grid
title('autocorrelacion de la señal s[n]');

autocorrelacioncircular=[autocorrelacion(64:127),zeros(1,129),autocorrelacion(1:63)]; %%colocomos los ceros para llegar a 256 muestras
Autocorrelacioncircular=real(fft(autocorrelacioncircular,256));
ejeautocorr=[0:2/256:2-(2/256)];
subplot(313);
plot(ejeautocorr,Autocorrelacioncircular);grid
title('DFT de la autocorrelacion R[k]');
pause;
error=(sum(abs(Autocorrelacioncircular-MagSeno4).^2))/256;
fprintf('Error cuadratico medio entre S[k] y R[k]: %g',error);

%%%para 64 muestras
Seno4=fft(seno4,64);
MagSeno4=Seno4.*conj(Seno4);
ejeSeno4=[0:2/64:2-(2/64)]; %colocamos el eje de menos a mas
subplot(311)
plot(ejeSeno4,MagSeno4);grid
title('Magnitud de la DFT de la señal s[n]:S[k]');


autocorrelacion=xcorr(seno4);
subplot(312);
ejeautocorr=[-80:161/127:80];
plot(ejeautocorr,autocorrelacion);grid
title('autocorrelacion de la señal s[n]');

autocorrelacioncircular=[autocorrelacion(64:127),autocorrelacion(1:63)];
Autocorrelacioncircular=real(fft(autocorrelacioncircular,64));
ejeautocorr=[0:2/64:2-(2/64)];
subplot(313);
plot(ejeautocorr,Autocorrelacioncircular);grid
title('DFT de la autocorrelacion R[k]');
pause;
error=(sum(abs(Autocorrelacioncircular-MagSeno4).^2))/64;
fprintf('Error cuadratico medio entre S[k] y R[k]: %g',error);

%%CALCULO DE LA DFT DE UNA SEÑAL DE VOZ

fs=8000;
% Esto lo hacemos en matlab solo una vez, es para grabar la voz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%voz = wavrecord (0.5*fs, fs, 'double'); % 3 segundos de voz a fs
%wavwrite (voz,fs,16,'voz1tema1.wav'); %guardo esa voz en el fichero voztema1.wav
%soundsc(voz,fs); %escucho la voz a la frecuencia de muestreo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

%%%%%%Esto lo haria una vez tenga la voz grabada y quisiese volver a usar el programa sin
%%%%%%tener que volver a grabar otra voz nueva, lo que hago es cargar el fichero de voz que grabe 
%%%%%%y meterlo en la variable voz
voz=wavread('voz1tema1.wav'); 
soundsc(voz,fs); %escucho la voz a la frecuencia de muestre

plot(voz(1750:2261));
pause;

[x,y] = ginput(2);

n=abs(x(1)-x(2));

%%No se si entre o y pi se refiere a coger la mitad de las muestras (si es eso!!!!!!!!!!!!!!!!!!, la fft viene entre 0 y 2pi)

eje=[0:1/256:1-1/256];
voz2=fft(voz(1750:2261));
Magvoz=voz2.*conj(voz2);
semilogy(eje,Magvoz(1:256));grid
title ('Magnitud de la DFT de la voz');

[z,m] = ginput(2);

t=abs(z(1)-z(2));
periodo = 2*pi/t; %% Debe coincidir con n calculado anteriormente
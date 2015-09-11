%%%%%%%%%%%%%%%%%%%%%%%%%%%Aplicacion audio%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%soundsc(voz,fs);
plot(voz);
pause;


TID=15e-3;%tiempo inicial de demora. Tiempo entre generacion del sonido y el primer eco
%elegimos una sala de concierto
trev=1.80;% tiempo de reverberacion. Tiempo en el cual un sonido atenua su amplitud a 1/1000 de la inicial

D1=TID;
D2=2*TID;
D3=50e-3;
G3=10.^(-3*D3/trev);
G1=G3;

%Pasamos a muestras los valores anteriores
D1=D1*fs;
D2=D2*fs;
D3=D3*fs;

%Sacamos los coeficientes del numerador y denominador. Calculando previamente la H(z) en papel
Coef_num=[1, zeros(1,D1-2), G1, zeros(1,D2-D1-1), 1, zeros(1,D3-D2-1), -G3, zeros(1,D3+D1-D3), -(G1*G3)];
Coef_denom=[1, zeros(1,D3-2), -G3];


voz_reverberada=filter(Coef_num,Coef_denom,voz);
soundsc(voz_reverberada,fs);
plot(voz_reverberada);
title('Voz reverberada');
pause;


voz_original=filter(Coef_denom,Coef_num,voz_reverberada);
%Nota: Para recuperar la señal original utilizamos el H(z)^-1, que se consigue utilizando los coeficientes al reves

soundsc(voz_original,fs);

% Segun se explico en clase la funcion filter no se puede utilizar para recuperar la señal en esta practica
%Preguntar


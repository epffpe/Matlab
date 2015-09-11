%%%%%%%%%%%%%%%%%%%%%%%%PRACTICAS DEL TEMA 3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%CURSO 2006-2007%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%Detector de la actividad de voz:DAV

load spcap3;
voz=wavread('voztema3.wav');
fs=8000;
%voz = wavrecord (3*fs, fs, 'double');
%wavwrite (voz,fs,16,'voztema3.wav');
soundsc(voz,fs);
voz=voz/max(abs(voz));%normalizamos
plot(voz);
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Filtro FIR

plot(h);grid;
title('Respuesta al impulso de hfir');
pause;

[H,w]=freqz(h,1,256);   %Calculo su magnitud
semilogy(w/(pi),abs(H).^2);grid;
title('MAGNITUD DE HFIR(z)');
pause;

plot(w/pi,unwrap(angle(H)));grid; %fase continua
title('FASE CONTINUA DE HFIR(z)');
pause;

ceros=roots(h); 
zplane(ceros); %Diagrama de polos y ceros
title('polos y ceros');
pause;

%en relidad se hace con la convolucion no con el filter, y esta hecho mas abajo
envolventevozFIR=filter(h,1,abs(voz)); %%hay que filtrar con conv no con filter
envolventevozFIR=envolventevozFIR/max(envolventevozFIR); %recordar normalizar la envolvente
plot([1:length(voz)],voz,'b',[1:length(voz)],envolventevozFIR,'g');
pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

umbralFIR=0.25;
pFIR=zeros(1,3);
fFIR=zeros(1,3);
[pFIR,fFIR]=intervalos(umbralFIR,envolventevozFIR);clf;
subplot(211);
plot([1:length(voz)],voz,'b',[1:length(voz)],envolventevozFIR,'g');
hold on;
plot([1:length(voz)],umbralFIR*ones(1,length(voz)),'g');
plot([pFIR(1),pFIR(1)],[1,-1],'r',[fFIR(1),fFIR(1)],[1,-1],'r');
plot([pFIR(2),pFIR(2)],[1,-1],'r',[fFIR(2),fFIR(2)],[1,-1],'r');
plot([pFIR(3),pFIR(3)],[1,-1],'r',[fFIR(3),fFIR(3)],[1,-1],'r');
hold off;
title('Envolvente FIR de la voz');

fprintf('Filtro FIR -> Umbral: %g; ',umbralFIR);
fprintf('Principios: %g %g %g; ',pFIR(1),pFIR(2),pFIR(3));
fprintf('Finales: %g %g %g \n',fFIR(1),fFIR(2),fFIR(3));


%%%%%%%%%%%%%%%%%%%%%Implemantaciion del filtro con solape suma y con conv
umbral = 0.25;
Mvoz   = abs(voz)/max(abs(voz));
flops(0);
envolventeconv = conv(Mvoz,h);
fprintf('Operaciones realizadas con filtro FIR con convolucion : %g \n',flops/length(voz));
envolventeconv = envolventeconv(1:length(voz));
envolventeconv = envolventeconv/max(envolventeconv);
[pc,fc]  = intervalos(umbral,envolventeconv);

clf;
plot([0:length(voz)-1],voz,'b',[0:length(voz)-1],envolventeconv,'m');
hold on;
plot([1:length(voz)],umbral*ones(1,length(voz)),'g');
plot([pc(1),pc(1)],[1,-1],'r',[fc(1),fc(1)],[1,-1],'r');
plot([pc(2),pc(2)],[1,-1],'r',[fc(2),fc(2)],[1,-1],'r');
plot([pc(3),pc(3)],[1,-1],'r',[fc(3),fc(3)],[1,-1],'r');
hold off;
title('Envolvente de la voz con convolución');
pause;

%%%%%%%%%%%%%%%%%%%%%solape suma
L=256-length(h)+1;
T=ceil(length(voz)/L); % Numero de tramas totales
envolventeoa=zeros(256*T,1);

flops(0);
H=fft(h',256);
for t=0:T-1,
   if t == T-1
      v=abs(voz((t*L)+1:end));
   else
      v=abs(voz((t*L)+1:(t*L)+L));
   end
   y=real(ifft(fft(v,256).*H));
   envolventeoa((t*L)+1:(t*L)+length(y))=envolventeoa((t*L)+1:(t*L)+length(y))+ y;
end   
fprintf('Operaciones realizadas con filtro FIR con solape suma : %g \n',flops/length(voz));
envolventeoa=envolventeoa(1:length(voz))/max(envolventeoa(1:length(voz)));
[poa,foa]  = intervalos(umbral,envolventeoa);

clf;
plot([0:length(voz)-1],voz,'b',[0:length(voz)-1],envolventeoa,'m');
hold on;
plot([1:length(voz)],umbral*ones(1,length(voz)),'g');
plot([poa(1),poa(1)],[1,-1],'r',[foa(1),foa(1)],[1,-1],'r');
plot([poa(2),poa(2)],[1,-1],'r',[foa(2),foa(2)],[1,-1],'r');
plot([poa(3),poa(3)],[1,-1],'r',[foa(3),foa(3)],[1,-1],'r');
hold off;
title('Envolvente de la voz con solape suma');
pause;

%%%%%%%%%%%%%%Implementacion del DAV con solape guardar
%%%L = 256;
%%%P=  longitud de h
voz2=[zeros(length(h)-1,1);abs(voz)]; % Añadimos los P-1 ceros iniciales
y=[zeros(256,1)]; % Vector para el calculo de la convolución circular
d=256-length(h)+1; % Longitud real de las tramas
T=ceil(length(voz2)/d); % Numero de tramas totales
flops(0);
H=fft(h',256); 
v=voz2(1:256); % La primera trama la calculo fuera bucle
y=ifft(fft(v,256).*H); % Convolucion circular 256 muestras
envolventeos=y(length(h):end);% Suprimimos las P-1 iniciales
for t=1:T-1,
   if t>=T-2 % Calculamos la trama en la ultima tomamos las muestras restantes
      v=voz2(t*d:end);   
   else
      v=voz2((t*d):(t*d)+256); % Resto con 256 muestras
   end
   y=ifft(fft(v,256).*H); % Convolucion circular
   envolventeos=[envolventeos;y(length(h):end)]; % Tomamos las muestras buenas
end
fprintf('Operaciones realizadas con filtro FIR con overla-save : %g \n',flops/length(voz));
envolventeos = real(envolventeos);
envolventeos = envolventeos/max(abs(envolventeos));
envolventeos = envolventeos (2:length(voz)+1);
[pos,fos]  = intervalos(umbral,envolventeos);

clf;
plot([0:length(voz)-1],voz,'b',[0:length(voz)-1],envolventeoa,'m');
hold on;
plot([1:length(voz)],umbral*ones(1,length(voz)),'g');
plot([pos(1),pos(1)],[1,-1],'r',[fos(1),fos(1)],[1,-1],'r');
plot([pos(2),pos(2)],[1,-1],'r',[fos(2),fos(2)],[1,-1],'r');
plot([pos(3),pos(3)],[1,-1],'r',[fos(3),fos(3)],[1,-1],'r');
hold off;
title('Envolvente de la voz con solape guardar');

fprintf('Filtro Convolución  -> Umbral: %g; ',umbral);
fprintf('Principios %g %g %g; ',pc(1),pc(2),pc(3));
fprintf('Finales: %g %g %g \n',fc(1),fc(2),fc(3));

fprintf('Filtro solape-guardar  -> Umbral: %g; ',umbral);
fprintf('Principios %g %g %g; ',poa(1),poa(2),poa(3));
fprintf('Finales: %g %g %g \n',foa(1),foa(2),foa(3));

fprintf('Filtro Overlap-Save -> Umbral: %g; ',umbral);
fprintf('Principios %g %g %g; ',pos(1),pos(2),pos(3));
fprintf('Finales: %g %g %g \n',fos(1),fos(2),fos(3));

Eeconvoa=(sum ((envolventeconv-envolventeoa).^2))/length(voz);
Eeconvos=(sum ((envolventeconv-envolventeos).^2))/length(voz);
fprintf('Error cometido entre envolventeconv y envolventeoa: %g \n',Eeconvoa);
fprintf('Error cometido entre envolventeconv y envolventeos: %g \n',Eeconvos);



%%%%%%%%%%%%%%Implementacion del DAV ahorrando operaciones%%%%%%%%%%%%%%


%%%No se com se hace%%%


%%%%%%%Programacion del sistema DAV con un filtro IIR
hn=filter(b,a,[1,zeros(1,200)]); %%Calculo su respuesta al impulso
[H,w]=freqz(b,a);   
MagH=H.*conj(H);
fase=unwrap(angle(H));
ejew=[0:length(H)-1]/length(H);

subplot (311);
plot ([0:length(hn)-1],hn);
grid;
title('Respuesta al impulso del filtro Hiir[n]');
subplot (312);
semilogy (ejew,MagH);
grid;
title('Magnitud del filtro Hiir[n]');
subplot (313);
plot (ejew,fase);
grid;
title('Fase continua del filtro Hiir[n]');
pause;

ceros=roots(b);
polos=roots(a);
clf;
zplane(ceros,polos);
title('Polos y ceros del filtro Hiir[n]');
pause;

envolventevozIIR=filter(b,a,abs(voz));  %En realidad he de hacerlo con CONV no con filter, pero como era?????
envolventevozIIR=envolventevozIIR/max(envolventevozIIR);
plot([1:length(voz)],voz,'b',[1:length(voz)],envolventevozIIR,'g');
title('Envolvente IIR de la voz');
umbralIIR=0.27;
pIIR=zeros(1,3);
fIIR=zeros(1,3);
[pIIR,fIIR]=intervalos(umbralIIR,envolventevozIIR);
plot([1:length(voz)],voz,'b',[1:length(voz)],envolventevozIIR,'g');
hold on;
plot([1:length(voz)],umbralIIR*ones(1,length(voz)),'g');
plot([pIIR(1),pIIR(1)],[1,-1],'r',[fIIR(1),fIIR(1)],[1,-1],'r');
plot([pIIR(2),pIIR(2)],[1,-1],'r',[fIIR(2),fIIR(2)],[1,-1],'r');
plot([pIIR(3),pIIR(3)],[1,-1],'r',[fIIR(3),fIIR(3)],[1,-1],'r');
hold off;
title('Envolvente IIR de la voz');
fprintf('Filtro IIR -> Umbral: %g; ',umbralIIR);
fprintf('Principios: %g %g %g; ',pIIR(1),pIIR(2),pIIR(3));
fprintf('Finales: %g %g %g \n',fIIR(1),fIIR(2),fIIR(3));

%%%%%%%%%%%%%%%%%%%%%%%%%%Forma Directa I

umbral=0.27;
voz=voz/max(abs(voz));
envolventevozIIR=filter(b,a,abs(voz));
envolventevozIIR=envolventevozIIR/max(envolventevozIIR); % Hallamos la envolvente con filter para comparar

Y=zeros(6,1);
X=zeros(6,1);
for t=1:length(voz),
    C=(b(1)*abs(voz(t)))+(b(2)*X(1))+(b(3)*X(2))+(b(4)*X(3))+(b(5)*X(4))+(b(6)*X(5))+(b(7)*X(6));%ceros
    P=-(a(2)*Y(1))-(a(3)*Y(2))-(a(4)*Y(3))-(a(5)*Y(4))-(a(6)*Y(5))-(a(7)*Y(6));%polos
    envolventeFDI(t)=C+P;
    Y(2:6)=Y(1:5);%desplazamos a la derecha para despues meter la muestra de este bucle
    Y(1)=envolventeFDI(t);
    X(2:6)=X(1:5);
    X(1)=abs(voz(t));
end    
envolventeFDI=envolventeFDI/max(envolventeFDI);%normalizamos envolvente
[pFDI,fFDI]  = intervalos(umbral,envolventeFDI);%calculo de principio y final

clf;
plot([0:length(voz)-1],voz,'b',[0:length(voz)-1],envolventeFDI,'g');
hold on;
plot([1:length(voz)],umbral*ones(1,length(voz)),'g');
plot([pFDI(1),pFDI(1)],[1,-1],'r',[fFDI(1),fFDI(1)],[1,-1],'r');
plot([pFDI(2),pFDI(2)],[1,-1],'r',[fFDI(2),fFDI(2)],[1,-1],'r');
plot([pFDI(3),pFDI(3)],[1,-1],'r',[fFDI(3),fFDI(3)],[1,-1],'r');
hold off;
title('Envolvente con IIR y Forma directa I');
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Forma Directa II (Es igual que la Traspuesta de la directa I hecho en el apartado siguiete)

P=zeros(7,1);
for t=1:length(voz),
    P(1)=abs(voz(t))-(a(2)*P(2))-(a(3)*P(3))-(a(4)*P(4))-(a(5)*P(5))-(a(6)*P(6))-(a(7)*P(7));
    envolventeFDII(t)=(b(1)*P(1))+(b(2)*P(2))+(b(3)*P(3))+(b(4)*P(4))+(b(5)*P(5))+(b(6)*P(6))+(b(7)*P(7));
    P(2:7)=P(1:6);    
end
envolventeFDII=envolventeFDII/max(envolventeFDII);
[pFDII,fFDII]  = intervalos(umbral,envolventeFDII);

clf;
plot([0:length(voz)-1],voz,'b',[0:length(voz)-1],envolventeFDII,'g');
hold on;
plot([1:length(voz)],umbral*ones(1,length(voz)),'g');
plot([pFDII(1),pFDII(1)],[1,-1],'r',[fFDII(1),fFDII(1)],[1,-1],'r');
plot([pFDII(2),pFDII(2)],[1,-1],'r',[fFDII(2),fFDII(2)],[1,-1],'r');
plot([pFDII(3),pFDII(3)],[1,-1],'r',[fFDII(3),fFDII(3)],[1,-1],'r');
hold off;
title('Envolvente con IIR y FDII');
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Traspuesta de la Forma Directa I (igual que la del apartado anterior)
P=zeros(7,1);
for t=1:length(voz),
    P(1)=abs(voz(t))-(a(2)*P(2))-(a(3)*P(3))-(a(4)*P(4))-(a(5)*P(5))-(a(6)*P(6))-(a(7)*P(7));
    envolventeTFDI(t)=(b(1)*P(1))+(b(2)*P(2))+(b(3)*P(3))+(b(4)*P(4))+(b(5)*P(5))+(b(6)*P(6))+(b(7)*P(7));    
    P(2:7)=P(1:6);
end    
envolventeTFDI=envolventeTFDI/max(envolventeTFDI);
[pTFDI,fTFDI]  = intervalos(umbral,envolventeTFDI);

clf;
plot([0:length(voz)-1],voz,'b',[0:length(voz)-1],envolventeTFDI,'g');
hold on;
plot([1:length(voz)],umbral*ones(1,length(voz)),'g');
plot([pTFDI(1),pTFDI(1)],[1,-1],'r',[fTFDI(1),fTFDI(1)],[1,-1],'r');
plot([pTFDI(2),pTFDI(2)],[1,-1],'r',[fTFDI(2),fTFDI(2)],[1,-1],'r');
plot([pTFDI(3),pTFDI(3)],[1,-1],'r',[fTFDI(3),fTFDI(3)],[1,-1],'r');
hold off;
title('Envolvente con IIR y TFDI');
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Apartado E -> Traspuesta de la Forma Directa II (igual que la forma directa I)
Y=zeros(6,1);
X=zeros(6,1);
for t=1:length(voz),
    C=(b(1)*abs(voz(t)))+(b(2)*X(1))+(b(3)*X(2))+(b(4)*X(3))+(b(5)*X(4))+(b(6)*X(5))+(b(7)*X(6));
    P=-(a(2)*Y(1))-(a(3)*Y(2))-(a(4)*Y(3))-(a(5)*Y(4))-(a(6)*Y(5))-(a(7)*Y(6));
    envolventeTFDII(t)=C+P;
    Y(2:6)=Y(1:5);
    Y(1)=envolventeTFDII(t);
    X(2:6)=X(1:5);
    X(1)=abs(voz(t));
end    
envolventeTFDII=envolventeTFDII/max(envolventeTFDII);
[pTFDII,fTFDII]  = intervalos(umbral,envolventeTFDII);

clf;
plot([0:length(voz)-1],voz,'b',[0:length(voz)-1],envolventeTFDII,'g');
hold on;
plot([1:length(voz)],umbral*ones(1,length(voz)),'g');
plot([pTFDII(1),pTFDII(1)],[1,-1],'r',[fTFDII(1),fTFDII(1)],[1,-1],'r');
plot([pTFDII(2),pTFDII(2)],[1,-1],'r',[fTFDII(2),fTFDII(2)],[1,-1],'r');
plot([pTFDII(3),pTFDII(3)],[1,-1],'r',[fTFDII(3),fTFDII(3)],[1,-1],'r');
hold off;
title('Envolvente con IIR y TFDII');
pause;

fprintf('Filtro FDI  -> Umbral: %g; ',umbral);
fprintf('Principios %g %g %g; ',pFDI(1),pFDI(2),pFDI(3));
fprintf('Finales: %g %g %g \n',fFDI(1),fFDI(2),fFDI(3));

fprintf('Filtro FDII  -> Umbral: %g; ',umbral);
fprintf('Principios %g %g %g; ',pFDII(1),pFDII(2),pFDII(3));
fprintf('Finales: %g %g %g \n',fFDII(1),fFDII(2),fFDII(3));

fprintf('Filtro TFDI  -> Umbral: %g; ',umbral);
fprintf('Principios %g %g %g; ',pTFDI(1),pTFDI(2),pTFDI(3));
fprintf('Finales: %g %g %g \n',fTFDI(1),fTFDI(2),fTFDI(3));

fprintf('Filtro TFDII  -> Umbral: %g; ',umbral);
fprintf('Principios %g %g %g; ',pTFDII(1),pTFDII(2),pTFDII(3));
fprintf('Finales: %g %g %g \n',fTFDII(1),fTFDII(2),fTFDII(3));

E1=(sum ((envolventevozIIR-envolventeFDI').^2))/length(voz);
E2=(sum ((envolventevozIIR-envolventeFDII').^2))/length(voz);
E3=(sum ((envolventevozIIR-envolventeTFDI').^2))/length(voz);
E4=(sum ((envolventevozIIR-envolventeTFDII').^2))/length(voz);
fprintf('Error cometido entre envolventevozIIR y envolventeFDI: %g \n',E1);
fprintf('Error cometido entre envolventevozIIR y envolventeFDII: %g \n',E2);
fprintf('Error cometido entre envolventevozIIR y envolventeTFDI: %g \n',E3);
fprintf('Error cometido entre envolventevozIIR y envolventeTFDII: %g \n',E4);





%////////////////////////////////////////////////
% Apartado F -> Filtro Celosia

[cm,parcor]=hz2lat(b,a);
envolventelattice=[zeros(length(voz),1)];
f=[zeros(length(cm),1)];
b=[zeros(length(cm),1)];
for n=1:length(voz),
   f(end)=abs(voz(n));
   f(end-1)=f(end) + parcor(end)*b(end-1);
   b(end)=-parcor(end)*f(end-1)+b(end-1);
   for k=length(parcor)-1:-1:1,
      f(k)=f(k+1) + parcor(k)*b(k);
      b(k+1)=-parcor(k)*f(k)+b(k);
   end
   b(1)=f(1);
   envolventelattice(n)=sum(b.*cm);
   
end
envolventelattice = envolventelattice/max(abs(envolventelattice));
[plattice,flattice]  = intervalos(umbral,envolventelattice);

clf;
plot([0:length(voz)-1],voz,'b',[0:length(voz)-1],envolventelattice,'g');
hold on;
plot([1:length(voz)],umbral*ones(1,length(voz)),'g');
plot([plattice(1),plattice(1)],[1,-1],'r',[flattice(1),flattice(1)],[1,-1],'r');
plot([plattice(2),plattice(2)],[1,-1],'r',[flattice(2),flattice(2)],[1,-1],'r');
plot([plattice(3),plattice(3)],[1,-1],'r',[flattice(3),flattice(3)],[1,-1],'r');
hold off;
title('Envolvente con IIR lattice');

fprintf('Filtro lattice  -> Umbral: %g; ',umbral);
fprintf('Principios %g %g %g; ',plattice(1),plattice(2),plattice(3));
fprintf('Finales: %g %g %g \n',flattice(1),flattice(2),flattice(3));

E5=(sum ((envolventevozIIR-envolventelattice).^2))/length(voz);
fprintf('Error cometido entre envolventeIIR y envolventelattice: %g \n',E5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Cascada%%%%%%%%%%%%%%%%%%%%%%%%5

[N,D,g]=cascada(b,a,1);

[H1,w1]=freqz(N(1,1:end),D(1,1:end));
MagH1=H1.*conj(H1);
[H2,w2]=freqz(N(2,1:end),D(2,1:end));
MagH2=H2.*conj(H2);
[H3,w3]=freqz(N(3,1:end),D(3,1:end));
MagH3=H3.*conj(H3);

ejew=[0:length(H1)-1]/length(H1);

subplot(311);
semilogy(ejew,MagH1);
title('Magnitud del elemento 1 de la cascada');
subplot(312);
semilogy(ejew,MagH2);
title('Magnitud del elemento 2 de la cascada');
subplot(313);
semilogy(ejew,MagH3);
title('Magnitud del elemento 3 de la cascada');
pause;

clf;

% De la matriz N (devuelta por la funcion cascada) sacamos los elementos de las primeras columnas para luego representarlos.
ceros1=roots(N(1,1:end));
polos1=roots(D(1,1:end));
subplot(221);
zplane(ceros1,polos1);
title('Polos del elemento 1');

ceros2=roots(N(2,1:end));
polos2=roots(D(2,1:end));
subplot(222);
zplane(ceros2,polos2);
title('Polos del elemento 2');

ceros3=roots(N(3,1:end));
polos3=roots(D(3,1:end));
subplot(223);
zplane(ceros3,polos3);
title('Polos del elemento 3');
pause;

umbral=0.27;
voz=voz/max(abs(voz));% normalizamos
envolventevozIIR=filter(b,a,abs(voz));
envolventevozIIR=envolventevozIIR/max(envolventevozIIR); 

s1=filter(N(1,1:end),D(1,1:end),abs(voz));
s2=filter(N(2,1:end),D(2,1:end),s1);
s3=filter(N(3,1:end),D(3,1:end),s2);

envolventecascada=s3.*g;
envolventecascada=envolventecascada/max(envolventecascada);
[pcascada,fcascada]  = intervalos(umbral,envolventecascada); %principios y finales

clf;

fin=length(voz)-1;
plot([0:fin],voz,'b',[0:fin],envolventecascada,'g');
hold on;

%para mantener el umbral constante lo multiplicamos por un vector de unos que tenga la misma longitud de voz
plot([1:length(voz)],umbral*ones(1,length(voz)),'g'); %umbral
plot([pcascada(1),pcascada(1)],[1,-1],'r',[fcascada(1),fcascada(1)],[1,-1],'r');
plot([pcascada(2),pcascada(2)],[1,-1],'r',[fcascada(2),fcascada(2)],[1,-1],'r');
plot([pcascada(3),pcascada(3)],[1,-1],'r',[fcascada(3),fcascada(3)],[1,-1],'r');
hold off;
title('Envolvente con IIR cascada');

fprintf('Filtro cascada  -> Umbral: %g; ',umbral);
fprintf('Principios %g %g %g; ',pcascada(1),pcascada(2),pcascada(3));
fprintf('Finales: %g %g %g \n',fcascada(1),fcascada(2),fcascada(3));

E6=(sum ((envolventevozIIR-envolventecascada).^2))/length(voz); %Calculo del error
fprintf('Error cometido entre envolventeIIR y envolventecascada: %g \n',E6);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Paralelo

[R,P,K]=residuem(b,a);


%Procedimiento analogo al del apartado anterior
[H1,w1]=freqz(R(1,1:end),P(1,1:end));
MagH1=H1.*conj(H1);

[H2,w2]=freqz(R(2,1:end),P(2,1:end));
MagH2=H2.*conj(H2);

[H3,w3]=freqz(R(3,1:end),P(3,1:end));
MagH3=H3.*conj(H3);

ejew=[0:length(H1)-1]/length(H1);

subplot(311);
semilogy(ejew,MagH1);
title('Magnitud del elemento 1 del sistema paralelo');

subplot(312);
semilogy(ejew,MagH2);
title('Magnitud del elemento 2 del sistema paralelo');

subplot(313);
semilogy(ejew,MagH3);
title('Magnitud del elemento 3 del sistema paralelo');
pause;

clf;

ceros1=roots(R(1,1:end));
polos1=roots(P(1,1:end));
subplot(221);
zplane(ceros1,polos1);
title('Polos del elemento 1');

ceros2=roots(R(2,1:end));
polos2=roots(P(2,1:end));
subplot(222);
zplane(ceros2,polos2);
title('Polos del elemento 2');

ceros3=roots(R(3,1:end));
polos3=roots(P(3,1:end));
subplot(223);
zplane(ceros3,polos3);
title('Polos del elemento 3');
pause;

umbral=0.27;
voz=voz/max(abs(voz));
envolventevozIIR=filter(b,a,abs(voz));
envolventevozIIR=envolventevozIIR/max(envolventevozIIR); 

s1=filter(R(1,1:end),P(1,1:end),abs(voz));
s2=filter(R(2,1:end),P(2,1:end),abs(voz));
s3=filter(R(3,1:end),P(3,1:end),abs(voz));
s4=K.*abs(voz); % analogo al del apartado anterior con el parametro g

envolventeparalelo=s1 + s2 + s3 + s4;
envolventeparalelo=envolventeparalelo/max(envolventeparalelo);
[pparalelo,fparalelo]  = intervalos(umbral,envolventeparalelo);

clf;
plot([0:length(voz)-1],voz,'b',[0:length(voz)-1],envolventeparalelo,'g');
%-------------------------------------------------------------------------
hold on;
plot([1:length(voz)],umbral*ones(1,length(voz)),'g');
plot([pparalelo(1),pparalelo(1)],[1,-1],'r',[fparalelo(1),fparalelo(1)],[1,-1],'r');
plot([pparalelo(2),pparalelo(2)],[1,-1],'r',[fparalelo(2),fparalelo(2)],[1,-1],'r');
plot([pparalelo(3),pparalelo(3)],[1,-1],'r',[fparalelo(3),fparalelo(3)],[1,-1],'r');
hold off;
%--------------------------------------------------------------------------
title('Envolvente con IIR paralelo');

fprintf('Filtro paralelo  -> Umbral: %g; ',umbral);
fprintf('Principios %g %g %g; ',pparalelo(1),pparalelo(2),pparalelo(3));
fprintf('Finales: %g %g %g \n',fparalelo(1),fparalelo(2),fparalelo(3));

E7=(sum ((envolventevozIIR-envolventeparalelo).^2))/length(voz);
fprintf('Error cometido entre envolventeIIR y envolventeparalelo: %g \n',E7);


%%%%%%%%%%%%%%%%%%5%%%%%APLICACION DE AUDIO%%%%%%%%%%%%%%%%%%%%%%%%%%

soundsc(voz,fs);
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


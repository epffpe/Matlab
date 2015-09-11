%%%%%%%%%%%%%%%Mi filter%%%%%%%%%%%%%%%%%%%%%%
[y] = mifilter(b,a,voz)
%b=[1.0000 -2.6515 3.7329 -3.5249 1.4256];
%a=[1.0000 3.4630 4.6134 2.8050 0.6561];
x=voz;
%%como a(1)=1, no he de normalizar (si a(1) no fuese =1 he de normalizar todos los coeficientes con
%%respecto a a(1)
M=length(a)-1;
N=length(b)-1;
%Desplazamos x para que la primera muestra que necesitamos (x[n-M] para n=1) sea la primera del vector
x=[zeros(M,1);x];
%El valor inicial de la salida es cero y su longitud es la misma que la de la entrada
y=zeros(size(x));
for n = M+1:length(x)
    for k=0:M
        y(n)=y(n)+b(k+1)*x(n-k);
    end    
    for k=1:N
        y(n)=y(n)-a(k+1)*y(n-k);
    end
end
%Como hemos desplazado la entrada tenemos la salida desplazada. 
y=y((M+1):end);
return
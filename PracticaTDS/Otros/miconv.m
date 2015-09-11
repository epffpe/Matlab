%%%%%%%%%%%%%%funcion mi conv%%%%%%%%%%%%%%%%%
%%%%%%La longitud de la salida sera N+M-1 con N y M longitudes de las entradas%%%%%%%%%
function [y] = miconv(h,x)
%b=[4 5 6 1 2];
%a=[1 2 3];
%x=voz;
%h=h;
z=(length(h)+length(x)-1);
L=length(x);
P=length(h); %relleno con ceros hasta tener la longitud de la salida
hinv=[h(end:-1:1)]; %%le doy la vuelta a b
x=[zeros(P-1,1); x; zeros(P-1,1)];
y=zeros(L+P-1,1);
for n = 1:z;
   y(n)=sum(hinv.*x(n:n+P-1)');
end;



% Si en lugar de desplazar la x[n] desplazamos la h[n] cambiamos
%A la x hay que añadirle p-1 ceros delante y p-1 ceros detras para...
% %y=zeros(L+P-1,1);
% hinv=h(end:-1::1)
% for n=1:L+P-1
%     y(n)=sum(hinv.*x(n:n+P-1));
% end
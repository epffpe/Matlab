%-----------------------------------------------
% Funcion que ha partir de H(z)=B(z)/A(z) obtiene
% los parametros PARCOR y CM del filtro en celosia
% Llamada:
%	[cm,parcor]=hz2lat(B,A);
%
% Parametros de entrada:
%	B(M),A(N): definidas en FILTER.
%		Ha de cumplirse: M<=N.
% Parametros de salida:
%	cm(N): coeficientes de los ceros.
%	parcor(N-1): coeficientes parcor (polos).
%----------------------------------------------------
function [cm,parcor]=hz2lat(B,A)

% Se comprueba que los vectores A y B son columna.
% En caso contrario, se convierten en vectores columna.
[fil,col]=size(A);
if (col>fil),A=A';end;
[fil,col]=size(B);
if (col>fil),B=B';end;
% Se calculan parametros para el algoritmo.
N=length(A);
M=length(B);
% Se comprueba que M<=N.
if (M>N),error('Dimensiones incorrectas');end;
% se comprueba que a(1)=1 y se guarda la escala para los cm.
escala=A(1);
A=A/A(1);
% Se definen los vectores con los parametros
% parcor y cm.
parcor=zeros(N-1,1);
cm=zeros(N,1);
% Se define una matriz auxiliar.
m=zeros(N-1,N-1);

% Se calculan los parcor.
m(N-1,:)=-A(2:N)';
for i=N-1:-1:1,
   parcor(i)=m(i,i);
   for j=1:i-1,
	m(i-1,j)=(m(i,j)+m(i,i)*m(i,i-j))/(1-parcor(i)^2);
   end;
end;

% Se calculan los cm.
cm(M)=B(M);
for j=M-1:-1:1,
	for i=j+1:N,
		cm(j)=cm(j)+cm(i)*m(i-1,i-j);
	end;
	cm(j)=B(j)+cm(j);
end;
cm=cm/escala;
return  
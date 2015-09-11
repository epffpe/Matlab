%--------------------------------------------------
% Funcion que agrupa los polos de un sistema
% racional en pares conjugados, obteniendo los
% coeficientes reales de su desarrollo en cascada.
% Llamada
%	[N,D,g]=cascada(B,A,agrupo)
%
% Parametros de entrada:
%     Como en el caso de RESIDUE.
%	B(M): coeficientes del numerador.
%	A(N): Coeficientes del denominador.
%	agrupo: si vale 1 tambien agrupo los coeficentes
%		reales en factores de orden 2.
%		Si no quiero que los agrupe le asigno
%		el valor 0.
%		NOTA: su valor por defecto es 1.
% Parametros de salida:	
%	Una expresion vale mas que mil palabras.
% 
%       B(z)        N(k,1)+N(k,2)z^(-1)+N(k,3)z^(-2)
% H(z)=------=g*MUL---------------------------------
%       A(z)        D(k,1)+D(k,2)z^(-1)+D(k,3)z^(-2)
%
%-----------------------------------------------------
function [N,D,g]=cascada(B,A,agrupo)

% Se comprueba si se ha definido el valor de agrupo.
% En caso contrario se iguala a 1.
if (nargin==2),agrupo=1;end

% Se comprueba que todos los coeficientes
% de A y B son reales.
if (sum(imag(B))~=0),
error('Los coeficientes de B tienen que ser reales');
end
if (sum(imag(A))~=0),
error('Los coeficientes de A tienen que ser reales');
end

% Se calculan las raices de A y B, y su ganancia.
c=roots(B);
d=roots(A);
g=B(1);

% La agrupacion se basa en que la funcion roots nos
% devuelve los polos complejos y sus polos conjugados
% en posiciones consecutivas.

% En primer lugar se reordenan los polos y ceros
% para facilitar el posterior algoritmo.
% La ordenacion consiste en poner primero polos y ceros
% complejos y luego los reales.
% Si no quiero que me agrupe los reales, pongo el valor
% cero detras de cada polo o cero real.
c_cmpx=c(find(real(c)~=c));
d_cmpx=d(find(real(d)~=d));
if (~agrupo),
   c_real=zeros(2*(length(c)-length(c_cmpx)),1);
   if (length(c_real)~=0),
	   c_real(1:2:length(c_real))=c(find(real(c)==c));
   end;
   d_real=zeros(2*(length(d)-length(d_cmpx)),1);
   if (length(d_real)~=0),
	d_real(1:2:length(d_real))=d(find(real(d)==d));
   end;

else
	c_real=[];d_real=[];
	for k=1:length(c),
		if (real(c(k))==c(k)),
			c_real=[c_real c(k)];
		end;
	end;
	for k=1:length(d),
		if (real(d(k))==d(k)),
			d_real=[d_real d(k)];
		end;
	end;
%	c_real=c(find(real(c)==c));
%	d_real=d(find(real(d)==d));
end

c1=[c_cmpx; c_real'];
d1=[d_cmpx; d_real'];

% Si la longitud no es par se anado un cero al final.
if ((fix(length(c1)/2))~=(length(c1)/2)),c1=[c1;0];end;
if ((fix(length(d1)/2))~=(length(d1)/2)),d1=[d1;0];end;

% Calculo su factores N.
for i=2:2:length(c1),
	N(i/2,:)=real(poly([c1(i-1) c1(i)]));
end;

% Calculo su factores D.
for i=2:2:length(d1),
	D(i/2,:)=real(poly([d1(i-1) d1(i)]));
end;

return

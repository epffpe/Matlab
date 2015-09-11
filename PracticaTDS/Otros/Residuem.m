%--------------------------------------------------
% Funcion que me agrupa el desarrollo en fracciones
% simples de RESIDUE en fracciones con TODOS los
% coeficientes reales (de orden 2)
%
% Llamada
%	[Rm,Pm,K]=Residuem(B,A)
%
% Parametros de entrada
%     Como en el caso de RESIDUE.
%	B: coeficientes del numerador
%	A: Coeficientes del denominador
% Parámetros de salida:
%  Siendo:
%     P: Numero de polos.
%     Q: numero de ceros
%   El valor de las matrices Rm y Pm y el vector Km significan lo siguiente: 
%      B(z)  l=P/2      Rm(l,1)+Rm(l,2)z^(-1)          l=P-Q
% H(z)=----= SUM ---------------------------------- +  SUM K(l)z^(l-1)
%      A(z)  l=1  Pm(l,1)+Pm(l,2)z^(-1)+Pm(l,3)z^(-2)  l=1
%
% OJO: Cambio de signo en las raices reales
%	con respecto a RESIDUE
%-----------------------------------------------------
function [Rm,Pm,K]=Residuem(B,A)

j=1;
label=0;
[R,P,K]=residue(B,A);
% La agrupación se basa en que los polos complejos y sus
% polos conjugados se hallan en posiciones consecutivas
% de los vectores P y R de RESIDUE.
% K se considera siempre real.
for i=1:length(P),
   if label
	label=0;
   else
	if (real(P(i))~=P(i)),
	   Rm(j,:)=[R(i)+R(i+1) -(P(i+1)*R(i)+P(i)*R(i+1))];
	   Pm(j,:)=poly([P(i) P(i+1)]);
	   j=j+1;
	   % Para no ejecutar la siguiente i.
	   label=1;
	else
	   Rm(j,:)=[R(i) 0];
	   Pm(j,:)=[1 -P(i) 0];
	   j=j+1;
	end
    end
end
if (sum(sum(real(Pm)~=Pm))|sum(sum(real(Rm)~=Rm))),
	error('');
end
Rm=real(Rm);
Pm=real(Pm);
return
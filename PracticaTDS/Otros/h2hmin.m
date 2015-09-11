% Practica 2
% Funcion h2hmin
%%%%HAy 3 formas de realizar el filtro de fase minima


function [bmin,amin] = h2hmin(b,a) % recibimos acifrado y bcifrado
ceros=roots(b);
polos=roots(a);
amin=a;
ind=find(abs(ceros)>1); %buscamos los mayores de uno q estan fuera del circulo
g=prod(-ceros(ind)); %multiplicacion de los ceros que estan fuera del circulo unidad
ceros(ind)=conj(1./ceros(ind)); %los metemos dentro del circulo unidad
bmin=g.*poly(ceros);  %respuesta al impulso del filtro de h minima




%%%%%%%%%%%%%%%%%%%%%%%%%%%Metodo 2%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%Metodo 3%%%%%%%%%%%%%%%%%%%%%%%%





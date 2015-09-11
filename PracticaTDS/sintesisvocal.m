%---------------------------------------------------------------------
% Filtro de sintesis de vocales (sonidos sostenidos)
% parametros de entrada
%            vocal: sonido sostenido
% parametros de salida
%            b,a: coeficientes filtro IIR para sintesis del sonido
%            h: respuesta al impulso del filtro FIR para sintesis
%               del sonido sostenido
%            in: entrada al filtro de sintesis
% la vocal sintetizada se obtiene
%            vocalsintetizada=filter(b,a,in)
%    o       vocalsintetizada=conv(h,in)
%----------------------------------------------------------------------
function [b,a,h,in]=sintesisvocal(vocal);
% Filtro FIR
a=real(sqrt(0.5)*lpc(vocal,6));
h=filter(1,a,[1;zeros(5000,1)]);
Eh=filter(ones(20,1),1,h.^2);
ind=find(Eh<max(Eh)/50000);
h=h(1:ind(1));
% Filtro de polos y ceros
b=real(sqrt(2).*lpc(lpc(vocal,100),6));
a=real(sqrt(0.5)*lpc(vocal,6));
a=conv(a,a.*[(0.999).^[0:length(a)-1]]);
b=conv(b,b.*[(0.999).^[0:length(b)-1]]);
% Entrada al filtro
in=filter(a,1,vocal);
end
function ClappG(fOL)
disp('____ClappG(fOL)')
% Autor: Eugenio Peñate Fariñas
% email: epf.supersonic@gmail.com
% Este fichero calcula los componentes de un oscilador ClappG para frecuencias
% dela banda de HF a partir de valores normalizados de impedancia ( solid State
% Design W. Hayward pag. 34).
% Los valores de frecuencia se ingresan en Hz.
%
% Ejemplo de uso
% >> ClappG(17.23e6)
% ____ClappG(fOL)
% ______________________________________________
%  
%    Cfb(pf)   Cc(pf)     Co(pf)     L(uH)
%   205.2685   92.3708   12.3161    1.2932
% 
% ______________________FIN_____________________

WOL = 2*pi*fOL;
Cfb = 1/(WOL*45);
Cc  = 1/(100*WOL);
Co  = 1/(750*WOL);
L   = 140/WOL;
disp ('______________________________________________')
disp (' ')
disp('   Cfb(pf)   Cc(pf)     Co(pf)     L(uH)')
%disp(' ')
a = Cfb * 1e12;
b = Cc * 1e12;
c = Co * 1e12;
d = L * 1e6;
disp([a,b,c,d])
disp ('______________________FIN_____________________')
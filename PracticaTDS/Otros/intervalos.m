function [principio,final]=intervalos(umbral,envolvente)
L=100;


flag= 0;
% Con el flag queremos definir el paso de una palabra al silencio o viceversa
num_palabra=1;
principio =zeros(1,3);
final =zeros(1,3);

%for I = 0:N_tramas-1,

for I = 0:length(envolvente),
   if num_palabra<4      % Este programa solo funciona con tres marcas de intervalo, una para cada palabra
    S=sum(envolvente(((I*L)+1):(I*L)+L))/L;
    % Con esto nos aseguramos de que no es solo una muestra la que pasa del umbral sino las siguientes L muestras
    % en nuestro caso son las siguientes 100 muestras que sobrepasan el valor definido al umbral.
    if flag == 0
       if S >= umbral %sonido
          principio(num_palabra)=(I*L)+1;
          flag=1;
       end
    else
       if S <= umbral %final de sonido luego silencio
          final(num_palabra)=(I*L)+1;
          flag=0;
          num_palabra=num_palabra+1;
       end
    end
  end  
end

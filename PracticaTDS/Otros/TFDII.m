%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TFDII%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c=zeros(7,1); %%son las C.I.
voz1=abs(voz);
for t=1:length(voz1)
    y(t)=voz1(t)*b(1)+c(1);  %%es la salida
    
    %%%%actualizamos las c.i.
    for k=1:6
        c(k)=voz1(t)*b(k+1)-a(k+1)*y(t)+c(k+1);
    end;
end;
plot(y/max(y));
    

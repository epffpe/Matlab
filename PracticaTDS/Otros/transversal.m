%%%%%%%%%%%%%Estructura tranversal 06-07%%%%%%%%%%%%%%%%
%%%longitud h = 92, c.i. = 91 ceros
x=abs(voz);
x=[zeos(1,91) x];
c=zeros(1,91); %son las c.i.
for i = 1:length(x)
    y(i)=sum([x(i),c].*h);
    c=[x(i),c(1:end-1)];
end;
y=y/max(abs(y));
plot(y)
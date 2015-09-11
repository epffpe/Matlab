function Ind=indpaso(d_mm,p_mm)
% Para el tornillo de 5mm, el paso es 0.8
%  indpaso(5,0.8);
% Para el tornillo de 3mm, el paso es 0.48
%  indpaso(3,0.48);
% Para el tornillo de 2.5mm, el paso es 0.4528
%  indpaso(2.5,0.4528);
d_cm=d_mm/10;
p_cm=p_mm/10;
n=0:0.25:20;
l_cm=n*p_cm;
Lu=n.^2*d_cm./(102*(l_cm/d_cm)+45);
Ind=Lu*1000;
plot(n,Ind)
xlabel('numero de vueltas n')
ylabel('Inductancia(nH)')
grid
shg
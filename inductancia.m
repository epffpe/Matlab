function Ind=inductancia(d_cm,l_cm)
n=0:0.25:20;
Lu=n.^2*d_cm/(102*(l_cm/d_cm)+45);
Ind=Lu*1000;
plot(n,Ind)
xlabel('numero de vueltas n')
ylabel('Inductancia(nH)')
shg
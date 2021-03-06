I=imread('Dibujo.bmp','bmp');
imagesc(I);
Igray=rgb2gray(I);
ri=max(Igray(:))-min(Igray(:));
In=(Igray-min(Igray(:)))/ri;
imagesc(In),colormap(gray),shg

Inn=1-In;
hv=sum(Inn);
%imagesc(Inn),colormap(gray),shg

%Calculo de derivada
dhv=hv(11:end) - hv(1:end-10);
%y busco los cruces por cero con pendiente positiva
ind=find(diff(sign(dhv))==2) + 10;
%plot(sign(dhv)),shg
i=1;
hold on
for i=1:length(ind)
    x=find(In(:,ind(i))==0);
    plot(ind(i),x(1),'d')
end
hold off
shg
%reconocimiento de voz;
%grabamos todas las vocales y hacemos su cepstrum
uno=wavrecord(8000,8000,'double');
dos=wavrecord(8000,8000,'double');
tres=wavrecord(8000,8000,'double');
cuatro=wavrecord(8000,8000,'double');
cinco=wavrecord(8000,8000,'double');

cuno=rceps(uno);
cuno=cuno(2:14);

cdos=rceps(dos);
cdos=cdos(2:14);

ctres=rceps(tres);
ctres=ctres(2:14);

ccuatro=rceps(cuatro);
ccuatro=cuatro(2:14);

ccinco=rceps(cinco);
ccinco=ccinco(2:14);

disp('grabe su vocal')
pause
test=wavrecord(8000,8000,'double');

ct=rceps(test);
ct=ct(2:14);

ta=sum(abs(ct-cuno))
te=sum(abs(ct-cdos))
ti=sum(abs(ct-ctres))
to=sum(abs(ct-ccuatro))
tu=sum(abs(ct-ccinco))

total=[ta te ti to tu]';

[d,vocal]=min(total)
%% * Consigna de la clase #A (15 minutos)*
% 1. Determinar analiticamente lo valores de ωo fo y To, (Ωo, Fo y No, en el caso discreto) de las siguientes funciones:  
%
%    a) x(t)=sen(2pi1000t+pi/4)  
%
%    b) x(t)=sen(2/3t+pi/4)  
%
%    c) x[n] = cos[5pi/4n+pi/2]  
%
%    d) x[n]=sen[4pin]
%
% 2. Utilizar Matlab para graficar la forma de la función y verificar el periodo calculado junto con la tase temporal (tener cuidado al elegir Ts y la cantidad de ciclos a visualizar)
%
% 3. Considerar Fs=8000Hz para discretizar la senal a). Reproducirla audiblemente y luego duplicar su frecuencia ¿Qué se oye?
%
% *************************************************************************
%
% SOLUCION
%
% *************************************************************************
dt=0.01;
t_continuo = 0:dt:10;
Xt_a = sin((2*pi*1000)*t_continuo+(pi/4));
Xt_b = sin((2/3)*(t_continuo)+(pi/4));

n_discreto = 0:dt:10;
Xn_c = cos((5*pi/4)*(n_discreto)+pi/2);
Xn_d = sin((4*pi)*(n_discreto));


subplot(2,2,1);
plot(t_continuo,Xt_a);
title('x(t)=sen(2pi1000t+pi/4)');
xlabel('t');
ylabel('x(t)');

subplot(2,2,2);
plot(t_continuo,Xt_b);
title('x(t)=sen(2/3t+pi/4)');
xlabel('t');
ylabel('x(t)');

subplot(2,2,3);
plot(n_discreto,Xn_c);
title('x[n] = cos[5pi/4n+pi/2]');
xlabel('n');
ylabel('x[n]');

subplot(2,2,4);
plot(n_discreto,Xn_d);
title('x[n]=sen[4pin]');
xlabel('n');
ylabel('x[n]');

xlabel('Tiempo [s]');
ylabel('Amplitud');
title('Senales');
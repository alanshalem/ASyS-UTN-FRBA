%% * Consigna de la clase #A (15 minutos)*
% 1. Determinar analiticamente lo valores de wo fo y To, (Oo, Fo y No, en el caso discreto) de las siguientes funciones:
%
%    a) x(t)=sen(2pi1000t+pi/4)
%
%    b) x(t)=sen(2/3t+pi/4)
%
%    c) x[n] = cos[5pi/4n+pi/2]
%
%    d) x[n]=sen[4pin]
%
% 2. Utilizar Matlab para graficar la forma de la funcion y verificar el periodo calculado junto con la fase temporal (tener cuidado al elegir Ts y la cantidad de ciclos a visualizar)
%
% 3. Considerar Fs=8000Hz para discretizar la senal a). Reproducirla audiblemente y luego duplicar su frecuencia �Que se oye?
%
% *************************************************************************
%
% SOLUCION
%
% *************************************************************************
%
% SENAL PERIODICA CONTINUA: y(t)=A*sen(wo*t+phi) -> wo=?      fo=?        To=?
%
% A= Amplitud[magnitud], wo= Frecuencia angular [rad/s], phi= Fase inicial [rad]
%
% To= Periodo[s] -> To=1/fo, wo=2pi*fo=2pi/To  -> Frecuencia[Hz] = fo
%
% 1. x(t)=sen(2pi1000t+pi/4)
%
% wo=2000pi*rad/s   ---   fo=wo/2pi=2000pi/2pi=1000Hz=1kHz   ---   To=1/fo=1/1000=0,001s=1ms
%
% SENAL PERIODICA DISCRETA: x[n]=A*sen[Oo*n+phi]
%
% A= Amplitud[magnitud], Oo= Frecuencia normalizada angular [rad/muestra], phi= Fase inicial [rad]
%
% Frecuencia Normalizada [1/muestras] -> Fo=fo/fs=k/No
%
% Oo*No=2pi*k -> No, k e N
% 3. x[n]=cos[3pi/4*n+pi/3]

dt_a = 1e-6;
t_continuo_a = 0:dt_a:2e-3;

% si pongo t_continuo = 0:dt:1 estoy ploteando en 1 segundo 1000 ciclos
% si quiero ver 1 ciclo solo tengo que plotear con el periodo (1/1000 =
% 0.001s)
% Ej: To=1ms -> dt=To/1000
Xt_a = sin((2 * pi * 1000) * t_continuo_a + (pi / 4));
% El periodo To = 0.001, por lo tanto, si pongo dt=1*10^-3
% Si nuestra senal tiene frecuencia 1000, por lo menos nuestro dt tiene que
% ser 100 o 1000 veces menor
dt_b = 3 * pi / 1000;
t_continuo_b = 0:dt_b:3 * pi;
Xt_b = sin((2/3) * (t_continuo_b) + (pi / 4));


% Oo=5/4*pi - Fo=5/8 - No=8/5k

dn_c = (8/5)/8;
n_discreto_c = 0:dn_c:8/5;
Xn_c = cos((5 * pi / 4) * (n_discreto_c) + (pi / 2));

dn_d = 1/2;
n_discreto_d = 0:dn_d:20;
Xn_d = sin(4*pi*n_discreto_d);

dc_d = 1;
n_continuo_d = 0:dc_d:140;
Xc_d = sin(4*pi*n_continuo_d);

%% Graficos

sgtitle('Consigna de la clase #A')
%
grid on
axis tight
subplot(3, 2, 1);
plot(t_continuo_a, Xt_a, 'linewidth', 2);
title('x(t)=sen(2pi1000t+pi/4)');
xlabel('t');
ylabel('x(t)');
%
grid on
axis tight
subplot(3, 2, 2);
plot(t_continuo_b, Xt_b, 'linewidth', 2);
title('x(t)=sen(2/3t+pi/4)');
xlabel('t');
ylabel('x(t)');
%
grid on
axis tight
subplot(3, 2, 3);
stem(n_discreto_c, Xn_c);
title('x[n] = cos[5pi/4n+pi/2]');
xlabel('n');
ylabel('x[n]');
%
grid on
axis tight
subplot(3, 2, 4);
stem(n_discreto_d, Xn_d, 'r--');
hold on
% plot(n_continuo_d, Xc_d, 'b:');
title('x[n]=sen[4pin]');
xlabel('n');
ylabel('x[n]');



%% TareaBIntegradora_Clase6_Punto1
% Sanchez Sosa

% 1. Obtener las respuestas indicial (al escalón, g(t)) e impulsional (al 
% impulso,h(t)) correspondientes al siguiente sistema físico, al que se le 
% aplica un torque T(t). Considerar a) el resorte K desconectado 
% (respuesta omega(t)) y b) el resorte K conectado (respuesta tita(t)). 
% Utilizar MatLab para verificar numéricamente el resultado.

clc;
clear;
close all;

dt=0.001;
t=-5:dt:35;
CI_SR=(0); % Condiciones iniciales para el esquema SIN RESORTE
CI_CR=([0 0]); % Condiciones iniciales para el esquema CON RESORTE
J=1;
D=0.5;
K=2;

% Constantes hallada a partir de la sol.homogenea
tao=J/D;
lambda=-1/tao;

% Constantes halladas a partir de la sol. particular
A=1/D;

% Constantes halladas a partir de las CI
k=-A;

% Senal de entrada u(t)
u_in=@(t) escalon(t);
Tor_u=u_in(t);

% Senal de entrada d(t)
d_in=@(t) delta(t);
Tor_d=d_in(t);

% Solucion analitica (SIN RESORTE=SR)
ganalit_SR=(A*(1-exp(-t/tao))).*Tor_u; % R. indicial
hanalit_SR=((A/tao)*exp(-t/tao)).*Tor_u;% R. impulsional

% Solucion numerica (SIN RESORTE=SR)
[t_ode1, gnum_SR] = ode45(@(t,y) first_order_function_M(t,y,u_in), t, CI_SR);
dtnum=t(2)-t(1); %dt=dtnum
hnum_SR=diff(gnum_SR/dtnum); %h(t)=d(g(t))/dt <-- derivada

% Constantes hallada a partir de la sol.homogenea
a=-1/4;
b=1.3919;
lambda_1=a+b*1i;
lambda_2=a-b*1i;

% Constantes halladas a partir de la sol. particular
B=1/K;

% Constantes halladas a partir de las CI
k1=-B; % k1=1/K
k2=(-a/b)*k1;

% Solucion analitica (CON RESORTE=CR)
ganalit_CR=(exp(a*t).*(k1*cos(b*t)+k2*sin(b*t))+B).*Tor_u; % R. indicial
hanalit_CR=(((a^2/b)+b)*B*exp(a*t).*sin(b*t)).*Tor_u; % R. impulsional

% Solucion numerica (CON RESORTE=CR)
[t_ode2, gnum] = ode45(@(t,y) second_order_function_M(t,y,u_in), t, CI_CR);
gnum_CR=gnum(:,1); % De esta forma me quedo con la primer columna, que es 
% mi funcion g(t).
dtnum=t(2)-t(1); %dt=dtnum
hnum_CR=diff(gnum_CR/dtnum); %h(t)=d(g(t))/dt <-- derivada

% Graficos (SIN RESORTE)
figure;

subplot(421)
plot(t,Tor_u,'linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('Torque(J)')
title('Senal de entrada u(t)')
ylim([-0.25 1.25])

subplot(422)
plot(t,ganalit_SR,'r',t_ode1,gnum_SR,'c--','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('g(t)')
legend('Analitica','Numerica')
title('Respuesta indicial sin resorte')
ylim([-0.25 2.25])

subplot(423)
plot(t,Tor_d,'linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('Torque(J)')
title('Senal de entrada d(t)')
ylim([-0.25 1.25])

subplot(424)
plot(t,hanalit_SR,'k',t(1:end-1),hnum_SR,'y--','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('h(t)')
legend('Analitica','Numerica')
title('Respuesta impulsional sin resorte')
ylim([-0.25 1.25])

% Graficos (CON RESORTE)

subplot(425)
plot(t,Tor_u,'linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('Torque(J)')
title('Senal de entrada u(t)')
ylim([-0.25 1.25])

subplot(426)
plot(t,ganalit_CR,'r',t_ode1,gnum_CR,'c--','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('g(t)')
legend('Analitica','Numerica')
title('Respuesta indicial con resorte')
ylim([-0.25 1])

subplot(427)
plot(t,Tor_d,'linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('Torque(J)')
title('Senal de entrada d(t)')
ylim([-0.25 1.25])

subplot(428)
plot(t,hanalit_CR,'k',t_ode2(1:end-1),hnum_CR,'y--','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('h(t)')
legend('Analitica','Numerica')
title('Respuesta impulsional con resorte')
ylim([-0.5 0.75])

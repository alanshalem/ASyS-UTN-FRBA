%% TareaBIntegradora_Clase8_Punto1
% Sanchez Sosa
%
% Consigna de la clase #B punto 1
%
% Consigna de la clase #B INTEGRADORA (30 minutos)
% 1. Evaluar analiticamente la Respuesta Indicial (al escalon)del 
% siguiente sistema, que modela la posicion angular w(t) del ojo humano 
% (excitacion muscular, T(t)). Utilizar MatLab para verificar el resultado, 
% utilizando convolucion.

clc;
clear;
close all;

dt=0.001;
t=-0.1:dt:0.4;
CI=[0;0];
K=14400;
% Senal de entrada
x0_in=@(t) escalon(t);

% Constantes hallada a partir de la sol.homogenea
a=-84;
b=85.697;
lambda1=a+b*1i;
lambda2=a-b*1i;

% Constantes halladas a partir de la sol. particular
A=1/K;
k1=-A;
k2=(a*A)/b;

% Solucion analitica (convolucion)
g=@(t) (A*(1-(exp(a*t).*(cos(b*t)-((a/b)*sin(b*t)))))).*x0_in(t);
h=@(t) (exp(a*t)/K).*(((a^2+b^2)/b)*sin(b*t)).*x0_in(t);

% Solucion numerica (ode45)
[t_ode, y_ode]=ode45(@(t,y) second_order_function_T(t,y,x0_in),t,CI);
g_num=y_ode(:,1);
h_num=y_ode(:,2);

% Solucion numerica (convolucion)
yc=conv(x0_in(t),h(t))*dt;
tc=(t(1)+t(1)):dt:(t(end)+t(end));

figure;

subplot(421)
plot(t,x0_in(t),'r','linewidth',2) 
grid on
axis tight 
xlabel('t(seg)')
ylabel('u(t)')
title('Entrada sin escalar')
xlim([-0.1 0.2])

subplot(422)
plot(t,28800*x0_in(t),'b','linewidth',2) 
grid on
axis tight 
xlabel('t(seg)')
ylabel('T(t)')
title('Entrada escalada x28800')
xlim([-0.1 0.2])

subplot(423)
plot(t,g(t),'k',t,g_num,'y--','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('g(t)')
legend('analitica','ode45')
title('Salida sin escalar')
xlim([0 0.2])

subplot(424)
plot(t,28800*g(t),'k',t,28800*g_num,'y--','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('y(t)')
legend('analitica','ode45')
title('Salida escalada x28800')
xlim([0 0.2])

subplot(4,2,5:6)
plot(t,h(t),'k',t,h_num,'y--','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('y(t)')
legend('analitica','ode45')
title('h(t)')
xlim([0 0.2])

subplot(4,2,7:8)
plot(t,28800*g(t),'c',tc,28800*yc,'b--','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('y(t)')
legend('analitica','numerica')
title('y(t)=h(t)*x(t)')
xlim([0 0.2])

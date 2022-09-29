%% TareaAIntegradora_Clase6
% Sanchez Sosa
%
% Consigna de la clase #A INTEGRADORA
% Obtener las ecuaciones que modelan el siguiente termotanque eléctrico
% (termicas e hidraulicas por separado y calcular cada una de las 
% respuestas del mismo para las excitaciones Qi=2*u(t) y 
% P(t)=6*[p(t)-p(t-20)]. Verificar ambos resultados en MatLab.

clc;
clear;
close all;

%% Parte termica
dt_t=0.001;
t=0:dt_t:40;
CI=(0);
Rth=0.5;
Cth=2;
TITA_AMB=20;
% Senal de entrada
x0_in=@(t) 6*(rampa(t)-rampa(t-20));
pot=x0_in(t);

% Constantes hallada a partir de la sol.homogenea
tao_t=Rth*Cth;
lambda_t=-1/tao_t;

% Constantes halladas a partir de la sol. particular
% para 0<t<20
A=6*Rth;
B=-6*Rth^2*Cth;
% para t>20
C=20*A;

% Constantes halladas a partir de las CI
% para 0<t<20
k1=6*Rth^2*Cth;
% para t>20
k2=k1*(1-exp(TITA_AMB/tao_t));

% Solucion numerica
[t_ode, Y1] = ode45(@(t,y) first_order_function_T(t,y,x0_in), t, CI);
Y_numerica_T=Y1+TITA_AMB; % Sumo los 20°C de temperatura ambiente.

% Solucion analitica
tita_tramo1=(k1*exp(-t/tao_t)+A*t+B).*(escalon(t)-escalon(t-20)); % 0<t<20
tita_tramo2=(k2*exp(-t/tao_t)+C).*escalon(t-20); % t>20
% De esta forma le informo a Matlab que la funcion a evaluar es por tramos
Y_analitica_T=tita_tramo1+tita_tramo2+TITA_AMB;

% Senal/es de entrada
x1_in=@(t) 6*rampa(t);
x2_in=@(t) -6*rampa(t-20);
xt_in=x1_in(t)+x2_in(t);
% Con estas 3 funciones, evaluo si es LIT
[t_ode1, Y2] = ode45(@(t,y) first_order_function_T(t,y,x1_in), t, CI);
[t_ode2, Y3] = ode45(@(t,y) first_order_function_T(t,y,x2_in), t, CI);
Ylit=Y2+Y3+20;

% Graficos
figure;

subplot(211)
plot(t,pot,'g','linewidth',2)
xlabel('t(seg)')
ylabel('Potencia(W)')
grid on
axis tight
title('P(t)=6*[p(t)-p(t-20)]')
ylim([0 130])

subplot(212)
plot(t,Y_analitica_T,'r:',t_ode,Y_numerica_T,'c-.',t_ode,Ylit,'w--','linewidth',2)
xlabel('t(seg)')
ylabel('Temperatura(°C)')
grid on
axis tight
legend('Analitica por tramos','Numerica','Numerica LIT')
title ('Función temperatura tanque - numerica, LIT y analitica')
ylim([0 130])

%% Parte hidraulica

dt_h=0.001;
t=-5:dt_h:35;
CI=(0);
Rh=0.8;
Ch=5;
P_ATM=0;
% Senal de entrada
x_in=@(t) 2*escalon(t);
Qi=x_in(t);

% Constante hallada a partir de la sol.homogenea
tao_h=Rh*Ch;
lambda_h=-1/tao_h;

% Constantes halladas a partir de la sol. particular
D=2*Rh;

% Constantes halladas a partir de las CI
k=-D; % k=2*Rh

% Solucion numerica
[t_ode, Y] = ode45(@(t,y) first_order_function_H(t,y,x_in), t, CI);
Y_numerica_H=(1/Rh)*Y+P_ATM; % Sumo los 0°C de presion atmosferica.

% Solucion analitica
p=k*exp(-t/tao_h)+D;
Qo=(p/Rh).*escalon(t);
Y_analitica_H=Qo+P_ATM;

% Graficos
figure;

subplot(211)
plot(t,Qi,'g','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('Flujo (m^3/seg)')
title('Qi(t)=2*u(t)')
ylim([0 2.5])

subplot(212)
plot(t_ode,Y_numerica_H,'k',t,Y_analitica_H,'y--','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('Flujo (m^3/seg)')
legend ('Numerica','Analitica')
title ('Funcion flujo de salida - numerica y analitica')
ylim([0 2.5])

% 1. El flujo de salida Qo(t) se estabiliza en 2 m^3/seg.
% 2. La temperatura del tanque alcanza un valor maximo de 80°C. Es decir,
% está 60°C por encima de la  temperatura ambiente (20°C).

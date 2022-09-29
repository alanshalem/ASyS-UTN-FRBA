%% TareaA_Clase5_Punto3
% Sanchez Sosa

% Consigna de la clase #A
% 1. Obtener las ecuaciones que modelan el soporte de la pierna del
% cuerpo humano, en terminos de la fuerza F(t) ejercida por el individuo:
%
%                           (figura PPT AV)
%
% 2. ¿Se obtienen las mismas ecuaciones si se colocan el resorte k_2 y el
% amortiguador B uno a continuacion del otro?
% 3. Eliminar M_1 y K_1 y expresar la ecuacion del sistema resultante en
% terminos del desplazamiento de M_2. Graficar su diagrama en bloques
% ¿El sistema obtenido es LIT? Verificarlo en MatLab.

clc;
clear;
close all;

dt=0.01;
t=-10:dt:10;
CI=[0;1]; % Condiciones iniciales -> y(0)=0 ^ y(0)=1
fc=@(t) t; % Defino mi senal de entrada
[t_ode, Y]=ode45(@(t,y) function_order_2(t,y,fc), t, CI);

figure;
sgtitle('Consigna de la clase #A')

subplot(4,4,1:4)
plot(t,fc(t), 'linewidth',2)
grid on
axis tight
xlabel('t')
ylabel('f(t)')
title("Entrada funcion original")
xlim([-2 2])

subplot(4,4,5:8)
plot(t_ode,Y, 'linewidth',2)
grid on
axis tight
xlabel('t')
legend('y(t)',"y'(t)")
title("Salida funcion original")

% Linealidad

% Si es lineal->T[a*x_1(t)+b*x_2(t)]=a*y_1(t)+b*y_2(t)

% Incremento la entrada x3
subplot(4,4,9:10)
plot(t,fc(3*t),'linewidth',2)
grid on
axis tight
xlabel('t')
ylabel('f(3t)')
title('Entrada incrementada x3')
xlim([-2 2])

% Incremento la salida x3
subplot(4,4,13:14)
plot(t,3*Y(1:2001,1),'linewidth',2)
grid on
axis tight
xlabel('t')
ylabel('3*y(t)')
title('Salida incrementada x3')

% Invariancia temporal

% Desplazo la entrada 2 segundos
t0=2;
subplot(4,4,11:12)
plot(t,fc(t+t0),'linewidth',2)
grid on
axis tight
xlabel('t')
ylabel('f(t+2)')
title('Entrada desplazada 2 seg.')
xlim([-2 2])

% Desplazo la salida 2 segundos
t0=2;
subplot(4,4,15:16)
plot(t+t0,Y(1:2001,1),'linewidth',2)
grid on
axis tight
xlabel('t')
ylabel('y(t+2)')
title('Salida desplazada 2 seg.')


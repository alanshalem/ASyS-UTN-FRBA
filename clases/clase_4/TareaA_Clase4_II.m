%% TareaA_Clase4_Punto_2

% Consigna de la clase #A
% 1. Evaluar los siguientes sistemas en terminos de linealidad,
% memoria,causalidad,estabilidad e invariancia temporal:
%   a)y[n]=sen[x[n-2]]
%   b)y(t)=2e^[-4.x(t+1)]
%   c)y(t)=2.x(3t)
%   d)y[n]=n.x^2[n]
%   e)y(t)=d(x(t))/dt
% 2. Generar dos funciones en Matlab, de modo de simular los sistemas c) y
% d)(Sc[x[n]] y Sd[x(t)] y determinar si se los puede considerar LIT,
% analizando sus entradas a respuestas tipo funcion escalon u(t)

%%%%%%%%%%%%

clc;
clear;
close all;

%% c)

% Funcion c) y(t)=2.x(3t)
dt_c = 0.001;
t = -5:dt_c:10;
Sc = @(t, fc) 2 .* fc(3 .* t);
y1t = Sc(t, @(t) t);

% Graficos funcion c)

figure;
subplot(521)
plot(t, y1t, 'k', 'linewidth', 2);
xlabel('t(seg)')
ylabel('2 * x(3 * t)')
grid on
axis tight
title('2*x(3*t)')
ylim([-0.25 2.25])

%% d)

% Funcion d) y[n]=n.x^2[n]
dn_d = 1;
n = -20:dn_d:20;
Sd = @(n, fc) n .* (fc(n).^2);
y2n = Sd(n, @(n) n);

% Graficos funcion d)

subplot(522)
stem(n, y2n, 'k', 'linewidth', 2)
xlabel('n(muestras)')
ylabel('n * x^2[n]')
grid on
axis tight
title('n * x^2[n]')
ylim([-8000 8000])

%% Linealidad c)

% % Si es lineal->T[a*x_1(t)+b*x_2(t)]=a*y_1(t)+b*y_2(t)
y1t_linealidad_entrada = Sc(t, @(t) 2 .* t);
y2t_linealidad_salida = 2 * Sc(t, @(t) t);
% Graficos funcion c) linealidad
subplot(523)
plot(t, y1t_linealidad_entrada, 'r', 'linewidth', 2);
title('LINEALIDAD: 2*x(3*(2*t))')
xlabel('t')
ylabel('2 * x(3 * (2 * t))')
grid on
axis tight
xlim([-1 1])

subplot(525)
plot(t, y2t_linealidad_salida, 'r', 'linewidth', 2);
title('LINEALIDAD: 2*2*x(3*t)')
xlabel('t')
ylabel('2 * 2 * x(3 * t)')
grid on
axis tight
xlim([-1 1])

%% Linealidad d)

% % Si es lineal->T[a*x_1(t)+b*x_2(t)]=a*y_1(t)+b*y_2(t)

y1n_linealidad_entrada = Sd(n, @(n) 2 .* n);
y2n_linealidad_salida = 2 * Sd(n, @(n) n);
% Graficos funcion d) linealidad
subplot(524)
stem(n, y1n_linealidad_entrada, 'r', 'linewidth', 2)
title('LINEALIDAD: 2*n*x^2[2*n]')
xlabel('n')
ylabel('2 * n * x^2[2 * n]')
grid on
axis tight

subplot(526)
stem(n, y2n_linealidad_salida, 'r', 'linewidth', 2)
title('LINEALIDAD: 2*[2*n*x^2[n]]')
xlabel('n')
ylabel('2 * 2 * n * x^2[n]')
grid on
axis tight
xlim([-20 20])

%% Invarianza temporal c)

% y(t)=2.x(3t)
% % Si es invariante->T[x(t-t0)]=x(t-t0)

y1t_invariante_entrada = Sc(t, @(t) t - 2);
y2t_invariante_salida = Sc(t, @(t) t - 2);

% Graficos funcion c) invariante
subplot(527)
plot(t, y1t_invariante_entrada, 'linewidth', 2);
title('INVARIANZA TEMPORAL: x(3*(t-2))')
xlabel('t')
ylabel('x(3 * (t - 2))')
grid on
axis tight
xlim([-1 1])

subplot(529)
plot(t, y2t_invariante_salida, 'linewidth', 2);
title('INVARIANZA TEMPORAL: x(3*(t-2))')
xlabel('t')
ylabel('x(3 * (t - 2))')
grid on
axis tight
xlim([-1 1])

%% Invariancia temporal d)

% y[n]=n.x^2[n]
% % Si es invariante->T[x(t-t0)]=x(t-t0)
y1n_invariante_entrada = Sd(n, @(n) n - 2);
y2n_invariante_salida = Sd(n - 2, @(n) n - 2);

% Graficos funcion d) invariante
subplot(528)
stem(n, y1n_invariante_entrada, 'linewidth', 2)
title('INVARIANZA TEMPORAL: n*x^2[n-2]')
xlabel('n')
ylabel('n * x^2[n - 2]')
grid on
axis tight
xlim([-20 20])

subplot(5, 2, 10)
stem(n, y2n_invariante_salida, 'linewidth', 2)
title('INVARIANZA TEMPORAL: (n-2)*x^2[n-2]')
xlabel('n')
ylabel('(n - 2) * x^2[n - 2]')
grid on
axis tight
xlim([-20 20])

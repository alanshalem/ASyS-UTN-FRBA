% # Consigna de la clase #B (20 minutos) pag45
%
% 1. Graficar las siguientes señales en MatLab y calcular numéricamente su potencia o energía según sea el caso:
%    a) x1(t)=e^(-|t|)
%
%    b) x2(t)=sen(2*pi*5t)+cos(2*pi*10t)
%
%    c) x1[n]=(1/2)^(n)*u[n]
%
%    d) x2[n]=cos(pi/2*n)
%
% 2. Verificar analiticamente la totalidad de los resultados obtenidos.

% ###############################################################################################

%% Resolucion

%% a)
dt = 0.01;
t = -20:dt:20;
x1 = exp(-abs(t));
EA_1 = ENERGIA(x1, dt); % Ex1 = 1.0000
% EA_2 = sum(abs(x1).^2)*dt
% EA_3 = trapz(t, abs(x1).^2)

% Otra forma de calcular la energia (discretizando el vector temporal)
% n=-10:10
% x1=exp(-abs(n))
% EA_4 = sum(abs(x1).^2)*1

% Grafico a)
grid on;
axis tight;
subplot(2, 2, 1);
plot(t, x1, 'r', 'linewidth', 2);
title('x1(t)=exp(-abs(t))');
xlabel('t');
ylabel('x1(t)');

%% b)
% x2=sin(2*pi*5*t)+cos(2*pi*10*t);
% Como grafico bien esta funcion utilizando los conceptos?
f01 = 5; % frecuencia 1
f02 = 10; % frecuencia 2
w01 = 2 * pi * f01; % velocidad angular 1
w02 = 2 * pi * f02; % velocidad angular 2
f0 = gcd(f01, f02); % MCD de las frecuencias es 5 - frecuencia de la señal resultante
T0 = 1/5; % Periodo de la señal resultante
fs = 30 * f0; % Frecuencia de muestreo
F0 = f0 / fs; % Frecuencia Digital
dt_x2 = 1 / fs; % Defino el paso temporal como la inversa de mi frecuencia de muestreo
t_x2 = (-2 * T0 - dt_x2):dt_x2:(3 * T0 - dt_x2); % Defino el vector intervalo temporal
x2 = sin(w01 * t_x2) + cos(w02 * t_x2);

% Grafico b)
grid on;
axis tight;
subplot(2, 2, 2);
plot(t_x2, x2, 'r', 'linewidth', 2);
title('x2=sin(2*pi*5*t)+cos(2*pi*10*t)');
xlabel('t');
ylabel('x2(t)');
% Para utilizar la funcion potencia es necesario pasarle un solo periodo
% Esta es la forma de aislar un periodo
tt = 0:dt_x2:T0 - dt_x2;
% Otra forma mas engorrosa.
x2_n_zero = -t_x2(1) / dt_x2 + 1;
x2_n_end = x2_n_zero + T0 / dt_x2 - 1;
x2_ciclo_slice = x2_n_zero:x2_n_end;

POT2 = POTENCIA(x2, T0, dt_x2);

%% c) digital, senal de energia
n = -5:20;
x3 = ((1/2).^(n) .* escalon(n));
EC = ENERGIA(x3, 1);

% Grafico c)
grid on;
axis tight;
subplot(2, 2, 3)
stem(n, x3, 'linewidth', 2);
title('x3=((1/2)*exp((n)).*escalon(n));');
xlabel('n');
ylabel('x3[n]');

%% d)
dn = 1;
n = -15:dn:16;
fo = 1/4;
% fo=k*No, entonces necesito un ciclo de mi se�al continua para obtener 4 muestras de la se�al discreta antes de que se repita el patron
% Que lo constata la verificacion analitica.
wo = 2 * pi * fo; % wo tiene que ser igual a pi/2 porque me lo da el ejercicio
To = 1 / fo;
% Aca estoy aislando un periodo
tn = 0:dn:To - dn;
x4 = cos((wo) * n);
POT4 = POTENCIA(x4, To, dn);

% Grafico d)
grid on;
axis tight;
subplot(2, 2, 4);
stem(n, x4, 'linewidth', 2);
title('x2[n]=cos(pi/2*n)');
xlabel('t');
ylabel('x4(t)');
xlim([-15 16]);
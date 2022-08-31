% Consigna de la clase #B (10 minutos)
%
% 1. Determinar wo, fo y To, (Oo, Fo y No, en el caso discreto de las siguientes funciones:  
%
% a) x(t)=sen(2pi260t + pi/4)+4cos(2pi440t)  
%
% b) x[n]= sen[pi/3n]+cos[pi/6n]
%
% 2. Verificar el resultado obtenido en Matlab a partir de sus graficos. Reproducir audiblemente x(t) utilizando Fs=8000Hz para efectuar el muestreo. Comparar con la componente de 260Hz y la de 440Hz.
%
% 3. Proponga una frecuencia angular para una de las senales de manera que la suma no resulte periodica �Se advierte algo particular en su comportamiento?�Se puede efectuar lo mismo en el caso b)�Cual sera la diferencia?


%% a)
fs=8000;
dt=1/fs;
t=0:dt:1/10;
x_t = sin(2*pi*260*t)+cos(2*pi*440*t); % Suma
% x_t = sin(2*pi*260*t) % Tono 260Hz
% x_t = cos(2*pi*440*t) % Tono 440Hz

%% b)
dn=1;
n=0:dn:100;
x_n = sin(pi/3*n)+cos(pi/6*n);

%% Grafico
sgtitle('Consigna de la clase #B')
%
grid on
axis tight
subplot(2, 1, 1);
plot(t, x_t, 'linewidth', 2);
title('x(t)=sin(2*pi*260*t)+cos(2*pi*440*t)', 'FontSize', 16);
xlabel('t');
ylabel('x(t)');
xlim([0 0.1])
sound(x_t, fs)
%
grid on
axis tight
subplot(2, 1, 2);
stem(n, x_n, 'linewidth', 2);
title('x[n]= sen[pi/3n]+cos[pi/6n]', 'FontSize', 16);
xlabel('t');
ylabel('x(t)');
%% TareaA_Clase9
% Sanchez Sosa
%
% Consigna de la clase #A
%
% Se dispone de un sistema para medir distancia por lo cual se emite
% un pulso ultrasónico E(t) de 1 s de duraciOn Iniciada la emisiOn, el
% receptor espera la llegada del pulso reflejado por un objeto R(t)
% que se contamina con interferencia r(t) durante su recorrido e impide
% su correcto análisis:
%
% E(t)->Pulso emitido
% R(t)=k.E(t-t0)+r(t)->Pulso recibido
%
% Aplicar en MatLab la función de correlación cruzada FCC a las
% senales medidas (alojadas en el campus virtual, Ts=0.001 s de modo
% de determinar el desfasaje temporal t0 entre ambas (demora en el
% recorrido de avance y regreso del pulso). Calcular la distancia al
% objeto detectado, si la velocidad del sonido en el aire es de 344 m/s

clc;
clear;
close all;

sE=load('C:\Users\Matias Sanchez\Documents\ASYS\Ejercicios Matlab\Clase 9\E(t).txt');
sR=load('C:\Users\Matias Sanchez\Documents\ASYS\Ejercicios Matlab\Clase 9\R(t).txt');

dt=0.001; % dt=Ts
t=0:dt:(length(sE)-1)*dt; % Otra forma: t=0:dt:length(sE)*dt-dt;

figure;
subplot(211)
plot(t,sE,'r','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('E(t)')
title('Senal emitida')

subplot(212)
plot(t,sR,'b','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('R(t)')
title('Senal recibida')

%% Calculo del t0

[Rxy,tau]=xcorr(sR,sE);

figure;
plot(tau*dt,Rxy*dt,'g','linewidth',2)
grid on
axis tight
xlabel('tao(seg)')
ylabel('Rxy(tao)')
title('Correlacion cruzada')

[value,index]=max(Rxy); % Obtengo el valor para el cual las 2 senales 
% coiciden

delay=tau(index)*dt; % Hallo cuanto tiempo demoro la senal en ser recibida

%% Calculo de la distancia.
distance=344*(delay/2);


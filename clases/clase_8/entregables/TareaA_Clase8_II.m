%% TareaA_Clase8_Punto2
% Sanchez Sosa
%
% Consigna de la clase #A punto 2
%
% 2. ¿Se puede inferir alguna conclusion del efecto que impone el sistema 
% a las excitaciones sinusoidales en d)? Comparar excitacion vs. respuesta 
% en un mismo grafico, una vez transcurrido el regimen transitorio, 
% para ambas frecuencias.

clc;
clear;
close all;

%RECORDANDO...
%Funcion d) x(t)=cos(2*pi*f0*t).*u(t){f01=1Hz, f02=10Hz}

dt=0.001;
t=-5:dt:5;

h=2*exp(-2*t).*escalon(t); % Respuesta impulsional

f01=1;
f02=10;
w01=2*pi*f01; % w01=2*pi 1/seg.
w02=2*pi*f02; % w02=20*pi 1/seg.
T01=1/f01; % T01=1 seg.
T02=1/f02; % T02=0.1 seg.
Ts1=T01/100; % Ts1=0.01 seg.
Ts2=T02/100; % Ts2=0.001 seg.
%td1=-5*T01:Ts1:5*T01; -> Si quiero que muestre "x" periodos 
%td2=-50*T02:Ts2:50*T02; -> -> Si quiero que muestre "x" periodos
xd1=cos(w01*t).*escalon(t);
xd2=cos(w02*t).*escalon(t);

yd1=conv(xd1,h)*dt;
yd2=conv(xd2,h)*dt;
tc=(t(1)+t(1)):dt:(t(end)+t(end));

% A partir de h(t) -> tao=1/2 seg. y como el tiempo de detencion es 
% td=5*tao -> t_detencion = 5*1/2 seg = 2.5 seg.
tao=1/2;
[f_t,pos_t]=find(tc==5*tao); % De esta forma, encuentro tanto el valor de t 
% como de y a partir del cual grafico la senal en regimen estacionario.

% Grafico x(t)=cos(2*pi*f0*t).*u(t)

figure;

plot(t,xd1,'y',tc,yd1,'c-.','linewidth',2)
hold on
plot(tc(pos_t:end),yd1(pos_t:end),'b:','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
title('Relacion excitacion - respuesta (f0=1Hz)')
legend('x(t)','y(t)','Regimen estacionario')
xlim([0 5])
ylim([-1 1])

figure;

plot(t,xd2,'y',tc,yd2,'c-.','linewidth',2)
hold on
plot(tc(pos_t:end),yd2(pos_t:end),'b:','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
title('Relacion excitacion - respuesta (f0=10Hz)')
legend('x(t)','y(t)','Regimen estacionario')
xlim([0 5])
ylim([-1 1])

% Se concluye que conforme aumenta la frecuencia de la senal de entrada, 
% disminuye la amplitud de la senal de salida, es decir, se atenua la senal
% de salida respecto de la de entrada; se presencia un comportamiento
% similar al de un filtro pasa-bajos.

%% TareaA_Clase7_Punto2
% Sanchez Sosa
%
% Consigna de la clase #A punto 2.
%
% 2. Comparar en un unico gráfico excitacion vs respuesta, el resultado
% del punto b) ¿Que efecto impone el sistema LIT sobre una senal
% de tipo sinusoidal? ¿Se modifica su frecuencia? (comparar varios
% ciclos) - b) x[n]=cos[(pi/4)*n]*u[n]

clc;
clear;
close all;

% Funcion b) en tiempo discreto

F0=1/8;
W0=2*pi*F0;
N0=1/F0;
dn_d=1;
n_d=0:dn_d:2*N0-dn_d; % Pido que me muestre 2 periodos de la senal.
xn_d=cos(W0*n_d).*escalon(n_d);

% Funcion b) en tiempo continuo

f0=1/8;
w0=2*pi*f0;
T0=1/f0;
dt=T0/1000; % dt=Ts
t=-(T0-dt):dt:4*T0-dt; % Pido que me muestre 4 periodos de la senal.
x=@(t) escalon(t); % La considero mi entrada del sistema 
yt=@(t) cos(W0*t).*x(t); % La considero mi salida del sistema

dni_d=1;
ni_d=0:dni_d:7;
xb=cos(W0*ni_d).*escalon(ni_d); % Si considero un solo periodo, el vector 
% a evaluar seria x[n]={1,0.707,0,-0.707,-1,-0.707,0,0.707}
hb=1/3*(delta(ni_d)+delta(ni_d-1)+delta(ni_d-2));
yb=conv(xb,hb);
% Long_Conv(y[n])=Lx+Lh-1
nTb=(ni_d(1)+ni_d(1)):(ni_d(end)+ni_d(end));

figure;
sgtitle('Punto n°2')

subplot(311)
stem(n_d,xn_d,'c','linewidth',2)
hold on
stem(nTb,yb,'b','linewidth',2)
grid on
axis tight
xlabel('n(mtras)')
title('Relacion excitacion-respuesta')
legend('Excitacion','Respuesta')
ylim([-1.25 1.25])

% Chequeo LIT b)-> Considero x(t)=u(t) mi entrada e 
% y(t)=cos((pi/4)*t)*x(t)

A=1.5; t0=-pi; % Constantes para evaluar si el sistema es LIT.

subplot(312)
plot(t,x(t),'k',t,A*x(t+t0),'r--','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('x(t)')
title('Entrada')
legend('Sin LIT','Con LIT')
ylim([-0.25 1.75])

subplot(313)
plot(t,yt(t),'k',t,A*yt(t+t0),'r--','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('y(t)')
title('Salida')
legend('Sin LIT','Con LIT')
ylim([-1.75 1.75])

% Respuesta: La senal de tipo sinusoidal cumple con las propiedades del
% sistema LIT. Dicho esto, el sistema LIT no hace que se modifique la
% frecuencia de la senal en cuestion.

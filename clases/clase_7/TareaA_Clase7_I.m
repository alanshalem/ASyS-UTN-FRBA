%% TareaA_Clase7_Punto1
% Sanchez Sosa
%
% Consigna de la clase #A punto 1.
%
% 1. Utilizar MatLab para obtener la salida del siguiente sistema LIT cuya 
% respuesta impulsional se detalla. Verificar ambos resultados 
% analiticamente (las primeras muestras de ser necesario).
%   h[n]=1/3*(d[n]+d[n-1]+d[n-2])
%   a) x[n]={1,-2,3,-4,5,-6}
%   b) x[n]=cos[(pi/4)*n]*u[n]

clc;
clear;
close all;

% a)x[n]={1,-2,3,-4,5,-6}
dni=1;
ni=-1:dni:7;
xa=[0,1,-2,3,-4,5,-6,0,0,]; % x[n]
ha=1/3*(delta(ni)+delta(ni-1)+delta(ni-2)); % h[n]=1/3*[0,1,1,1,0,0,0,0,0]
ya=conv(xa,ha);
% Long_Conv(y[n])=Lx+Lh-1
nTa=(ni(1)+ni(1)):(ni(end)+ni(end));

% Grafico a)x[n]={1,-2,3,-4,5,-6}
figure;
sgtitle('Entrada a)')

subplot(311)
stem(ni,xa,'r','linewidth',2)
grid on
axis tight
xlabel('n(mtras)')
title('x[n]')
ylim([-6 6])

subplot(312)
stem(ni,ha,'g','linewidth',2)
grid on
axis tight
xlabel('n(mtras)')
title('h[n]')
ylim([0 0.5])

subplot(313)
stem(nTa,ya,'b','linewidth',2)
grid on
axis tight
xlabel('n(mtras)')
title('y[n]=x[n]*h[n]')
ylim([-2.5 1.5])

% b)x[n]=cos[(pi/4)*n]*u[n]
% 2*pi*W0=pi/4 -> W0=1/8=k/N0 -> para k=1, N0=8 -> necesito 1 ciclo de
% la senal continua para obtener un periodo de 8 muestras de la senal 
% discreta

%%%
F0=1/8;
W0=2*pi*F0;
N0=1/F0;
dn_d=1;
n_d=0:dn_d:2*N0-dn_d; % Pido que me muestre 2 periodos de la senal.
xn=cos(W0*n_d).*escalon(n_d);
%%%

dni_d=1;
ni_d=-1:dni_d:7;
xb=cos(W0*ni_d).*escalon(ni_d); % Si considero un solo periodo, el vector a 
% evaluar seria x[n]={1,0.707,0,-0.707,-1,-0.707,0,0.707}
hb=1/3*(delta(ni_d)+delta(ni_d-1)+delta(ni_d-2));
yb=conv(xb,hb);
% Long_Conv(y[n])=Lx+Lh-1
nTb=(ni_d(1)+ni_d(1)):(ni_d(end)+ni_d(end));

% Grafico b)x[n]=cos[(pi/4)*n]*u[n]
figure;
sgtitle('Entrada b)')

subplot(311)
stem(ni_d,xb,'r','linewidth',2)
grid on
axis tight
xlabel('n(mtras)')
title('x[n]')

subplot(312)
stem(ni_d,hb,'g','linewidth',2)
grid on
axis tight
xlabel('n(mtras)')
title('h[n]')
ylim([0 0.5])

subplot(313)
stem(nTb,yb,'b','linewidth',2)
grid on
axis tight
xlabel('n(mtras)')
title('y[n]=x[n]*h[n]')
ylim([-1 1])

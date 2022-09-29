%% TareaBIntegradora_Clase6_II
% Sanchez Sosa
%
% 2. Discretizar el sistema obtenido en a) a una tasa de muestreo TS=0,1s.
% Calcular los primeras 5 muestras de su respuesta indicial g[n], 
% determinar el error respecto de g(nTs) y graficar su diagrama en bloques.
%
% RECORDANDO: Para la EDO de 1er orden y'(t)+b*y(t)=x(t) se obtiene la
% version discretizada en recurrencias hacia adelante -->
% y[n+1]-a*y[n]=Ts*x[n] donde a=1-b*Ts. Ahora, si hago el cambio de 
% variables k=n+1, obtengo una ecuacion en recurrencias hacia atras --> 
% y[k]-a*y[k-1]=Ts*x[k-1].

clc;
clear;
close all;

dn=1;
Ts=0.1;
b=0.5;
a=1-b*Ts;
x=@(k) escalon(k);
w=@(k) escalon(k);

for k=0:dn:4*dn
  c=x(k-1);
    w(k-1)=c;
    w(k)=a*w(k-1)+Ts*x(k-1);
end



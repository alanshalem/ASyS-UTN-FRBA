%1) x= RUIDO BLANCO GAUSSIANO
%2) y= CON 8x,y) dt
%3) Rxx; Ryy;


%% Tarea
dt = 0.001; t= 0: dt: 5 ;
h = exp(-2*t) .*escalon(t) ;
% Señal esocástica Ruido Blaco Gaussiano, generacion de ruido blanco
% gaussiano
n=wgn(1, length(t),0) ;
%x= 0.* ones(1,length(t)) + n;
%x= 1*sin(2*pi*t) + n;
x= n;
% Punto a)
mu_x = mean(x)
y = conv(h, x)*dt ;
mu_y = mean(y)
% GRAFICAR ENTRADA Y SALIDA
[Rxx, tau1] = xcorr(x , x) ;
%Graficar: tau1*dt, Rxx*dt
[Rhh, tau2] = xcorr(h , h) ;
Ryy = conv( Rhh, Rxx)*dt ;
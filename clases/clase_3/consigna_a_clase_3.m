% # Consigna de la clase #A (20 minutos) pag33
% 
% Sea la siguiente senal continua x(t) constituida por senales elementales:  
% 
% x(t)=p(t-1)-p(t-2)-2u(t-3)+u(t-4)
% 
% 1. Utilizar Matlab para graficar la forma de la funcion y su derivada. Efectuar luego las siguientes acciones, verificando analiticamente dos de los resultados obtenidos:
% 
%   a) f(t+-2); b)f(3t); c) f(-2t+1); d)f(t/2-2)
% 
% 2. Considerar la version discreta de x(t) (x[n]) y graficar la forma resultante de llevar a cabo la accion x[-n+3]

% ######################################################################################################################

%% Resolucion
dt = 0.01;
t = 0:dt:5;
x_t = rampa(t-1)-rampa(t-2)-2*escalon(t-3)+escalon(t-4);
% otra forma
% f = @(t) rampa(t-1)-rampa(t-2)-2*escalon(t-3)+escalon(t-4);
x_dt = diff(x_t)/dt; %dt=t(2)-t(1)

%% Graficos
subplot(2,1,1)
plot(t,x_t, 'linewidth', 2);
title('Senal Original x(t)=p(t-1)-p(t-2)-2u(t-3)+u(t-4)', 'FontSize', 16);
xlabel('t')
ylabel('x(t)')
ylim([-2 2])

subplot(2,1,2)
plot(t(2:end),x_dt, 'linewidth', 2);
% El vector resultante de la derivada va a ser una posicion mas corta, si
% x(t) tiene un largo de 1000, x_d(t) va a tener un largo de 999, y nos
% dara error a la hora de graficar. Por lo tanto, le sacamos un elemento al
% vector de tiempo a la hora de plotear.
% Otra forma
% plot(t(1:end-1),x_dt, 'linewidth', 2);
title("Derivada x'(t)=u(t-1)-u(t-2)-2d(t-3)+d(t-4)", 'FontSize', 16);
xlabel('t')
ylabel('x(t)')
ylim([-2 2])
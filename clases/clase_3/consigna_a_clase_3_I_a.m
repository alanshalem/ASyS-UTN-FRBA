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
% ######################################################################################################################

%% Resolucion
dt = 0.01;
t = -6:dt:12;
x_t = rampa(t - 1) - rampa(t - 2) - 2 * escalon(t - 3) + escalon(t - 4);
x_t_a_plus = rampa((t + 2) - 1) - rampa((t + 2) - 2) + 2 * escalon((t + 2) - 3) + escalon((t + 2) - 4);
x_t_a_minus = rampa((t - 2) - 1) - rampa((t - 2) - 4) + 2 * escalon((t - 2) - 3) + escalon((t - 2) - 4);
x_t_b = rampa((3 * t) - 1) - rampa((3 * t) - 2) + 2 * escalon((3 * t) - 3) + escalon((3 * t) - 4);
x_t_c = rampa((-2 * t + 1) - 1) - rampa((-2 * t + 1) - 2) + 2 * escalon((-2 * t + 1) - 3) + escalon((-2 * t + 1) - 4);
x_t_d = rampa((t / 2) - 1) - rampa((t / 2) - 2) + 2 * escalon((t / 2) - 3) + escalon((t / 2) - 4);

%% Graficos
subplot(4, 2, [1 2]);
plot(t, x_t, 'linewidth', 2);
grid on;
title('x(t)');
xlabel('t');
ylabel('x(t)');
ylim([-2 2]);

subplot(4, 2, 3);
plot(t, x_t_a_plus, 'linewidth', 2);
grid on;
title('x(t+2)');
xlabel('t');
ylabel('x(t+2)');
ylim([-2 12]);

subplot(4, 2, 4);
plot(t, x_t_a_minus, 'linewidth', 2);
grid on;
title('x(t-2)');
xlabel('t');
ylabel('x(t-2)');
ylim([-2 8])

subplot(4, 2, 5);
plot(t, x_t_b, 'linewidth', 2);
grid on;
title('x(3t)');
xlabel('t');
ylabel('x(3t)');
ylim([-2 6])

subplot(4, 2, 6);
plot(t, x_t_c, 'linewidth', 2);
grid on;
title('x(-2t+1)');
xlabel('t');
ylabel('x(-2t+1)');
ylim([-2 6])

subplot(4, 2, [7 8]);
plot(t, x_t_d, 'linewidth', 2);
grid on;
title('x(t/2-2)');
xlabel('t');
ylabel('x(t/2-2)');
ylim([-2 6])

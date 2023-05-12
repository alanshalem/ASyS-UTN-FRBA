% Consigna de la clase #A (30 minutos)
% 1. Utilizar MatLab para obtener la salida del siguiente sistema LIT, cuya respuesta impulsional se detalla.
% Verificar ambos resultados analiticamente (las primeras muestras de ser necesario):
% h[n]=1/2*(d[n]+d[n-1]+d[n-2])
% a) x[n] = {1,-2,3,-4,5,-6}
% b) x[n]=cos((pi/4)*n)*u[n]
% 2. Comparar en un único gráfico excitación vs. respuesta, el resultado del punto b)
% Qué efecto impone el sistema LIT sobre una señal de tipo sinusoidal?
% Se modifica su frecuencia? (comparar ciclos)
% 3. Efectuar el diagrama en bloques correspondiente al sistema representado por h[n]

% respuesta impulsional
h = 1/2 * (impulso(n) + impulso(n - 1) + impulso(n - 2))
x_a = [1, -2, 3, -4, 5, -6]
x_b = cos((pi / 4) * n) * escalon(n)

% respuesta al impulso
y_a = convolucion(x_a, h)
y_b = convolucion(x_b, h)

% graficar
subplot(2, 1, 1)
stem(n, y_a)
title('Respuesta al impulso de x_a[n]')
xlabel('n')
ylabel('y_a[n]')
subplot(2, 1, 2)
stem(n, y_b)
title('Respuesta al impulso de x_b[n]')
xlabel('n')
ylabel('y_b[n]')
grid on

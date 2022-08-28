%% *Consigna de la clase #B (15 minutos)*
%
% Implementar un script en Matlab que ejecute las siguientes acciones:
%
% 1. Generar un vector denominado t definido entre 0 y 4pi a pasos temporales de valor dt=0.001
%
% 2. Calcular sen(2t) y almacenarlo en el vector Sa
%
% 3. Calcular cos(4t) y almacenarlo en el vector Sb
%
% 4. Generar una funcion denominada CALC que reciba los vectores Sa y Sb y proporcione como resultado la suma y el producto elemento a elemento
%
% 5. Graficar en una misma ventana: un eje con Sa en azul, otro con Sb en rojo, un tercero con el resultado de la suma (en verde, punteado) y un cuarto con el resultado del producto (en magenta, a rayas). Los ejes deberan estar ajustados, con sus etiquetas correspondientes y una leyenda identificando cada relacion funcional
%
% *************************************************************************
%
% SOLUCION
%
% *************************************************************************

t = 0:0.001:4*pi; % Vector de tiempo
Sa = sin(2*t); % Seno de 2t
Sb = cos(4*t); % Coseno de 4t

% Otra forma
%calc = @(Sa,Sb) Sa+Sb;
%calc2 = @(Sa,Sb) Sa.*Sb;

[Sum, Product] = CALC(Sa, Sb); % Funcion que calcula la suma y el producto elemento a elemento

%% Grafico
% Otra forma
% plot(t,Sa,'b',t,Sb,'r',t,calc(Sa,Sb),'g',t,calc2(Sa,Sb),'m')
plot(t,Sa,'b',t,Sb,'r',t,Sum,'g:',t,Product,'m--')
axis tight
grid on
xlabel('t')
ylabel('f(t)')
legend('sen(2t)', 'cos(4t)', 'Sum', 'Product')
title('Consigna de la clase #B')


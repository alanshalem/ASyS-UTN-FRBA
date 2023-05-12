function [ dy ] = second_order_function_T(t,y,ft)

%Para resolver la ED: a y''(t) + b y'(t) + c y(t) = d x(t) 
%Normalizarla: y''(t) + b/a y'(t) + c/a y(t) = d/a x(t)
%Despejar el orden mayor: y''(t) = -c/a y(t) - b/a y'(t) + d/a x(t)

%Cambio de variables: y(t) = y1 y reemplazo x(t) por la señal de entrada, 
% por ejemplo u(t)===> y1'' = -c/a*y1 - b/a*y1' + d/a*u(t)

%Otro cambio de variables: y1' = y2 ===> y1'' = y2'
% y2' = -c/a*y1 - b/a*y2 +d/a*u(t)

% En las dos líneas de arriba tengo mi sistema de dos EDOS. Si las expreso
% de manera matricial:
% [y1' ; y2'] = [0 1; -c/a -b/a] * [y1, y2] + [0; d/a]*u(t)

%Para resolver la ED y''(t) + 0.5 y'(t) + 2y(t) = x(t) con x(t) = u(t)
%dy = [0 1; -2 -0.5] * y + [0; 1] .* u(t);

ft = ft(t);     % Apunto el puntero a función evaluado en el t que corresponda

J = 1;  B = 168;  K = 14400;  % Constantes de mi EDO

dy = [0 1; -K/J -B/J] * y + [0; 1/J] .*ft;

end


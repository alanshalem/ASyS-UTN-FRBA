%% *Consigna de la clase #A (15 minutos)*
% Implementar un script en Matlab que ejecute las siguientes acciones:
%
% 1. Generar un vector A de numeros aleatorios de tamaño 1x1000
%
% 2. Calcular el valor medio, el maximo, el minimo y verificar su numero de elementos
%
% 3. Generar un nuevo vector B con los elementos mayores a 3 de A
%
% Se deberan colocar comentarios explicativos de cada sentencia (%)
%
% Ayuda: Utilizar el comando help de Matlab/Octave para las funciones
%
% randn, length, mean, max y min
%
% *************************************************************************
% SOLUCION
% *************************************************************************

% 1. Generar un vector A de numeros aleatorios de tamaño 1x1000
a = randn(1,1000);
% 2. Calcular el valor medio, el maximo, el minimo y verificar su numero de elementos
media = mean(a);
maximo = max(a);
minimo = min(a);
cantidad = length(a);
% 3. Generar un nuevo vector B con los elementos mayores a 3 de A
b = a(a>3);



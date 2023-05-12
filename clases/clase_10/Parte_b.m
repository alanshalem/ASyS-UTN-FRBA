% Frecuencia cardíaca
A1 = importdata('MedFC.txt');
A = A1.data(:, 2:end) ;
medias_ensamble = mean(A);
medias_muestrales = mean(transpose(A)); % de cada alumno
tiempos = ( 0 : length(A(1,:))-1 ) * 15;
alumnos = 1 : 10;
figure;
% COMPLETAR GRAFICAR Analizar
% Completar No / Sí es ergódico en la media

%% FAC (func. autocorrelac) del ensamble con doble for
%%1) Completar similar a la Tarea Anterior !!!!!

%doble for para hacer la autpocorrelacion con diferentes tau

2) AGREGAMOS SIGUIENTE CÓDIGO !!!!
%% %
% todas las FAC de ensamble, t1 y t2 varian, pero mismo tau
[n cant_col]=size(A) ;
for inx_comparaciones = 1:9
FAC(inx_comparaciones) = sum( A(:,inx_comparaciones) .* A(:,inx_comparaciones+1) ) / n ;
end
comparaciones = 1:9;
figure;
stem(comparaciones, FAC);
GRAFICAMOS !!
%% Autocorrelación muestral
for nn= 1:10 % nro. de muestra
Rxx = xcorr( A(nn,:), A(nn,:), 'biased' );
Rxx_muestra(nn) = max(Rxx) ;
end
stem(Rxx_muestra)
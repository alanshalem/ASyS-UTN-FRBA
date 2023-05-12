% Cargamos los datos: le tienen que borrar la primera fila
A = load('MedTemp.txt');
% La primer fila son las horas
horas = A(1, : );
A = A(2:end, : ); % Elimino primer fila
% Las columnas son las horas / Las filas son los dias
% vectores que usaremos como ejes
%horas = [8 10 12 14 16 18 20 22];
dias = [1 2 3 4 5];
figure; hold on
for i=1: 5
stem(horas,A(i,:), 'linewidth',3) ;
end
box on; grid on ;
ylabel('Temperatura','fontsize',14);
xlabel('Hora','fontsize',14);
legend('dia 1','dia 2','dia 3','dia 4','dia 5')

Media_de_Ensamble = mean(A,1);%(la media para cada hora, o cada columna)
Media_de_Realizacion = mean(A,2 ); % (la media de cada día)
% Graficos Completar con stem
horas, Media_de_Ensamble
dias, Media_de_Realizacion
%% Desvíos
desvio_ensamble = std(A,1);
desvio_muestral = std( transpose(A), 1);
% Graficos Completar stem
horas, desvio_ensamble
dias, desvio_muestral
%Otra froma Desvios
figure; subplot(211)
y= Media_de_Ensamble ; % mean(A);
error = std(A) ; errorbar(horas, y, error )
xlabel('Horas'); title('Temperatura media y desviación estandar')
subplot(212)
y = Media_de_Realizacion ; % y= mean(transpose(A));
error = std(transpose(A)) ; errorbar(dias, y, error )
xlabel('Días'); title('Temperatura media y desviación estandar')


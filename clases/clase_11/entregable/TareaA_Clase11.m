%% TareaA_Clase10
% Sanchez Sosa
%
% Consigna de la clase #A
%
% Utilizar Matlab para sintetizar las siguientes expresiones en
% Series de Fourier, identificando los coeficientes an y bn. Efectuar
% el grafico de su Espectro de Frecuencias (N = 10 coeficientes), con el 
% eje de abscisas en Hz. Verificar analIticamente los desarrollos en 
% serie, partiendo de sus definiciones correspondientes.

clc;
clear;
close all;

% Funcion a)
dta=0.001; 
T0a=2*pi;
f0a=1/T0a;
ciclos_a=4;
start_a=-2*T0a;
[ft_a, t_a] = dsierra(T0a, ciclos_a, dta,start_a);

%Armo el vector temporal de la SdF
Ts_a=0.01;
ta=-2*T0a:Ts_a:2*T0a-Ts_a;
w0a=2*pi/T0a;

% Identifico los coeficientes de la SdF
N=10;
n=1:N;
a0_a=2*pi;
an_a=0;
bn_a=-2./n;
SdF_1=a0_a/2; 

% Armo la SdF
for id=n
    SdF_1=SdF_1+an_a*cos(id*w0a*ta)+bn_a(id)*sin(id*w0a*ta);
end 

% Grafico la senal original y la aproximada usando SdF
figure;

plot(t_a,ft_a,'b',ta,SdF_1,'r','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('x_1(t) , x(t)')
legend('Triangular original','SdF analitica')
title('Senal triangular original - Aproximacion con SdF analitica')

figure;
stem([0,n]*f0a,[a0_a/2, bn_a],'linewidth',2)
grid on
axis tight
xlabel('f_0 (Hz)')
ylabel('Amplitud')
title('Espectro de frecuencias a) analitico')

% Funcion b)
dtb=0.001; 
T0b=2*pi;
f0b=1/T0b;
ciclos_b=4;
start_b=-2*T0b;
[ft_b, t_b] = triangular(T0b, ciclos_b, dtb,start_b);

%Armo el vector temporal de la SdF
Ts_b=0.01;
tb=-2*T0b:Ts_b:2*T0b-Ts_b;
w0b=2*pi/T0b;

% Identifico los coeficientes de la SdF
N=10;
n=1:N;
a0_b=pi;
numerador=((-1).^n)-1;
denominador=n.^2;
an_b=(2/pi)*(numerador./denominador);
bn_b=0;
SdF_2=a0_b/2;

% Armo la SdF
for id=n
    SdF_2=SdF_2+an_b(id)*cos(id*w0a*tb)+bn_b*sin(id*w0a*tb);
end 

% Grafico la senal original y la aproximada usando SdF
figure;

plot(t_b,ft_b,'k',tb,SdF_2,'y--','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('x_2(t) , x(t)')
legend('Triangular original','SdF analitica')
title('Senal triangular original - Aproximacion con SdF analitica')

figure;
stem([0,n]*f0b,[a0_b/2, an_b],'m','linewidth',2)
grid on
axis tight
xlabel('f_0 (Hz)')
ylabel('Amplitud')
title('Espectro de frecuencias b) analitico')

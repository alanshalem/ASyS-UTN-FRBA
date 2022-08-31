% # Consigna de la clase #B (20 minutos) pag45
%
% 1. Graficar las siguientes señales en MatLab y calcular numéricamente su potencia o energía según sea el caso:  
%    a) x1(t)=e^(-|t|)
%
%    b) x2(t)=sen(2*pi*5t)+cos(2*pi*10t)
%
%    c) x1[n]=(1/2)^(n)*u[n]
%
%    d) x2[n]=cos(pi/2*n)
%
% 2. Verificar analíticamente la totalidad de los resultados obtenidos.

% ###############################################################################################

%% Resolucion
t=0:0.01:20;
x1=exp(-abs(t));
x2=sin(2*pi*5*t)+cos(2*pi*10*t);
x3=(1/2).^(t)*escalon(t);
x4=cos(pi/2*t);

%% Graficos
figure(1)
plot(t,x1)
title('x1(t)')
xlabel('t')
ylabel('x1(t)')

figure(2)
plot(t,x2)
title('x2(t)')
xlabel('t')
ylabel('x2(t)')

figure(3)
plot(t,x3)
title('x3(t)')
xlabel('t')
ylabel('x3(t)')

figure(4)
plot(t,x4)
title('x4(t)')
xlabel('t')
ylabel('x4(t)')


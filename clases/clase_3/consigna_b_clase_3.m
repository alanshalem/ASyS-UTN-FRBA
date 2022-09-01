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
dt = 0.01;
t=0:dt:20;
x1=exp(-abs(t));
Ex1 = ENERGIA(x1, dt);

x2=sin(2*pi*5*t)+cos(2*pi*10*t);
x3=((1/2).^(t).*escalon(t));
x4=cos((pi/2)*t);

%% Graficos
subplot(2,2,1)
plot(t,x1)
title('x1(t)')
xlabel('t')
ylabel('x1(t)')

subplot(2,2,2)
plot(t,x2)
title('x2(t)')
xlabel('t')
ylabel('x2(t)')
xlim([0 2])
ylim([-2.5 1.5])

subplot(2,2,3)
plot(t,x3)
title('x3(t)')
xlabel('t')
ylabel('x3(t)')

subplot(2,2,4)
plot(t,x4)
title('x4(t)')
xlabel('t')
ylabel('x4(t)')


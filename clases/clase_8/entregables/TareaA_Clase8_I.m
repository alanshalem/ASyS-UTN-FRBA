%% TareaA_Clase8_Punto1
% Sanchez Sosa
%
% Consigna de la clase #A punto 1
%
% 1. Obtener la salida y(t) correspondiente al sistema LIT descripto
% por su respuesta impulsional h(t), aplicando convolución en
% MatLab. Verificar analíticamente los resultados obtenidos en a)
% y c) ¿Pueden aplicarse propiedades?
% Siendo h(t)=2*exp(-2*t).*u(t):
% a)x(t)=u(t)-u(t-2)
% b)x(t)=p(t)-p(t-1)-u(t-1)
% c)x(t)=d(t-1)-d(t-2)
% d)x(t)=cos(2*pi*f0*t).*u(t){f01=1Hz, f02=10Hz}

clc;
clear;
close all;


dt=0.001; %dt=Ts
t=-5:dt:5;
t_abc=(t(1)+t(1)):dt:(t(end)+t(end)); % Este es el intervalo temporal que 
%uso para las tres primeras funciones -> t_abc=tc

h=2*exp(-2*t).*escalon(t); % Respuesta impulsional del sistema

% Funcion a) x(t)=u(t)-u(t-2)
xa=escalon(t)-escalon(t-2);
ya=conv(xa,h)*dt;

% Grafico a) x(t)=u(t)-u(t-2)
figure;

subplot(311)
plot(t,xa,'r','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('x(t)')
title('x(t)=u(t)-u(t-2)')
ylim([0 1.25])

% Grafico respuesta impulsional

subplot(312)
plot(t,h,'g','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('h(t)')
title('h(t)=2*exp(-2t)*u(t)')
ylim([0 2.25])

subplot(313)
plot(t_abc,ya,'b','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('y(t)')
title('y(t)=x(t)*h(t)')
xlim([-5 5])
ylim([0 1.25])

% Funcion b) x(t)=p(t)-p(t-1)-u(t-1)
xb=rampa(t)-rampa(t-1)-escalon(t-1);
yb=conv(xb,h)*dt;

% Grafico b) x(t)=p(t)-p(t-1)-u(t-1)
figure;

subplot(311)
plot(t,xb,'r','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('x(t)')
title('x(t)=p(t)-p(t-1)-u(t-1)')
ylim([0 1.25])

subplot(312)
plot(t,h,'g','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('h(t)')
title('h(t)=2*exp(-2t)*u(t)')
ylim([0 2.25])

subplot(313)
plot(t_abc,yb,'b','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('y(t)')
title('y(t)=x(t)*h(t)')
xlim([-5 5])
ylim([0 0.7])

% Funcion c) x(t)=d(t-1)-d(t-2)
xc=delta(t-1)-delta(t-2);
yc=conv(xc,h)*dt;

% Grafico c) x(t)=d(t-1)-d(t-2)
figure;

subplot(311)
plot(t,xc,'r','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('x(t)')
title('x(t)=d(t-1)-d(t-2)')

% Grafico respuesta impulsional

subplot(312)
plot(t,h,'g','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('h(t)')
title('h(t)=2*exp(-2t)*u(t)')
ylim([0 2.25])

subplot(313)
plot(t_abc,yc,'b','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('y(t)')
title('y(t)=x(t)*h(t)')
xlim([-5 5])
ylim([-6 6])

% Funcion d) x(t)=cos(2*pi*f0*t).*u(t){f01=1Hz, f02=10Hz}

f01=1;
f02=10;
w01=2*pi*f01; % w01=2*pi 1/seg.
w02=2*pi*f02; % w02=20*pi 1/seg.
T01=1/f01; % T01=1 seg.
T02=1/f02; % T02=0.1 seg.
Ts1=T01/100; % Ts1=0.01 seg.
Ts2=T02/100; % Ts2=0.001 seg.
%td1=-5*T01:Ts1:5*T01; -> Si quiero que muestre "x" periodos 
%td2=-50*T02:Ts2:50*T02; -> -> Si quiero que muestre "x" periodos
xd1=cos(w01*t).*escalon(t);
xd2=cos(w02*t).*escalon(t);

yd1=conv(xd1,h)*dt;
t1=(t(1)+t(1)):dt:(t(end)+t(end)); 

yd2=conv(xd2,h)*dt;
t2=(t(1)+t(1)):dt:(t(end)+t(end)); 

% Grafico x(t)=cos(2*pi*f0*t).*u(t)

figure;

subplot(321)
plot(t,xd1,'linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('x(t)')
title('x(t)=cos(w0*t) con f0=1Hz')
xlim([-1 5])
ylim([-1 1])

subplot(322)
plot(t,xd2,'linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('x(t)')
title('x(t)=cos(w0*t) con f0=10Hz')
xlim([-1 5])
ylim([-1 1])

% Grafico respuesta impulsional
subplot(3,2,3:4)
plot(t,h,'g','linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('h(t)')
title('h(t)=2*exp(-2t)*u(t)')
xlim([-1 5])

% Caso f0=1Hz
subplot(325)
plot(t1,yd1,'linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('y(t)')
title('y(t)=x(t)*h(t) con f0=1Hz')
xlim([-1 2])
ylim([-1 1])

% Caso f0=10Hz
subplot(326)
plot(t2,yd2,'linewidth',2)
grid on
axis tight
xlabel('t(seg)')
ylabel('y(t)')
title('y(t)=x(t)*h(t) con f0=10Hz')
xlim([-1 2])
ylim([-1 1])

% Linealidad a) y c) y Propiedad Convolucion para el impulso c)
% Aplico linealidad en a) y c)
% RECORDAR!!!->x(t)*A.d(t-t0)=A.x(t-t0)
%            ->x(t).d(t-t0)=x(t0).d(t-t0)
%            ->x(t)*h(t)=h(t)*x(t) <- p. conmutativa convolucion

x_LIT=@(t) escalon(t);

% Funcion a)
x_conv_a=xa; % Funcion del punto a)

hh=@(t) 2*exp(-2*t).*escalon(t); % Respuesta impulsional

g=@(t) (1-exp(-2*t)).*escalon(t); %Respuesta indicial -> g(t)= int(h(t)*dt)
% -> respuesta del sistema
y_conv_a=conv(x_conv_a,hh(t))*dt; 

figure;

% Entrada x(t)=u(t)-u(t-2)=a.x1(t)+x2(t)
subplot(211)
sgtitle('Probando linealidad')

plot(t,x_conv_a,'r','linewidth',2)
xlabel('t(seg)')
ylabel('x(t)')
grid on
axis tight
title ('x(t)=u(t)-u(t-2)=a.x1(t)+x2(t)')

% y(t)=x(t)*h(t)=a.y1(t)+b.y2(t)
subplot(212)
plot(t_abc,y_conv_a,'k',t,g(t)-1*g(t-2),'y--','linewidth',2)% t_abc = 
% Intervalo temporal del punto a)
xlabel('t(seg)')
ylabel('y(t)')
grid on
axis tight
legend('Por convolucion','Por linealidad')
title ('y(t)=x(t)*h(t) / y(t)=a.y1(t)+b.y2(t)')
xlim([-5 5])

% Funcion c)
% y(t)=x(t)*h(t) - usando la p.conmutativa -> y(t)=h(t)*h(t) -> 
% y(t)=h(t)*(d(t-1)-d(t-2)) -> y(t)=h(t-1)-h(t-2)

x_conv_c=xc; % Funcion del punto c)
y_conv_c=conv(x_conv_c,hh(t))*dt; % Convolucion del punto c)

entrada1=x_LIT(t-1); entrada2=-1*x_LIT(t-2); %Entradas del sistema
salida1= g(t-1); salida2=-1*g(t-2); % Salidas del sistema

% Suma de entradas/salidas
entrada_c=diff(entrada1)/dt+diff(entrada2)/dt; 
salida_c=diff(salida1)/dt+diff(salida2)/dt;
% Con las 2 lineas anteriores se prueba la linealidad del sistema y a la 
% vez la propiedad del impulso en convolucion

figure;

% Entrada x(t)=d(t-1)-d(t-2)=a.x1(t)+x2(t)
subplot(211)
sgtitle('Probando linealidad')

plot(t,x_conv_c,'r',t(1:end-1),entrada_c,'c--','linewidth',2)
xlabel('t(seg)')
ylabel('x(t)')
grid on
axis tight
legend('Por convolucion','Por linealidad')
title ('x(t)=d(t-1)-d(t-2)=a.x1(t)+x2(t)')

% y(t)=x(t)*h(t)=a.y1(t)+b.y2(t)
subplot(212)
plot(t_abc,y_conv_c,'k',t(1:end-1),salida_c,'y--','linewidth',2)
% t_abc = Intervalo temporal del punto c)
xlabel('t(seg)')
ylabel('y(t)')
grid on
axis tight
legend('Convolucion Matlab','Linealidad')
title ('y(t)=x(t)*h(t) / y(t)=a.y1(t)+b.y2(t)')
xlim([-5 5])
ylim([-6 6])

% Comentario: Tanto la linealidad como la propiedad de la convolucion para
% el impulso difieren de la convolucion calculada por Matlab. El problema 
% es que me he fijado innumerables veces y todavia no he encontrado el
% erro. Es lo unico que no pude solucionar.


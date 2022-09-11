% # Consigna de la clase #A (20 minutos) pag33
% 
% Sea la siguiente senal continua x(t) constituida por senales elementales:  
% 
% x(t)=p(t-1)-p(t-2)-2u(t-3)+u(t-4)
% 
% 2. Considerar la version discreta de x(t) (x[n]) y graficar la forma resultante de llevar a cabo la accion x[-n+3]
% x[n]=p[n-1]-p[n-2]-2u[n-3]+u[n-4]
%
% x[-n+3]=p[(-n+3)-1]-p[(-n+3)-2]-2u[(-n+3)-3]+u[(-n+3)-4]
% ######################################################################################################################

n = -5:1:5;
x_n = rampa((-n+3)-1) - rampa((-n+3)-2) - 2*escalon((-n+3)-3) + escalon((-n+3)-4);

figure(1)
stem(n,x_n)
title('x[-n+3]=p[(-n+3)-1]-p[(-n+3)-2]-2u[(-n+3)-3]+u[(-n+3)-4]')
xlabel('n')
ylabel('x[n]')
grid on;
axis tight;

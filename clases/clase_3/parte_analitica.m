dt = 0.01;
t = 0:dt:5;
x_f = rampa(3*t-1)-rampa(3*t-2)-2*escalon(3*t-3)+escalon(3*t-4);
x_t = rampa(3*t-1);
x_t_2 = -rampa(3*t-2);
x_t_3 = -2*escalon(3*t-3);
x_t_4 = escalon(3*t-4);

subplot(5,1,1)
plot(t,x_t, 'linewidth', 2);
ylim([-2 2])

subplot(5,1,2)
plot(t,x_t_2, 'linewidth', 2);
ylim([-2 2])

subplot(5,1,3)
plot(t,x_t_3, 'linewidth', 2);
ylim([-2 2])

subplot(5,1,4)
plot(t,x_t_4, 'linewidth', 2);
ylim([-2 2])

subplot(5,1,5)
plot(t,x_f, 'linewidth', 2);
ylim([-2 2])

%% 3)
fs = 8000;
dn_a = 1/fs;
n = 0:dn_a:1;
Xn_a = sin((2 * pi * 1000) * n + (pi / 4));
grid on
axis tight
plot(n, Xn_a, 'r--');
title('c) x[n]=sen[2pi1000n+pi/4]');
xlabel('n');
ylabel('x[n]');
xlim([0 0.1])
sound(Xn_a, fs)
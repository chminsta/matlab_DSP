clear
n = 0:7;
x = [1 1 2 1 0 -1 -2 -1];
h = [1 1 2 3 2 3 2 1];
%% b
yN = conv(x, h);
%% d
X = fft(x,15);
H = fft(h,15);
Y = H.*X;
yN1 = ifft(Y,15);
subplot(2,1,1)
stem(yN, 'r')
grid on
title('B')
subplot(2,1,2)
stem(yN1, 'm')
grid on
title('D')
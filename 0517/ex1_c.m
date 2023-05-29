
clear
N = 16;
x = [1 2 2 1];
n = 0:3;
%% DTFT
M = 1600;
w = 2*pi * (0:M-1)/M;
X = x * exp(-1j * n' * w);
%% DFT, 직접 계산
x(N) = 0;
n = 0:N-1;
k = 0:N-1;
WN = exp(-1j * 2*pi/N);
X1 = x * WN.^(n' * k); 
x1 = 1/N * X1 * WN.^(-k' * n);
w1 = 2*pi * (0:N-1)/N;
%% DFT, 함수 이용
X2 = fft(x, N);
x2 = ifft(X2, N);
w2 = 2*pi * (0:N-1)/N;

%% 그림
figure(2)
clf
% 크기
subplot(2,1,1)
plot(w/pi, abs(X), 'b--')
hold on
stem(w1/pi, abs(X1), 'r')
grid on
xlim([0 2])
xlabel('Normalized Frequency\omega(\times\pirad/sample)');
ylabel('Magnitude');
title('N = 16')
% 위상
subplot(2,1,2)
plot(w/pi, angle(X), 'b--')
hold on
stem(w1/pi, angle(X1), 'r')
grid on
xlim([0 2])
xlabel('Normalized Frequency\omega(\times\pirad/sample)');
ylabel('Phase')
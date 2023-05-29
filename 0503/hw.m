% Analog Signal
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = exp(-1000*abs(t));
% Discrete-time Signal
Ts = 0.001; n = -25:1:25;
x = exp(-1000*abs(n*Ts));
% Discrete-time Fourier transform
K = 500; k = -K:1:K;
w = pi*k/K;
X = x * exp(-1i*n'*w);
X = real(X);
subplot(2,1,1);plot(t*1000,xa);grid;
xlabel('t in msec.'); ylabel('x2(n)')
title('Discrete Signal'); hold on
stem(n*Ts*1000,x); gtext('Ts=1 msec'); 

subplot(2,1,2);plot(w/pi,X);grid;
xlabel('Frequency in pi units'); ylabel('X2(w)')
title('Discrete-time Fourier Transform'); hold off



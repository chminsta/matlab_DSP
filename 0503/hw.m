% Analog Signal
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = exp(-1000*abs(t));
%
% Continuous-time Fourier Transform
Wmax = 2*pi*2000;%maximum frequency of xa(t)
K = 500; k = -K:1:K;
W = k*Wmax/K;
Xa = xa * exp(-1i*t'*W) * Dt;
Xa = real(Xa);
subplot(2,1,1);plot(t*1000,xa);
xlabel('t in msec.'); ylabel('xa(t)')
title('Analog Signal')
subplot(2,1,2);plot(W/(2*pi*1000),Xa*1000);
xlabel('Frequency in KHz'); ylabel('Xa(jW)*1000')
title('Continuous-time Fourier Transform')
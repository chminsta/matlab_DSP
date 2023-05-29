% Reconstruction using sinc function
%
% Discrete-time Signal x1(n)
Fs = 1000; Ts = 1/Fs; n = -25:1:25; nTs = n*Ts;
x = exp(-1000*abs(nTs));
% Analog Signal reconstruction
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = x * sinc(Fs*(ones(length(nTs),1)*t-nTs'*ones(1,length(t))));
% Plots
plot(t*1000,xa);
xlabel('t in msec.'); ylabel('xa(t)')
title('Reconstructed Signal from x2[n] using sinc function'); hold on
stem(n*Ts*1000,x); hold off
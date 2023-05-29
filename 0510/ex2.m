clear all, close all;
N = 51; % Length of the sequences
n = 0:N-1; % Time index
x1 = sin(2*pi*0.15*n); % Original signal x1-sinusoidal sequence of normalized frequency 0.15
x2 = sin(2*pi*0.1*n) + sin(2*pi*0.3*n); % Original signal x2-sum of two sinusoidal sequences of normalized frequencies 0.1 and 0.3
x3 = x1.*0.8.^n; % Original signal x3-product of the sinusoidal sequence of normalized frequency 0.15 and the real exponential sequence {0.8^n}
% (a)
M = 4; % Up-sampling factor
y1 = upsample(x1,M); % Up-sampled signal y1
L1 = length(y1); % Length of the up-sampled sequence y1
y2 = upsample(x2,M); % Up-sampled signal y2
L2 = length(y2); % Length of the up-sampled sequence y2
y3 = upsample(x3,M); % Up-sampled signal y3
L3 = length(y3); % Length of the up-sampled sequence y3

% (b)
M = 5; % Up-sampling factor
y1 = upsample(x1,M); % Up-sampled signal y1
L1 = length(y1); % Lengh of the up-sampled sequence y1
y2 = upsample(x2,M); % Up-sampled signal y2
L2 = length(y2); % Length of the up-sampled sequence y2
y3 = upsample(x3,M); % Up-sampled signal y3
L3 = length(y3); % Length of the up-sampled sequence y3
figure (2)
subplot(3,2,1), stem(0:N-1,x1(1:N)), ylabel('x1[n]');
title('Originaln signals x1[n], x2[n] i x3[n]')
subplot(3,2,3), stem(0:N-1,x2(1:N)), ylabel('x2[n]');
subplot(3,2,5), stem(0:N-1,x3(1:N)), ylabel('x3[n]');
xlabel('Time index n')
subplot(3,2,2), stem(0:L1-1,y1(1:L1)), ylabel('y1[m]')
title('Up-sampled signals M=5')
axis([0,L1,-1,1])
subplot(3,2,4), stem(0:L2-1,y2(1:L2)), ylabel('y2[m]')
axis([0,L2,-2,2])
subplot(3,2,6), stem(0:L3-1,y3(1:L3)), ylabel('y3[m]')
axis([0,L3,-1,1])
xlabel('Time index m')
figure (1)
subplot(3,2,1), stem(0:N-1,x1(1:N)), ylabel('x1[n]');
title('Original signals x1[n], x2[n] i x3[n]')
subplot(3,2,3), stem(0:N-1,x2(1:N)), ylabel('x2[n]');
subplot(3,2,5), stem(0:N-1,x3(1:N)), ylabel('x3[n]');
xlabel('Time index n')
subplot(3,2,2), stem(0:L1-1,y1(1:L1)), ylabel('y1[m]')
title('Up-sampled signals M=4')
axis([0,L1,-1,1])
subplot(3,2,4), stem(0:L2-1,y2(1:L2)), ylabel('y2[m]')
axis([0,L2,-2,2])
subplot(3,2,6), stem(0:L3-1,y3(1:L3)), ylabel('y3[m]')
axis([0,L3,-1,1])
xlabel('Time index m')
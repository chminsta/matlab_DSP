clear all, close all
N = 51; 
n = 0:N-1; 
x1 = sin(2*pi*0.15*n); 
x2 = sin(2*pi*0.1*n) + sin(2*pi*0.3*n); 
x3 = x1.*0.8.^n; 
M = 2; 
y1 = upsample(x1,M); 
L1 = length(y1); 
y2 = upsample(x2,M); 
L2 = length(y2); 
y3 = upsample(x3,M); 
L3 = length(y3); 
f = 0:1/1024:(1024-1)/1024;
figure(1)
subplot(3,2,1)
X1=fft(x1, 1024);
plot(f, abs(X1));
subplot(3,2,2)
Y1=fft(y1, 1024);
plot(f, abs(Y1));
subplot(3,2,3)
X2=fft(x2, 1024);
plot(f, abs(X2));
subplot(3,2,4)
Y2=fft(y2, 1024);
plot(f, abs(Y2));
subplot(3,2,5)
X3=fft(x3, 1024);
plot(f, abs(X3));
subplot(3,2,6)
Y3=fft(y3, 1024);
plot(f, abs(Y3));

M = 4; 
y1 = upsample(x1,M); 
L1 = length(y1); 
y2 = upsample(x2,M); 
L2 = length(y2); 
y3 = upsample(x3,M); 
L3 = length(y3); 
f = 0:1/1024:(1024-1)/1024;
figure(2)
subplot(3,2,1)
X1=fft(x1, 1024);
plot(f, abs(X1));
subplot(3,2,2)
Y1=fft(y1, 1024);
plot(f, abs(Y1));
subplot(3,2,3)
X2=fft(x2, 1024);
plot(f, abs(X2));
subplot(3,2,4)
Y2=fft(y2, 1024);
plot(f, abs(Y2));
subplot(3,2,5)
X3=fft(x3, 1024);
plot(f, abs(X3));
subplot(3,2,6)
Y3=fft(y3, 1024);
plot(f, abs(Y3));
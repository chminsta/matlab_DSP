clear;
clc;
close;
addpath .\M_file
k = -100:100;
w = (pi/100)*k;
n=0:100;
x=cos(pi*n/2);
y=x.*exp(1i*pi*n/4);
X = x * (exp(-1i*pi/100)).^(n'*k);   %DTFT using matrix-vector product
Y = y * (exp(-1i*pi/100)).^(n'*k);
magX = abs(X);
magY = abs(Y);
angX = angle(X);
angY = angle(Y);
subplot(2,2,1); plot(w/pi,magX); grid
xlabel('frequency in pi units'); title('Magnitude of X'); ylabel('|X|')
subplot(2,2,3); plot(w/pi,magY); grid
xlabel('frequency in pi units'); title('Magnitude of Y'); ylabel('|Y|')
subplot(2,2,2); plot(w/pi,angX); grid
xlabel('frequency in pi units'); title('Angle of X'); ylabel('radians/pi')
subplot(2,2,4); plot(w/pi,angY); grid
xlabel('frequency in pi units'); title('Angle of Y'); ylabel('radians/pi')
n=0:100;
x=cos(pi*n/2);
k1=-100:100;
w1=(pi/100)*k1;
X1 = x*(exp(-1i*pi/100)).^(n'*k1);

k2=-500:500;
w2=(pi/500)*k2;
X2 = x*(exp(-1i*pi/500)).^(n'*k2);

k3=-1000:1000;
w3=(pi/1000)*k3;
X3 = x*(exp(-1i*pi/1000)).^(n'*k3);

k4=-5000:5000;
w4=(pi/5000)*k4;
X4 = x*(exp(-1i*pi/5000)).^(n'*k4);


%plot

subplot(4,2,1);
plot(w1/pi,angle(X1));grid;title("200cut Angle");

subplot(4,2,2);
plot(w1/pi,abs(X1));grid;title("200cut Abs");

subplot(4,2,3);
plot(w2/pi,angle(X2));grid;title("1000cut Angle");

subplot(4,2,4);
plot(w2/pi,abs(X2));grid;title("1000cut Abs");


subplot(4,2,5);
plot(w3/pi,angle(X3));grid;title("2000cut Angle");

subplot(4,2,6);
plot(w3/pi,abs(X3));grid;title("2000cut Abs");

subplot(4,2,7);
plot(w4/pi,angle(X4));grid;title("10000cut Angle");

subplot(4,2,8);
plot(w4/pi,abs(X4));grid;title("10000cut Abs");


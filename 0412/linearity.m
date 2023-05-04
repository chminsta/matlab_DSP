x1 = rand(1,11); x2 = rand(1,11); n=0:10;
alpha = 2; beta = 3; k= 0:500; w = (pi/500)*k;
X1= x1 *(exp(-1i*pi/500)).^(n'*k);   %DTFT of x1
X2= x2 *(exp(-1i*pi/500)).^(n'*k);   %DTFT of x2
x=alpha*x1 + beta*x2;
X = x * (exp(-1i*pi/500)).^(n'*k);
%verification
X_check = alpha*X1 + beta*X2;
error = max(abs(X-X_check));

subplot(2,1,1);
plot(w/pi,X);grid;title('alpha*x1+beta*x2');
subplot(2,1,2);
plot(w/pi,X_check);grid;title('alpha*X1+beta*X2');


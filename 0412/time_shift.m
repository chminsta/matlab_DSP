x=rand(1,11); n=0:10;
k=0:500; w=(pi/500)*k;
X=x*(exp(-1i*pi/500)).^(n'*k);
y=x;m=n+2;
Y=y*(exp(-1i*pi/500)).^(m'*k);
Y1=(exp(-1i*2).^w).*X;
subplot(2,1,1)
plot(w/pi, abs(Y) ); axis([0,1,0,7]);grid;
title(' y=x[n-2]');
subplot(2,1,2)
plot(w/pi, abs(Y1), '--r' ); axis([0,1,0,7]);
grid;
title(' exp(-j2)X(e^jw)');
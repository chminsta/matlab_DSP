n=-5:10; x=rand(1,length(n));
k=-100:100; w=(pi/100)*k;
X=x*(exp(-j*pi/100)).^(n'*k);
%folding property
y=fliplr(x); m= -fliplr(n);
Y=y*(exp(-j*pi/100)).^(m'*k);
%verification
Y_check=fliplr(X);
error=max(abs(Y-Y_check));
subplot(2,1,1); plot(w/pi,Y); 
grid;axis([-1,1,-2,10]);
title('DTFT of y=fliplr(x)');
subplot(2,1,2); plot(w/pi,Y_check); 
grid;axis([-1,1,-2,10]);
title('Y-check=fliplr(X)');
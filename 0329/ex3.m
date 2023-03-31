n=-10:10;
x=exp((-0.1+1i*0.3)*n);

subplot(2,2,1);
stem(n,real(x));
title('real part'); %실수
xlabel('n')
subplot(2,2,2);
stem(n,imag(x));
title('imaginary part'); %허수
xlabel('n')
subplot(2,2,3);
stem(n,abs(x));
title('magnitude part'); %신호의 크기
xlabel('n')
subplot(2,2,4);
stem(n,(180/pi)*angle(x)); %신호의 위상
title('phase part');
xlabel('n')
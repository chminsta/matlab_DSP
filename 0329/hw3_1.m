t=-1:0.01:3;

x1=hw3fun(1,1,0);
x2=hw3fun(2,1,0);
x3=hw3fun(3,1,0);
title('진폭이 다른 경우');
plot(t,x1,'r');
hold on;
plot(t,x2,'g');
plot(t,x3,'b');
hold off;
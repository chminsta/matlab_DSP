t=-1:0.01:3;

x1=hw3fun(1,1,0);
x2=hw3fun(2,1,0);
x3=hw3fun(3,1,0);
subplot(2,2,1);
title('진폭이 다른 경우');
plot(t,x1,'r');
hold on;
plot(t,x2,'g');
plot(t,x3,'b');
hold off;

x4=hw3fun(1,1,0);
x5=hw3fun(1,1,-pi/3);
x6=hw3fun(1,1,pi/3);
subplot(2,2,2);
title('위상이 다른 경우');

plot(t,x4,'r');
hold on;
plot(t,x5,'g');
plot(t,x6,'b');
hold off;

x7=hw3fun(1,1,0);
x8=hw3fun(1,2,0);
x9=hw3fun(1,3,0);
subplot(2,2,3);
title('주파수가 다른 경우');
plot(t,x7,'r');
hold on;
plot(t,x8,'g');
plot(t,x9,'b');
hold off;

x10=hw3fun(1,1,0);
x11=hw3fun(2,1,0);
x12=hw3fun(3,1,0);
subplot(2,2,4);
title('샘플링 주기가 다른 경우');
plot(t,x10,'r');
hold on;
plot(t,x11,'g');
plot(t,x12,'b');
hold off;

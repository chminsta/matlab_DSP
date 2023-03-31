x4=hw3fun(1,1,0);
x5=hw3fun(1,1,-pi/3);
x6=hw3fun(1,1,pi/3);

title('위상이 다른 경우');

plot(t,x4,'r');
hold on;
plot(t,x5,'g');
plot(t,x6,'b');
hold off;
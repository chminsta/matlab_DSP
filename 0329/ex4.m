n=-2:10;
x=[1:7,6:-1:1];

[x11, n11]=sigshift(x, n, 5);
[x12, n12]=sigshift(x, n, -4);
[x1,n1]=sigadd(2*x11, n11, -3*x12, n12);
subplot(2,1,1);
stem(n1,x1);
title('squence in example a')
xlabel('n');
ylabel('x1(n)')

[x21, n21]=sigfold(sigshift(x,n,3),n);
[x22, n22]=sigshift(x,n,2);
[x22, n22]=sigmult(x,n,x22,n22);
[x2,n2]=sigadd(x21,n21,x22,n22); %x2(n)
subplot(2,1,2);
stem(n2,x2);
title('squence in example b')
xlabel('n');
ylabel('x2(n)');




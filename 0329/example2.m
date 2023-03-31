% Example 2
% x(n) = u(n)-u(n-10);
addpath .\M_file
n = -2:10;
x = stepseq(0,-2,10)-stepseq(10,-2,10);
[xe,xo,m] = evenodd(x,n);
subplot(1,1,1)
subplot(2,2,1); stem(n,x); title('Rectangular pulse')
xlabel('n'); ylabel('x(n)'); axis([-10,10,0,1.2])
subplot(2,2,2); stem(m,xe); title('Even Part')
xlabel('n'); ylabel('xe(n)'); axis([-10,10,0,1.2])
subplot(2,2,4); stem(m,xo); title('Odd Part')
xlabel('n'); ylabel('xo(n)'); axis([-10,10,-0.6,0.6])
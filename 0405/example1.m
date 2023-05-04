clear;
clc;
close;
addpath .\M_file
n=0:30; 
x=stepseq(0,0,30)-stepseq(10,0,30);
subplot(3,1,1); stem(n,x);
h=((0.9).^n).*stepseq(10,0,30);
subplot(3,1,2); stem(n,h);
[y, ny]=conv_m(x,n,h,n);
subplot(3,1,3); 
stem(ny,y);
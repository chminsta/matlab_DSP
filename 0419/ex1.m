addpath ./M_file/
x1=[1,2,3]; n1=-1:1; x2=[2,3,4,5]; 
n2=-2:1;
[x3,n3]=conv_m(x1,n1,x2,n2);
plot(n3,x3);
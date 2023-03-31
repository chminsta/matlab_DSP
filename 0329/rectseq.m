function [x,n] = rectseq(N,n1,n2)
n=n1:n2; 
x=rectpuls(n/N);

%x=(-N/2.<=n) & (n.<= N/2);
end
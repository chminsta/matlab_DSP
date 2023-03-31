function [x,n] = sincseq(a,n1,n2)
n=n1:n2; x=sinc(n/a);
end
function [x,t] = hw3fun(a, f, fi)
t=-1:0.01:3;
x=a*cos(2*pi*f*t+fi);
end
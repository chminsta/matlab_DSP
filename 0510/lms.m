% input signal x, desired signal d

% Initialize variables
N = length(x); % length of input signal
w = zeros(Ntap,1); % filter coefficients
y = zeros(N,1); % output signal
e = zeros(N,1); % error signal

% LMS algorithm
for n = Ntap:N
    xvec = x(n:-1:n-Ntap+1); % input vector
    y(n) = w'*xvec; % filter output
    e(n) = d(n) - y(n); % error signal
    w = w + mu*e(n)*xvec; % update filter coefficients
end

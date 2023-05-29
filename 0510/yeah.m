% Define the unknown system (FIR filter)
b = [1, -0.8, 0.4];
a = 1;

% Generate the input signal
N = 1000;
x = randn(N, 1);

% Define the FIR filter model
L = 20;
w = zeros(L, 1);

% Set the step size
mu = 0.01;

% Initialize the error signal
e = zeros(N, 1);

% Implement the LMS algorithm
for n = 1:N
    y = w' * x(n:-1:n-L+1); % Output of the FIR model
    d = filter(b, a, x(n:-1:n-L+1)); % Output of the unknown system
    e(n) = d(1) - y; % Error signal
    w = w + mu * e(n) * x(n:-1:n-L+1)'; % Update the filter coefficients
end

% Plot the convergence of the filter coefficients and the error signal
figure;
subplot(2, 1, 1);
stem(w);
xlabel('Iteration');
ylabel('Filter coefficients');
title('Convergence of the FIR filter');
subplot(2, 1, 2);
plot(e);
xlabel('Iteration');
ylabel('Error signal');
title('Performance of the LMS algorithm');

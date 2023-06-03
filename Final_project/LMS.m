function [h, y] = LMS(x, d, delta, N)
    % LMS Algorithm for Coefficient Adjustment
    % ----------------------------------------
    % [h, y] = LMS(x, d, delta, N)
    % h = estimated FIR filter
    % y = output array y(n)
    % x = input array x(n)
    % d = desired array d(n), length must be the same as x
    % delta = step size
    % N = length of the FIR filter
    %
    M = length(x);
    y = zeros(1, M);
    h = zeros(1, N);
    
    i = 1;
    Q = fix(M / 10);
    
    % Create a figure to plot the moments of h
    figure(1);
    hold on;
    xlabel('Coefficient Index');
    ylabel('Magnitude');
    title('Updated Filter Coefficients of Adopted filter');
    
    for n = N:M
        x1 = x(n:-1:n - N + 1);
        y = h * x1';
        e = d(n) - y;
        h = h + delta * e * x1;
        
        if rem(i, Q) == 0
            plot(h, 'DisplayName', sprintf('%d attempts', i));
        end
        
        i = i + 1;
    end
    
    legend('show');
end

% System Identification using LMS Algorithm
close all; % chang close
clear; % workspace bye bye
clc; % command clear

% Step 1: Define the unknown filter
cutoff_freq = 0.3; % Cutoff frequency (normalized frequency, 0.0 to 1.0)
filter_order = 131; % Filter order (odd number)
filter_type = 'bandpass'; % Filter type, 'lowpass' 'highpass' 'bandpass' 'bandstop'
unknown_filter = unknown(cutoff_freq, filter_order, filter_type); % Call the unknown.m function to get the filter coefficients for a high-pass filter


% Step 2: Generate random input signal and apply it to both filters
N = 1000; % Length of the input signal
x = randn(1, N); % Random input signal

% Apply the unknown filter to the input signal
d = conv(x, unknown_filter); % Desired signal (output of the unknown filter)

% Initialize adaptive filter coefficients
M = length(unknown_filter); % Length of the adaptive filter
h = zeros(1, M); % Initial filter coefficients

% Step 3: Apply the LMS algorithm for system identification
delta = 0.01; % Step size or learning rate
[h_estimated, y_estimated] = LMS(x, d, delta, M); % Call the LMS function

% Step 4: Verification
% Generate a new random noise input signal
x_noise = randn(1, N);

% Apply the adaptive filter to the new input signal
y_adaptive = filter(h_estimated, 1, x_noise);

% Compare the output of the adaptive filter with the output of the unknown filter
%output_unknown = conv(x_noise, unknown_filter);
output_unknown = filter(unknown_filter, 1, x_noise);

% Plot the results
figure(2);
subplot(2, 1, 1);
plot(output_unknown, 'b');
hold on;
plot(y_adaptive, 'r--');
title('Output Comparison: Unknown Filter vs. Adaptive Filter');
legend('Output of Unknown Filter', 'Output of Adaptive Filter');
xlabel('Sample');
ylabel('Amplitude');
subplot(2, 1, 2);
difference = output_unknown - y_adaptive;
plot(difference);
title('Difference');
legend('show');
xlabel('Sample');
ylabel('Amplitude');
ylim([-2, 2]);
figure(3)
plot(unknown_filter, 'b');
hold on;
plot(h_estimated, 'r--');
title('Filter Coefficients: Unknown Filter vs. Adaptive Filter');
legend('Unknown Filter', 'Adaptive Filter');
xlabel('Coefficient Index');
ylabel('Magnitude');

figure(4);
subplot(2, 2, 1);
plot(output_unknown, 'b');
title('Output of Unknown Filter');
xlabel('Sample');
ylabel('Amplitude');
subplot(2, 2, 2);
plot(y_adaptive,'r');
title('Output of Adaptive Filter');
xlabel('Sample');
ylabel('Amplitude');

subplot(2, 2, 3);
plot(unknown_filter, 'b');
title('Filter Coefficients of Unknown Filter');
xlabel('Coefficient Index');
ylabel('Magnitude');

subplot(2, 2, 4);
plot(h_estimated,'r');
title('Filter Coefficients of Adaptive Filter');
xlabel('Coefficient Index');
ylabel('Magnitude');

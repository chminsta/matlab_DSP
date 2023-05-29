% user parameters
pulse_width = 61; % pulse width in samples (same for all)
omega = pi*[0.2 0.4 0.8]; % pulse frequencies
pulse_start = [75 145 5]; % pulse starting times
% make signals
% 만들 신호: x[n], n = 0 ~ 145+61+75-1=280
% x[n] = 펄스 3개의 합
% 각 펄스: 코사인파에 해밍 윈도우를 적용한 것
% 펄스 3개의 주파수 = 0.2pi, 0.4pi, 0.8pi = omega
% 펄스 3개의 시작 지점 = 75, 145, 5 = pulse_start
% 각 펄스의 길이 = 61 = pulse_width
% 즉 x[n] = 펄스 3개의 합
x = zeros(1,max(pulse_start)+pulse_width+75); % signal vector
w = hamming(pulse_width)'; % window function
for n=1:length(omega)
tmp = w.*cos((0:pulse_width-1)*omega(n));
index = pulse_start(n):pulse_start(n)+pulse_width-1;
x(index) = x(index)+tmp;
end
figure(1) % plot
plot(0:length(x)-1,x);
xlabel('n');
ylabel('x[n]');
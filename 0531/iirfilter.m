clear
%% a. causal stable iir lowpass filter
w = pi*[0:0.001:1]; % normalized frequencies
alpha = 0.5; % LPF parameter
blp = (1-alpha)/2*[1 1]; % numerator coefficients
alp = [1 -alpha]; % denominator coefficients
hlp = freqz(blp,alp,w); % compute DTFT
glp = grpdelay(blp,alp,w); % compute group delay
figure(1)
subplot(121)
zplane(blp,alp)
subplot(322)
plot(w/pi,abs(hlp))
ylabel('magnitude response')
grid on
subplot(324)
plot(w/pi,unwrap(angle(hlp))/pi)
ylabel('phase response (\pi\timesrad)')
grid on
subplot(326)
plot(w/pi,glp)
xlabel('normalized freq(\pi\timesrad/sample)')
ylabel('group delay (samples)')
grid on

%% b. group delay equalizer: causal allpass filter
N = 4; % all-pass filter order
F = w(1:501)/pi; % normalized frequencies, w(501)=0.5pi
edges = [0 0.5]; % band-edge frequencies
Gd = max(glp)-glp(1:501); % desired group delays of APF (>0)
[bap,aap] = iirgrpdelay(N,F,edges,Gd); % make all-pass filter
hap = freqz(bap,aap,w); % compute DTFT
gap = grpdelay(bap,aap,w); % compute group delay
figure(2)
subplot(121)
zplane(bap,aap)
subplot(322)
plot(w/pi,abs(hap))
ylabel('magnitude response')
grid on
subplot(324)
plot(w/pi,unwrap(angle(hap))/pi)
ylabel('phase response (\pi\timesrad)')
grid on
subplot(326)
plot(w/pi,gap)
xlabel('normalized freq(\pi\timesrad/sample)')
ylabel('group delay (samples)')
grid on

%% c. equalized result
b = conv(blp,bap); % product of numerators
a = conv(alp,aap); % product of denominators
h = freqz(b,a,w); % compute DTFT
g = grpdelay(b,a,w); % compute group delay
figure(3)
subplot(121)
zplane(b,a)
subplot(322)
plot(w/pi,abs(h))
ylabel('magnitude response')
grid on
subplot(324)
plot(w/pi,unwrap(angle(h))/pi)
ylabel('phase response (\pi\timesrad)')
grid on
subplot(326)
plot(w/pi,g)
xlabel('normalized freq(\pi\timesrad/sample)')
ylabel('group delay (samples)')
grid on
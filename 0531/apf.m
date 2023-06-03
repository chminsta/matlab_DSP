clear 
[be,ae] = ellip(4,1,40,0.2);
f = 0:0.001:0.2;
w = pi*(0:0.001:1);
he = freqz(be,ae,w);
g = grpdelay(be,ae,f,2); % Equalize only the passband.
a = max(g)-g;
[num,den]=iirgrpdelay(8, f, [0 0.2], a);
ge = grpdelay(be,ae,w);
bfinal = conv(be, num);
afinal = conv(ae, den);
hfinal = freqz(bfinal,afinal,w);
gfinal = grpdelay(bfinal,afinal,w);

subplot(321)
plot(w/pi,abs(he))
ylabel('magnitude response')
grid on
title('APF 달기전')
subplot(323)
plot(w/pi,unwrap(angle(he))/pi)
ylabel('phase response (\pi\timesrad)')
grid on

subplot(325)
plot(w/pi,ge)
xlabel('normalized freq(\pi\timesrad/sample)')
ylabel('group delay (samples)')
grid on

subplot(322)
plot(w/pi,abs(hfinal))
ylabel('magnitude response')
title('APF 단후')
grid on
subplot(324)
plot(w/pi,unwrap(angle(hfinal))/pi)
ylabel('phase response (\pi\timesrad)')
grid on
subplot(326)
plot(w/pi,gfinal)
xlabel('normalized freq(\pi\timesrad/sample)')
ylabel('group delay (samples)')
grid on
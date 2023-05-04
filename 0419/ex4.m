b=1;
a=poly([0.9, 0.9, -0.9]);
figure(1)
zplane(b,a)
figure(2)
[H,w]=freqz(b,a);
magH=abs(H);
angH=angle(H);
subplot(2,1,1); plot(w/pi, magH); grid
xlabel('frequency in PI unit'); ylabel('Maginitude');
title('Magnitude Response')
subplot(2,1,2); plot(w/pi, angH); grid
xlabel('frequency in PI unit'); ylabel('Phase in PI units');
title('Phase Response')
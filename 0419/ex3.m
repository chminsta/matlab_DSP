b=[0,1];
a=[3,-4,1];

[H,w]=freqz(b,a,100);
magH=abs(H);
angH=angle(H);
subplot(2,1,1); plot(w/pi, magH); grid
xlabel('frequency in PI unit'); 
ylabel('Maginitude');
title('Magnitude Response')
subplot(2,1,2); plot(w/pi, angH); grid
xlabel('frequency in PI unit'); 
ylabel('Phase in PI units');
title('Phase Response')
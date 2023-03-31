function sample_signal_1(ti,tf,dt,fs,A,f0,rs,cs,r)
                                     	% 샘플링 주기에 따른 이산 정현파를 생성해서 그림
 
t=ti:dt:tf;                           	% t를 ti부터 tf까지 dt 간격으로 증가시킴
xc=A*cos(2*pi*f0*t);             	% 연속 정현파 생성
n=ti:1/fs:tf;                         	% t를 Ts 간격으로 샘플링하여 n을 생성
xd=A*cos(2*pi*f0*n);            	% 이산 정현파 생성
subplot(rs,cs,r);                    	% rs행 cs열 분할 그림 창의 r번 창
plot(t,xc,':r');                        	% 연속 정현파 포락선을 그림
axis([ti tf -(1.2*A) 1.2*A]);      	% x축(ti∼tf)과 y축(-1.2A∼1.2A)의 그림 영역을 설정
hold on;                              	% 같은 그림 창에 계속 그림
stem(n,xd);                          	% 샘플링 주기가 Ts인 이산 정현파 그림

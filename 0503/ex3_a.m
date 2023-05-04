r1=0.98; theta=pi/4; % 시스템 극 파라미터 설정
b1=[0 0 1]; % 전달 함수의 분자 계수
a1=[1 -2*r1*cos(theta) r1^2]; % 전달 함수의 분모 계수
[H1,w1]=freqz(b1,a1,1000); % 주파수 응답 계산
[h1,t1]=impz(b1,a1,300); % 임펄스 응답 계산
r2=0.5; % 시스템 극 파라미터 설정
b2=[0 0 1]; % 전달 함수의 분자 계수
a2=[1 -2*r2*cos(theta) r2^2]; % 전달 함수의 분모 계수
[H2,w2]=freqz(b2,a2,1000); % 주파수 응답 계산
[h2,t2]=impz(b2,a2,300); % 임펄스 응답 계산
figure(1)
subplot(2,4,1);
zplane(b1,a1);
title('극점, 영점 그림')
subplot(2,4,2); 
plot(w1/pi,abs(H1)); % 진폭 응답 그림
xline(theta/pi, '--'); % x축에 수직인 점선
title('진폭 응답'); % 그림 제목
xlabel('\omega/\pi'); grid on; % x축 라벨 및 그리드 표시
subplot(2,4,3)
plot(w1/pi,unwrap(angle(H1))/pi); % 위상 응답 그림
xline(theta/pi, '--'); % x축에 수직인 점선
title('위상 응답'); % 그림 제목
xlabel('\omega/\pi'); ylabel('rad/\pi'); grid on; % x, y축 라벨 및 그리드 표시
subplot(2,4,4); 
plot(t1,h1); % 임펄스 응답 그림
title('임펄스 응답'); % 그림 제목
xlabel('n'); grid on; % x축 라벨 및 그리드 표시

subplot(2,4,5)
zplane(b2,a2);
title('극점, 영점 그림')
subplot(2,4,6); 
plot(w2/pi,abs(H2)); % 진폭 응답 그림
xline(theta/pi, '--'); % x축에 수직인 점선
title('진폭 응답'); % 그림 제목
xlabel('\omega/\pi'); grid on; % x축 라벨 및 그리드 표시
subplot(2,4,7)
plot(w2/pi,unwrap(angle(H2))/pi); % 위상 응답 그림
xline(theta/pi, '--'); % x축에 수직인 점선
title('위상 응답'); % 그림 제목
xlabel('\omega/\pi'); ylabel('rad/\pi'); grid on; % x, y축 라벨 및 그리드 표시
subplot(2,4,8); 
plot(t2,h2); % 임펄스 응답 그림
title('임펄스 응답'); % 그림 제목
xlabel('n'); grid on; % x축 라벨 및 그리드 표시
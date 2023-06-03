close all; % 모든 생성된 창을 닫음
clear; % 열려있는 작업영역(workspace)을 모두비움
clc; % 명령(command) 창을 비움
Ts=1; fs=1/Ts; % 샘플링 주기와 샘플링 주파수
Ap=1; % 통과 대역 감쇠
As=20; % 저지 대역 감쇠
wp_d=0.2*pi; % 디지털 통과 대역 경계 주파수
ws_d=0.3*pi; % 디지털 저지 대역 경계 주파수

% 아날로그 체비셰프 II형 필터 + 임펄스 불변 변환
wp_a=wp_d*fs; % 아날로그 통과대역 경계주파수
ws_a=ws_d*fs; % 아날로그 저지대역 경계주파수
[N,wc]=cheb2ord(wp_a,ws_a,Ap,As,'s'); % 필터 차수 및 차단 주파수 계산
[num_a,den_a]=cheby2(N,Ap,wc,'s'); % 아날로그 필터 전달 함수 H(s) 계산
[num_d,den_d]=impinvar(num_a,den_a); % 디지털 필터 전달 함수 H(z) 계산
[Hz,w]=freqz(num_d,den_d); % 필터 주파수 응답 계산

% 아날로그 체비셰프 II형 필터 + 쌍선형 변환
wp=(2/Ts)*tan(wp_d/2); % 통과 대역 경계 주파수 미리 휨
ws=(2/Ts)*tan(ws_d/2); % 저지 대역 경계 주파수 미리 휨
[N2,wc2]=cheb2ord(wp,ws,Ap,As,'s'); % 필터 차수 및 차단 주파수 계산
[num_a2,den_a2]=cheby2(N2,Ap,wc2,'s'); % 아날로그 필터 전달 함수 H(s) 계산
[num_d2,den_d2]=bilinear(num_a2, den_a2,fs); % 디지털 필터 전달 함수 H(z) 계산
Hz2=freqz(num_d2,den_d2); % 필터 주파수 응답 계산

figure(1)
subplot(2,2,1); % 2행 2열 분할 그림 창의 1번 창
plot(w/(2*pi),abs(Hz)); axis([0 0.5 0 1]); % 크기 응답(임펄스 불변)을 그림
title('\bf{필터 크기 응답(임펄스 불변)}'); % 그림 제목
xlabel('\bf{F}'); grid on; % x축 라벨 및 그리드 표시
subplot(2,2,3); % 2행 2열 분할 그림 창의 3번 창
plot(w/(2*pi),angle(Hz)); axis([0 0.5 -4 4]); % 위상 응답(임펄스 불변)을 그림
title('\bf{필터 위상 응답(임펄스 불변)}'); % 그림 제목
xlabel('\bf{F}'); grid on; % x축 라벨 및 그리드 표시
subplot(2,2,2); % 2행 2열 분할 그림 창의 2번 창
plot(w/(2*pi),abs(Hz2)); axis([0 0.5 0 1]); % 크기 응답(쌍선형)을 그림
title('\bf{필터 크기 응답(쌍선형)}'); % 그림 제목
xlabel('\bf{F}'); grid on; % x축 라벨 및 그리드 표시
subplot(2,2,4); % 2행 2열 분할 그림 창의 4번 창
plot(w/(2*pi),angle(Hz2)); axis([0 0.5 -4 4]); % 위상 응답(쌍선형)을 그림
title('\bf{필터 위상 응답(쌍선형)}'); % 그림 제목
xlabel('\bf{F}'); grid on; % x축 라벨 및 그리드 표시

Ts=1; fs=1/Ts; % 샘플링 주기와 샘플링 주파수
Ap=1; % 통과 대역 감쇠
As=20; % 저지 대역 감쇠
wp_d=0.2*pi; % 디지털 통과 대역 경계 주파수
ws_d=0.3*pi; % 디지털 저지 대역 경계 주파수

% 아날로그 타원형 필터 + 임펄스 불변 변환
wp_a=wp_d*fs; % 아날로그 통과대역 경계주파수
ws_a=ws_d*fs; % 아날로그 저지대역 경계주파수
[N,wc]= ellipord(wp_a, ws_a, Ap, As, 's'); % 필터 차수 및 차단 주파수 계산
[num_a,den_a]= ellip(N, Ap, As, wc, 's'); % 아날로그 필터 전달 함수 H(s) 계산
[num_d,den_d]=impinvar(num_a,den_a); % 디지털 필터 전달 함수 H(z) 계산
[Hz,w]=freqz(num_d,den_d); % 필터 주파수 응답 계산

% 아날로그 타원형 필터 + 쌍선형 변환
wp=(2/Ts)*tan(wp_d/2); % 통과 대역 경계 주파수 미리 휨
ws=(2/Ts)*tan(ws_d/2); % 저지 대역 경계 주파수 미리 휨
[N2,wc2]=ellipord(wp, ws, Ap, As, 's'); % 필터 차수 및 차단 주파수 계산
[num_a2,den_a2]= ellip(N, Ap, As, wc, 's'); % 아날로그 필터 전달 함수 H(s) 계산
[num_d2,den_d2]=bilinear(num_a2, den_a2,fs); % 디지털 필터 전달 함수 H(z) 계산
Hz2=freqz(num_d2,den_d2); % 필터 주파수 응답 계산
figure(2)
subplot(2,2,1); % 2행 2열 분할 그림 창의 1번 창
plot(w/(2*pi),abs(Hz)); axis([0 0.5 0 1]); % 크기 응답(임펄스 불변)을 그림
title('\bf{필터 크기 응답(임펄스 불변)}'); % 그림 제목
xlabel('\bf{F}'); grid on; % x축 라벨 및 그리드 표시
subplot(2,2,3); % 2행 2열 분할 그림 창의 3번 창
plot(w/(2*pi),angle(Hz)); axis([0 0.5 -4 4]); % 위상 응답(임펄스 불변)을 그림
title('\bf{필터 위상 응답(임펄스 불변)}'); % 그림 제목
xlabel('\bf{F}'); grid on; % x축 라벨 및 그리드 표시
subplot(2,2,2); % 2행 2열 분할 그림 창의 2번 창
plot(w/(2*pi),abs(Hz2)); axis([0 0.5 0 1]); % 크기 응답(쌍선형)을 그림
title('\bf{필터 크기 응답(쌍선형)}'); % 그림 제목
xlabel('\bf{F}'); grid on; % x축 라벨 및 그리드 표시
subplot(2,2,4); % 2행 2열 분할 그림 창의 4번 창
plot(w/(2*pi),angle(Hz2)); axis([0 0.5 -4 4]); % 위상 응답(쌍선형)을 그림
title('\bf{필터 위상 응답(쌍선형)}'); % 그림 제목
xlabel('\bf{F}'); grid on; % x축 라벨 및 그리드 표시


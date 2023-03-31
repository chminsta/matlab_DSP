close all; % 모든 생성된 창을 닫음
clear; % 열려있는 작업영역(workspace)을 모두 비움
clc; % 명령(command) 창을 비움
n=-10:10; % 시간축 설정(n은 -10에서 10까지 1씩 증가)
%addpath ./M_file/

% 1번
n1=-10;
n2=10;
n0=0;
xa=impseq(n0,n1,n2); % n=0일 때 1, 즉 임펄스
subplot(2,2,1); % 3행 2열 분할 그림 창의 1번 창
stem(n,xa); % 이산 신호 출력(n은 x축, xa는 y축)
axis([-10 10 -0.5 1.5]); 
grid on; % x축과 y축 영역 설정, 그리드 표시
title('Unit sample sequence \delta[n]'); % 그림 제목(‘\xx’는 정해진 기호 표시)
xlabel('n' ); % x축 라벨

% 2번
xb=stepseq(0,-10,10); % 계단 신호
subplot(2,2,2); % 3행 2열 분할 그림 창의 2번 창
stem(n,xb); % 이산 신호 출력
axis([-10 10 -0.5 1.5]); grid on; % x축과 y축 영역 설정, 그리드 표시
title('Unit step sequence u[n]'); % 그림 제목
xlabel('n' ); % x축 라벨
% 3번
xc=rectseq(8,-10,10); % 사각 펄스
subplot(2,2,3); % 3행 2열 분할 그림 창의 3번 창
stem(n,xc); % 이산 신호 출력
axis([-10 10 -0.5 1.5]); grid on; % x축과 y축 영역 설정, 그리드 표시
title('Rectangle sequence rect[n/8]'); % 그림 제목
xlabel('n' ); % x축 라벨

%4번
xe=sincseq(3,-10,10); % 싱크 함수
subplot(2,2,4); % 3행 2열 분할 그림 창의 5번 창
stem(n,xe); % 이산 신호 출력
axis([-10 10 -0.5 1.5]); grid on; % x축과 y축 영역 설정, 그리드 표시
title('Sinc function sinc(n/3)'); % 그림 제목
xlabel('n' ); % x축 라벨
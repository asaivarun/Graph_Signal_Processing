%% EED364 : Grpah Signal Processing |[Lab-9]|                                       
% * Author: _Alapati Sai Varun_(1410110037)_ as217@snu.edu.in
% * Lab Instructor: _Prof.Vijay Kumar Chakka_   
%% Objective: 
% Eigen spectrum with respect to Adjacency matrix of a Graph
%% Program: 
clc;
clear all;
close all;
%% 1
ECG=load('inputData for lab9.mat');
x=ECG.inputData;
w = 0.1*randn(5000,1)+0; % mean = 0 and variance =0.01 and srqt(0.01)=0.1
y=w+x;
%% 2
figure;
subplot(2,1,1);
plot(x);
title('	Plotting the original signal x(n) ');


subplot(2,1,2);
denoise(y);
title('	Plotting the denoised signal x(n) with mean = 0 and variance =0.01');

w1 = sqrt(0.001)*randn(5000,1)+0; % mean = 0 and variance =0.01 
y1=w1+x;

figure;
subplot(2,1,1);
denoise(y1);
title('	Plotting the denoised signal x(n) with mean = 0 and variance =0.0001');


w2 = 1*randn(5000,1)+0; % mean = 0 and variance =0.01 and srqt(0.01)=0.1
y2=w2+x;

subplot(2,1,2);
denoise(y2);
title('	Plotting the denoised signal x(n) with mean = 0 and variance =1');

sprintf('The Graph filter with variance= 0.0001 denoised the signal accurately compared to the the signal with variance 0.001 and variance =1 so less the variance accurate the signal')
%{
function[] = denoise(y)
A=zeros(10);
for i=1:10
    for j=1:10
        if((i==1||j==1)&&~(i==1&&j==1)&&(y(i,1)-y(j,1))<=0)
         A(i,j)=exp(-((y(i,1)-y(j,1))^2)/0.02);
        end
    end
end
D =diag(sum(ceil(A),2));
L=D-A;
[E, U]=eig(L);
e=diag(E);
X=zeros(5000,1);
for k=1:10:5000
    Y(k:k+9,1)=U'*y(k:k+9,1);
for i=0:9
    for j=0:9
        X(k+i,1)=X(k+i,1)+((1/(1+(10*e(1+i,1))))*(Y(k+j,1)*U(j+1,i+1)));
    end
end
end
plot(X);
end
%}

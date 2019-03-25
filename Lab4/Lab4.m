%% EED364 : Grpah Signal Processing |[Lab-4]|                                       
% * Author: _Alapati Sai Varun_(1410110037)_ as217@snu.edu.in
% * Lab Instructor: _Prof.Vijay Kumar Chakka_   
%% Objective: 
% Eigen spectrum with respect to Adjacency matrix of a Graph
%% Program: 
clc;
clear all;
close all;
%%
[Bu, XY ]= bucky;
L=laplacian(Bu);
%{
function [L] = laplacian(A)
m= size(A,1);
D =diag(sum(ceil(A),2));
L=D-ceil(A);
end
%}

[U, D]=eig(full(L));
load('inputSignal.mat');
x=inputSignal;
X=U'*x;
load('inputSignal1.mat');
x1=inputSignal1;
X1=U'*x1;
h1=[0.5;0.5];
h1=[h1; zeros(size(U,2)-size(h1,1),1)];
H=U'*h1;
h2=[0.5;-0.5];
h2=[h2; zeros(size(U,2)-size(h2,1),1)];
H2=U'*h2;
h3=0.5*ones(size(U,2),1);
H3=U'*h3;
for i=1:2:size(U,1)
    h4(i,1)=0.5;
    h4(i+1,1)=-0.5;
end
H4=U'*h4;
h5=[0;1];
h5=[h5; zeros(size(U,2)-size(h5,1),1)];
H5=U'*h5;

%{
function[y]=conv(X,H,U)
 Y=X.*H;
 y=U*Y;
 figure;
 stem(y);
end
%}
y1=conv(X,H,U);
y2=conv(X,H2,U);
y3=conv(X,H3,U);
y4=conv(X,H4,U);
y5=conv(X,H5,U);
y11=conv(X1,H,U);
y22=conv(X1,H2,U);
y33=conv(X1,H3,U);
y43=conv(X1,H4,U);
y55=conv(X1,H5,U);
%% Plot the highest variation signals( defined in 1) on the bucky ball graph
E=sortrows([diag(D) U']); 
Us=E(:,2:size(E,1)+1)';
S=Us(:,size(E,1));
my3dgplot(Bu,S,XY);
%{
function [] = my3dgplot(A,B,X)
[m n]=size(A);
    for i=1:m
        text(B(i,1),B(i,2),B(i,3),'*');
        for j=i:m
            if(A(i,j)==1)
                 hold on;
                 line([B(i,1),B(j,1)],[B(i,2),B(j,2)],[B(i,3),B(j,3)]);
            end
        end
       l= line([B(i,1),B(i,1)],[B(i,2),B(i,2)],[B(i,3),(B(i,3)+X(i,1))]);
       set(l,'color','red');
    end
end
%}

%% Plot the zero variation signals ( defined on 1) on same graph.
my3dgplot(Bu,Us(:,1),XY);
%% Define Low pass filter in GFT domain ( passing only smallest three variations)
H1=[1;1;1];
H1=[H1; zeros(size(x,1)-size(H1,1),1)];
figure;
O11=X.*H1;
subplot(2,2,1);
plot(H1);
subplot(2,2,2);
plot(O11);
O21=X1.*H1;
subplot(2,2,3);
plot(H1);
subplot(2,2,4);
plot(O21);

%% define High pass filter in GFT domain ( passing only 5 high variations)

H2=zeros(size(x,1)-5,1);
H2=[H2;ones(5,1)];
O12=X.*H2;
figure;
subplot(2,2,1);
plot(H2);
subplot(2,2,2);
plot(O12);
O22=X1.*H2;
subplot(2,2,3);
plot(H2);
subplot(2,2,4);
plot(O22);
%% define Bandpass filter, which maximizing middle variation by 10
H3=zeros(size(x,1),1);
H3(size(x,1)/2,1)=10;
H3((size(x,1)/2)+1,1)=10;
O13=X.*H3;
figure;
subplot(2,2,1);
plot(H3);
subplot(2,2,2);
plot(O13);
O23=X1.*H3;
subplot(2,2,3);
plot(H3);
subplot(2,2,4);
plot(O23);
%% Define Bandstop filter which minimizes highest variation by 40 dB
H4=zeros(size(x,1),1);
H4(size(x,1),1)=0.01;
O14=X.*H4;
figure;
subplot(2,2,1);
plot(H4);
subplot(2,2,2);
plot(O14);
O24=X1.*H4;
subplot(2,2,3);
plot(H4);
subplot(2,2,4);
plot(O24);
%% plot the outputs of ( 4,5,6) on Bucky ball graph
my3dgplot(Bu,O12,XY);
my3dgplot(Bu,O22,XY);
my3dgplot(Bu,O13,XY);
my3dgplot(Bu,O23,XY);
my3dgplot(Bu,O14,XY);
my3dgplot(Bu,O24,XY);

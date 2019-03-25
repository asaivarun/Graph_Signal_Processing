%% EED364 : Grpah Signal Processing |[Lab-7]|                                       
% * Author: _Alapati Sai Varun_(1410110037)_ as217@snu.edu.in
% * Lab Instructor: _Prof.Vijay Kumar Chakka_   
%% Objective: 
% Eigen spectrum with respect to Adjacency matrix of a Graph
%% Program: 
clc;
clear all;
close all;
%% 1
load('Lab3_minnesota.mat','Problem');
zerosap=zeros(1,length(Problem.aux.coord))';
Minco=[Problem.aux.coord zerosap];
[U D ]= eig(full(Problem.A));
I=diag(U);
j(:,1)=1:length(I);
R=zeros(length(I),7);
for L=1:7
    R(j,L)=exp(-I(j,1)*L);
end
x1=zeros(length(I),1);
x1(100,1)=1;
x2(j,1)=1;
for i=1:7
    title(sprintf('e^{-%dL}x_1',i));
    y1(:,i)=conv(x1,R(:,i),U);
    title(sprintf('e^{-%dL}x_2',i));
    y2(:,i)=conv(x2,R(:,i),U);
end
%% 2
figure;
mesh(y1);
xlabel('T');
ylabel('n');
title('Mesh Plot R_Tx_1');
figure;
imagesc(y1);
xlabel('T');
ylabel('n');
title('Image Plot R_Tx_1');
figure;
mesh(y2);
xlabel('T');
ylabel('n');
title('Mesh Plot R_Tx_2');
figure;
imagesc(y2);
xlabel('T');
ylabel('n');
title('Image Plot R_Tx_2');



%% EED364 : Grpah Signal Processing |[Lab-1]|                                       
% * Author: _Alapati Sai Varun_(1410110037)_ as217@snu.edu.in
% * Lab Instructor: _Prof.Vijay Kumar Chakka_   
%% Objective: 
% Eigen spectrum with respect to Adjacency matrix of a Graph
%% Program: 
clc;
clear all;
close all;
%% MATLAB function to plot (2D) the graph for the given adjacency matrix A
A=[0,1,1,0;1,0,0,1;1,0,0,1;0,1,1,0];
B=[1,5;5,5;1,3;5,3];
figure(1);
subplot(3,4,1);
my2dgplot(A,B);
% Verification
[m,n]=size(A);
for i=1:m
    text(B(i,1),B(i,2),'*');
end
hold on;
subplot(3,4,2);
gplot(A,B);
%% 3d Plot
C=[1,5,6;5,5,4;1,3,3;5,3,7];
subplot(3,4,3);
my3dgplot(A,C);
%% Bucky ball example:
[Bu,XY]= bucky;
subplot(3,4,5);
my2dgplot(Bu,XY);
subplot(3,4,6);
my3dgplot(Bu,XY);
%% 4 adjacency matrix of size N nodes. And plotting the graph 
R=round(triu(rand(randi(100))));
R=R+triu(R, 1)';
[m n]=size(R);
B=randi(10,m,2);
C=randi(10,m,3);
subplot(3,4,7);
my2dgplot(R,B);
subplot(3,4,8);
my3dgplot(R,C);
%% Calculating the Eigen spectrum of all plotted graphs?
subplot(3,4,9);
eigspectrum(A);
subplot(3,4,10);
eigspectrum(Bu);
subplot(3,4,11);
eigspectrum(R);

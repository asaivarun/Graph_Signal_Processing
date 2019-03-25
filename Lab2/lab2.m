%% EED364 : Grpah Signal Processing |[Lab-2]|                                       
% * Author: _Alapati Sai Varun_(1410110037)_ as217@snu.edu.in
% * Lab Instructor: _Prof.Vijay Kumar Chakka_   
%% Objective: 
% Eigen spectrum with respect to Adjacency matrix of a Graph
%% Program: 
clc;
clear all;
close all;

%% MATLAB function to plot (2D) the graph for the given adjacency matrix A
A=[0,1,0,1,0;1,0,1,0,0;0,1,0,1,0;1,0,1,0,1;0,0,0,1,0];
B=[1,5;5,5;1,3;5,3;3,7];
X=[1;-1;-1;1;1];
figure(1);
subplot(1,3,1);
my2dgplot(A,B);
C=[1,5,0;5,5,0;1,3,0;5,3,0;3,7,0];
subplot(1,3,2);
my3dgplot(A,C,X);
%% Generalize the above code and define an arbitrary signal (generate a random sequence of particular range) on the graph plotted in Bucky ball example.
[Bu,XY]= bucky;
[m n]=size(Bu);
Xr=randi([-2 2],m,1)+rand(m,1);
subplot(1,3,3);
my3dgplot(Bu,XY,Xr);
%% Computing GFT of a graph signal x, defined on a graph G and Verifying
[Xg V,x]=gft(A,X);
Bu=full(Bu);
[U1 D1 ]=eig(Bu);
X1=(3*U1(:,1))+(10*U1(:,15))+(2*U1(:,32));
[Xg1 V1,x1]=gft(Bu,X1);
X2=5*U1(:,60);
[Xg2 V2,x2]=gft(Bu,X2);
X3=2*U1(:,1);
[Xg3 V3,x3]=gft(Bu,X3);
Xr=randi([-2 2],m,1)+rand(m,1);
[Xg4 V4,xr]=gft(Bu,Xr);
% All of the above verified the property of eigenvector matrix (U)which is orthognal
%% Calculate the sparsity order for GFT coefficient vectors of the above signals

s=length(nonzeros(Xg));
s1=length(nonzeros(Xg1));
s2=length(nonzeros(Xg2));
s3=length(nonzeros(Xg3));
s4=length(nonzeros(Xg4));
% The Sparsity order of GFT cofficient vectors ofx=5,x1=60,x2=59,s3=60,s4=60



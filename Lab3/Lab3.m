%% EED364 : Grpah Signal Processing |[Lab-3]|                                       
% * Author: _Alapati Sai Varun_(1410110037)_ as217@snu.edu.in
% * Lab Instructor: _Prof.Vijay Kumar Chakka_   
%% Objective: 
% Ploting path and ring graphs, finding laplacian and zero crossings
%% Program: 
clc;
clear all;
close all;
%% node 5 path and ring graphs
E=[1,0.8,0.6,0.4];
Er=[1,0.8,0.6,0.8,1];
Aw=[0,1,0,0,0;1,0,0.8,0,0;0,0.8,0,0.6,0;0,0,0.6,0,0.4;0,0,0,0.4,0];
Arw=[0,1,0,0,1;1,0,0.8,0,0;0,0.8,0,0.6,0;0,0,0.6,0,0.8;1,0,0,0.8,0];

my2dwgplot(Aw,E)
%{
function [] = my2dwgplot(A,E,B)
narginchk(1,3);
if nargin<3
    B = rand(length(A),2);
end
figure;
plot(B(:,1),B(:,2),'*');
hold on;
for i = 1:size(A,1)
    for j = i+1:size(A,2)
        if A(i,j)>0
            line([B(i,1),B(j,1)],[B(i,2),B(j,2)]);
            text((B(i,1)+B(j,1))/2,((B(i,2)+B(j,2))/2),cellstr(num2str(E(1,i))));
        end
    end
end
end
%}
my2dwgplot(Arw,Er);
%% x`ComputeD all possible Laplacian matrices for the above graphs  and plot with index of the eigenvalues (ordered eigenvalues) on the x-axis and number of zero crossings of the corresponding eigenvector on the y-axis.
[L Lw Ln]=laplacian(Aw);
%{
function [L Lw Ln] = laplacian(A)
m= size(A,1);
D =diag(sum(ceil(A),2));
L=D-ceil(A);
Lw=D-A;
Ln = D^-0.5*L*D^-0.5;
end
%}
[Lr Lrw Lrn]=laplacian(Arw);

zeroco(L,Aw);
%{
function[]=zeroco(L,A)
[U D] = eig(L);
m= size(U,1);
Z=zeros(m,1);
for k=1:m
    for i=1:m
        for j=i:m
            if(A(i,j)>0 && (U(i,k)*U(j,k)<0))
                 Z(k,1)=Z(k,1)+1;
            end
        end
    end
    
end
%E=sortrows([diag(D) Z]); 
%D=E(:,1);
%Z=E(:,2);
figure;
stem(1:size(Z,1),sort(Z));
end

%}

zeroco(Lw,Aw);
zeroco(Ln,Aw);
zeroco(Lr,Arw);
zeroco(Lrw,Arw);
zeroco(Lrn,Arw);
    

%% question 2 for the given weighted adjacency matrix Data
load('lab3_Data.mat');
[Ld Ldw Ldn]=laplacian(Data);
zeroco(Ld,Data);
zeroco(Ldw,Data);
zeroco(Ldn,Data);

%% Plot the Minnesota city graph using the data ( Minnesota.mat). Now plot aGraph signal ‘x’ ( inputSignal.mat) on that graph. Calculate GFT coefficients of the signal.
load('Lab3_minnesota.mat', 'Problem');
my2dgplot(Problem.A,Problem.aux.coord);
%{
function [] = my2dgplot(A,B)
narginchk(1,2);
if nargin<2
    B = rand(length(A),2);
end
figure;
plot(B(:,1),B(:,2),'*');
hold on;
for i = 1:size(A,1)
    for j = i+1:size(A,2)
        if A(i,j)>0
            line([B(i,1),B(j,1)],[B(i,2),B(j,2)]);
        end
    end
end
end
%}
load('Lab3_inputSignal.mat');
hold on;
for i = 1:size(Problem.A,1)
 line([Problem.aux.coord(i,1),Problem.aux.coord(i,1)],[Problem.aux.coord(i,2),Problem.aux.coord(i,2)],[0,inputSignal(i,1)]);
end
hold off;
[U D]=eig(full(Problem.A));
Xg=U'*inputSignal;

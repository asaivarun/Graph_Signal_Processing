%% EED364 : Grpah Signal Processing |[Lab-8]|                                       
% * Author: _Alapati Sai Varun_(1410110037)_ as217@snu.edu.in
% * Lab Instructor: _Prof.Vijay Kumar Chakka_   
%% Objective: 
% Eigen spectrum with respect to Adjacency matrix of a Graph
%% Program: 
clc;
clear all;
close all;
%% 1-a
[Bu,xy]= bucky;
Ab=full(Bu);
[m n]=size(Bu);
Xr=randi([-2 2],m,1)+rand(m,1);
%subplot(1,3,3);
%my3dgplot(Bu,XY,Xr);
sr=((1/sum(Xr.*Xr))*(Xr'*laplacian(Ab)*Xr))^0.5;
gr=gs(Ab,xy,Xr');
pr=sr*gr;
sprintf('The product ofgraph spread and spectral spread for the  signal X  defined on Bucky ball graph is %d',pr);


%% 1-b
n=1:60;
Xn=exp(-2*n);
Xn=Xn';
sn=((1/sum(Xn.*Xn))*(Xn'*laplacian(Ab)*Xn))^0.5;
gn=gs(Ab,xy,Xn');
pn=sn*gn;
sprintf('The product ofgraph spread and spectral spread for the  signal X=e^-2*n  defined on Bucky ball graph is %d',pn);

%% 2-a
A= zeros(60);
N= length(A);
for i=2:N-1
    for j=1:N
      if(i==j )
        A(i,j-1)=1;
        A(i,j+1)=1;
      end
    end
end
A(1,2)=1;
A(N,N-1)=1;

XY=zeros(N,2);
XY(:,2)=1;

for i=1:N
    XY(i,1)=i+1;
end

sr1=((1/sum(Xr.*Xr))*(Xr'*laplacian(A)*Xr))^0.5;
gr1=gs(A,XY,Xr');
pr1=sr1*gr1;
sprintf('The product of graph spread and spectral spread for the  signal X  defined on Path graph is %d',pr1);

%% 2-b
sn1=((1/sum(Xn.*Xn))*(Xn'*laplacian(A)*Xn))^0.5;
gn1=gs(A,XY,Xn');
pn1=sn1*gn1;
sprintf('The product of graph spread and spectral spread for the  signal X=e^-2*n  defined on path graph is %d',pn1);

%% 3
load('Lab3_minnesota.mat','Problem');
zerosap=zeros(1,length(Problem.aux.coord))';
Minco=[Problem.aux.coord zerosap];
Am=full(Problem.A);
C1=ones(1,10);
C2=zeros(1,25);
C2=0.8.^-(1:25);
L=laplacian(Am);
H1=C1(1,1)*eye(length(L));
H2=C1(1,1)*eye(length(L));
for i=2:length(C1)
  H1=H1+C1(1,i)*L^(i-1);
end
figure;
title('frequency response of filter with L=10 ,c1=1 forall l');
plot(H1);
for i=2:length(C2)
  H2=H2+C2(1,i)*L^(i-1);
end
figure;
title('frequency response of filter with L=25 ,c1=0.8^-1 forall l');
plot(H2);

%{
function[s]=gs(A,XY,X)
[a b] = dijkstra(A,XY);
c=cellfun(@length,b)-1;
for i=1:length(c)
    d(i,1)= sum(a(i,:).^2.*X);
end 
s=min(d)/sum(X.*X);
end

function [L ] = laplacian(A)
m= size(A,1);
D =diag(sum(ceil(A),2));
L=D-ceil(A);
%Lw=D-A;
%Ln = D^-0.5*L*D^-0.5;
end
%}




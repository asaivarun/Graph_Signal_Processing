%% EED364 : Grpah Signal Processing |[Lab-6]|                                       
% * Author: _Alapati Sai Varun_(1410110037)_ as217@snu.edu.in
% * Lab Instructor: _Prof.Vijay Kumar Chakka_   
%% Objective: 
% Vertex- Frequency Plot
%% Program: 
clc;
clear all;
close all;
%% path graph
A=zeros(180);
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

 D=diag(sum(A,2));
L=D-A;
[U,E]=eig(L);
XY=zeros(N,2);
XY(:,2)=1;

for i=1:N
    XY(i,1)=i+1;
end
sig=[U(1:60,11);U(61:120,61);U(121:180,31)];
figure(1)
sigplot(A,XY,sig);
title('Path Graph');
%% window
i=1:N;
W(i,1)=exp(-300*E(i,1)); 
C=(W'*W)^-0.5;
W=C*W;
w=U*W;
%%  spectrogram 
for i=1:N
    for j=1:N
        m=(Trans(sig,i,U).*U(:,j)).*sig; 
        x=m'*m;
        Wspec(i,j)=x;
    end 
end
% plotting 
figure(2);
imagesc(Wspec);
xlabel('n');
ylabel('Wi,k(n)');
title('Spectrogram of graph  ');
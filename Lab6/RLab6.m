%% EED364 : Grpah Signal Processing |[Lab-6]|                                       
% * Author: RAKESH MUNDLAMURI
% * Roll no:1410110326
% * Email id:rm845@snu.edu.in
% * Lab no : 6
% * Lab batch: 4-6
% * Lab Instructor: _Prof.Vijay Kumar Chakka_   
%% vertex frequency representation
clc;
close all;
clear all;
A=zeros(180);
for i=2:length(A)-1
    for j=1:length(A)
      if(i==j )
        A(i,j-1)=1;
        A(i,j+1)=1;
      end
    end
end
A(1,2)=1;
A(length(A),length(A)-1)=1;
degree=sum(A,2);
degree=diag(degree);
L=degree-A;
[U,E]=eigen(L);
XY=zeros(length(A),2);
XY(:,2)=1;
for i=1:length(A)
    XY(i,1)=i+1;
end
sig=[U(1:60,11);U(1:60,61);U(1:60,31)];
figure(1)
Gsignalplot(A,XY,sig');
%% window
for i=1:length(A)
    W(i,1)=exp(-300*E(i,1)); %generating coefficents with function of eigen values
end
en=W'*W; 
C=en^-0.5;
W=C*W;
w=U*W;
%% 
for i=1:length(U)
    for k=1:length(U)
        mod=modulation(Translation(sig,i,U),U,k).*sig;
        bk=mod'*mod;
        Wloc(i,k)=bk;
    end 
end
figure(2);
imagesc(Wloc);
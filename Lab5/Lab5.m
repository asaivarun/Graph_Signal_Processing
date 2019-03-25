%% EED364 : Grpah Signal Processing |[Lab-5]|                                       
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
i=1:size(Problem.A,1);
E=diag(D);
X(i,1)=exp(-100*E(i,1 ));
x=U*X;
if(round(sum(x.*x))==round(sum(X.*X)))
    display('Verified Pasrvel''s relation ');    
end

%% 2
c=1/(sqrt(sum(x.*x)));
X1(i,1)=c*exp(-100*E(i,1 ));
x1=U*X1;
%%  3
X2(i,1)=exp(-5*E(i,1 ));
x2=U*X2;
c1=1/(sqrt(sum(x2.*x2)));
X3(i,1)=c1*X2;
x3=U*X3;

X4(i,1)=0.03*exp(-E(i,1));
E4X=sum(X4.*X4);
X5(i,1)=exp(-3*E(i,1)); 
E5X=sum(X5.*X5);
X6(i,1)=2*0.03*exp(-4*E(i,1)); 
E6X=sum(X6.*X6);
K1=(-E6X+sqrt(E6X^2-4*E5X*(E5X-4)))/(2*E5X); 
K2=(-E6X-sqrt(E6X^2-4*E5X*(E5X-4)))/(2*E5X);
EK1=(K1^2)*E5X+K1*E6X+E5X;
EK2=(K2^2)*E5X+K2*E6X+E5X;
C1=X4+K1*X5; 
c1=U*C1;
C2=X4+K2*X5;
c2=U*C2;

% plotting translated
T51=Trans(x3,200,U); 
figure(1);
subplot(2,4,1);
sigplot(Problem.A,Minco,T51);
T2=Trans(x3,1000,U);
subplot(2,4,2);
sigplot(Problem.A,Minco,T2);
T3=Trans(x3,2000,U);
subplot(2,4,3);
sigplot(Problem.A,Minco,T3);
T4=Trans(c1,2000,U);
subplot(2,4,4);
sigplot(Problem.A,Minco,T4);
T41=Trans(c2,2000,U);
subplot(2,4,5);
sigplot(Problem.A,Minco,T41);
T5=Trans(c1,1500,U);
subplot(2,4,6);
sigplot(Problem.A,Minco,T5);
T51=Trans(c2,1500,U);
subplot(2,4,7);
sigplot(Problem.A,Minco,T51);
%% 4

figure(2);
subplot(2,2,1)
X11=c*X1;
x11=U*X11;
plot(i,X11);
subplot(2,2,2)
M1=x11.*U(:,2000); 
subplot(2,2,3)
M2=x11.*U(:,100);
subplot(2,2,4)
M3=x11.*U(:,2642);

%% 5
d=[];
for i=1:length(U)

    e=X1(i+1:length(U),1); 
    e=e'*e;
    d=[d e];
end
figure(3);
plot(i,d);



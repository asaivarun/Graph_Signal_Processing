%% EED364 : Grpah Signal Processing |[Lab-5]|                                       
% * Author: RAKESH MUNDLAMURI
% * Roll no:1410110326
% * Email id:rm845@snu.edu.in
% * Lab no : 5
% * Lab batch: 4-6
% * Lab Instructor: _Prof.Vijay Kumar Chakka_   
%% Objective:parsevels relation(conservation of energy)
clc;
close all;
clear all;
Minnesota=load('Lab3_minnesota.mat'); 
Minnesotaadj=Minnesota.Problem.A;
Minnesotaadj=full(Minnesotaadj);
Minnesotacoord=Minnesota.Problem.aux.coord;
zerosap=zeros(1,length(Minnesotaadj))';
Minnesotacoord=[Minnesotacoord zerosap];
degree=sum(Minnesotaadj,2);
degree=diag(degree);
ML=degree-Minnesotaadj;
[MU,ME]=eig(ML);
for i=1:length(MU)
    X1(i,1)=exp(-100*ME(i,1)); %generating coefficents with function of eigen values
end
x1=MU*X1;   
E1x=x1.*x1;
E1x=sum(E1x',2); %finding energy
E1X=X1.*X1;
E1X=sum(E1X',2);
%% question 2 finding C
EX2=E1X;
C=1*EX2^(-1/2); %finding coefficient
%% Translation
for i=1:length(MU)
    X21(i,1)=exp(-5*ME(i,1));%generating coefficents with function of eigen values
end
E21X=X21.*X21;
E21X=sum(E21X',2);%finding energy
C1=1*E21X^-(1/2);
for i=1:length(MU)
    X22(i,1)=0.03*exp(-ME(i,1));%generating coefficents with function of eigen values
end
E22X=X22.*X22;
E22X=sum(E22X',2);
for i=1:length(MU)
    X23(i,1)=exp(-3*ME(i,1)); %generating coefficents with function of eigen values
end
E23X=X23.*X23;
E23X=sum(E23X',2); % finding energy
for i=1:length(MU)
    X24(i,1)=2*0.03*exp(-4*ME(i,1)); %generating coefficents with function of eigen values
end
E24X=X24.*X24;
E24X=sum(E24X',2);
K11=(-E24X+sqrt(E24X^2-4*E23X*(E22X-4)))/(2*E23X); %solving quadratic equation
K12=(-E24X-sqrt(E24X^2-4*E23X*(E22X-4)))/(2*E23X);
EK1=(K11^2)*E23X+K11*E24X+E22X;
EK2=(K12^2)*E23X+K12*E24X+E22X;
SC=C1*X21; 
sc=MU*SC; % inverse gft to obtain signal
SK1=X22+K11*X23; 
sk1=MU*SC;
SK2=X22+K12*X23;
sk2=MU*SK2;
Ta=Translation(sc,200,MU); %translating of the vertexes
figure(1);
subplot(2,4,1);
Gsignalplot(Minnesotaadj,Minnesotacoord,Ta);
Tb=Translation(sc,1000,MU);
subplot(2,4,2);
Gsignalplot(Minnesotaadj,Minnesotacoord,Tb);
Tc=Translation(sc,2000,MU);
subplot(2,4,3);
Gsignalplot(Minnesotaadj,Minnesotacoord,Tc);
Td=Translation(sk1,2000,MU);
subplot(2,4,4);
Gsignalplot(Minnesotaadj,Minnesotacoord,Td);
Te=Translation(sk1,1500,MU);
subplot(2,4,5);
Gsignalplot(Minnesotaadj,Minnesotacoord,Te);
Td1=Translation(sk2,2000,MU);
subplot(2,4,6);
Gsignalplot(Minnesotaadj,Minnesotacoord,Td1);
Te1=Translation(sk2,1500,MU);
subplot(2,4,7);
Gsignalplot(Minnesotaadj,Minnesotacoord,Te1);
%% modulation
figure(2);
I=1:length(MU);
subplot(2,2,1)
CX1=C*X1;
cx1=MU*CX1;
plot(I,CX1);% plotting the graph spectrum
subplot(2,2,2)
M2000cx1=cx1.*MU(:,2000); %modulation in vertex domain
subplot(2,2,3)
M100cx1=cx1.*MU(:,100);
subplot(2,2,4)
M2642cx1=cx1.*MU(:,2642);

%% compression
dist=[];
for i=1:length(MU)

    err=X1(i+1:length(MU),1); %calculating error
    err=err'*err;
    dist=[dist err];
end
figure(3);
plot(I,dist);
%% Question 1 
clc;
clear all;
load('inputData for lab9.mat');
x = full(inputData);
var = 0.01;
w=sqrt(var).*randn(5000,1);
y = x+w;
y1=y;
figure(1)
for t=0:1:4990

A=zeros(10);
    for j=2:10
        A(1,j)=exp(-(y(1+t)-y(j+t))^2/(2*0.1^2));
         A(j,1)=A(1,j);
    end
    n=length(A);
    temp=sum(A,1);
    D=diag(temp);
    L=D-A;
    [eig_vec,V]=eig(L);
    if ~issorted(diag(V))    
        [V,ind3] = sort(diag(V));
        V=diag(V);
        eig_vec = eig_vec(:, ind3);
    end
    Y=eig_vec'*y(1+t:10+t);
    xdn=[];
    for i=1:10
        s=0;
        for l=1:10
            s=s+((1/(1+(10*V(l,l))))*Y(l)*eig_vec(i,l));
        end
        xdn=[xdn;s];
    end
    y(1+t:10+t)=xdn;
end
subplot(3,1,1)
plot(x)
title('original signal')
subplot(3,1,2)
plot(y1)
title(['signal with white gaussian noise mean= 0,variance=0.01 '])
subplot(3,1,3)
plot(y)
title('denoise signal')
%% variance = 0.001
var_1 = 0.001;
w=sqrt(var_1).*randn(5000,1);
y = x+w;
y1=y;
figure(2)
for t=0:1:4990
    A=zeros(10);
    for j=2:10
        A(1,j)=exp(-(y(1+t)-y(j+t))^2/(2*0.1^2));
         A(j,1)=A(1,j);
    end
    n=length(A);
    temp=sum(A,1);
    D=diag(temp);
    L=D-A;
    [eig_vec,V]=eig(L);
    if ~issorted(diag(V))    
        [V,ind3] = sort(diag(V));
        V=diag(V);
        eig_vec = eig_vec(:, ind3);
    end
    Y=eig_vec'*y(1+t:10+t);
    xdn=[];
    for i=1:10
        s=0;
        for l=1:10
            s=s+((1/(1+(10*V(l,l))))*Y(l)*eig_vec(i,l));
        end
        xdn=[xdn;s];
    end
    y(1+t:10+t)=xdn;
end
subplot(3,1,1)
plot(x)
title('original signal')
subplot(3,1,2)
plot(y1)
title(['signal with white gaussian noise mean= 0,variance=0.001 '])
subplot(3,1,3)
plot(y)
title('denoise signal')
%% variance = 1
var_2 = 1;
w=sqrt(var_2).*randn(5000,1);
y = x+w;
y1=y;
figure(3)
for t=0:1:4990
    A=zeros(10);
    for j=2:10
        A(1,j)=exp(-(y(1+t)-y(j+t))^2/(2*0.1^2));
         A(j,1)=A(1,j);
    end
    n=length(A);
    temp=sum(A,1);
    D=diag(temp);
    L=D-A;
    [eig_vec,V]=eig(L);
    if ~issorted(diag(V))    
        [V,ind3] = sort(diag(V));
        V=diag(V);
        eig_vec = eig_vec(:, ind3);
    end
    Y=eig_vec'*y(1+t:10+t);
    xdn=[];
    for i=1:10
        s=0;
        for l=1:10
            s=s+((1/(1+(10*V(l,l))))*Y(l)*eig_vec(i,l));
        end
        xdn=[xdn;s];
    end
    y(1+t:10+t)=xdn;
end
subplot(3,1,1)
plot(x)
title('original signal')
subplot(3,1,2)
plot(y1)
title(['signal with white gaussian noise mean= 0,variance=1 '])
subplot(3,1,3)
plot(y)
title('denoise signal')
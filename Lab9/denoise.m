function[] = denoise(y)
A=zeros(10);
for i=1:10
    for j=1:10
        if((i==1||j==1)&&~(i==1&&j==1)&&(y(i,1)-y(j,1))<=0)
         A(i,j)=exp(-((y(i,1)-y(j,1))^2)/0.02);
        end
    end
end
D =diag(sum(ceil(A),2));
L=D-A;
[E, U]=eig(L);
e=diag(E);
X=zeros(5000,1);
for k=1:10:4991
    Y(k:k+9,1)=U'*y(k:k+9,1);
for i=0:9
    for j=0:9
        X(k+i,1)=X(k+i,1)+((1/(1+(10*e(1+j,1))))*(Y(k+j,1)*U(i+1,j+1)));
    end
end
end
plot(X);
end

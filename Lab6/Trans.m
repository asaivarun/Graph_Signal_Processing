function [ s ] = Trans( sig,N,U )
d=zeros(length(U),1); 
d(N,1)=1; 
D=U'*d;
SIG=U'*sig;
S=D.*SIG;
s=U*S;
end


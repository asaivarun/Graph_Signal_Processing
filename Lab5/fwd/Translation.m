function [ s ] = Translation( sig,N,MU )
del=zeros(length(MU),1); 
del(N,1)=1; %delta function
DEL=MU'*del;
SIG=MU'*sig;
S=DEL.*SIG;
s=MU*S;
end


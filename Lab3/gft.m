function[Xg,V,x]=gft(A,X)
[U D]=eig(A);
Xg=U'*X;

end

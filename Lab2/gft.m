function[Xg,V,x]=gft(A,X)
[U D]=eig(A);
Xg=U'*X;
%inverse
x=U*Xg;
if(round(x-X)==0)
   V='Verified, U is Orthognal'; 
else
    V='Not Verified';
end

end

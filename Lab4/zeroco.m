function[]=zeroco(L,A)
[U D] = eig(L);
m= size(U,1);
Z=zeros(m,1);
for k=1:m
    for i=1:m
        for j=i:m
            if(A(i,j)>0 && (U(i,k)*U(j,k)<0))
                 Z(k,1)=Z(k,1)+1;
            end
        end
    end
    
end
%E=sortrows([diag(D) Z]); 
%D=E(:,1);
%Z=E(:,2);
figure;
stem(1:size(Z,1),sort(Z));
end


    

function [ X ] = dplot( A ,X)

%plot(X(:,1),X(:,2),'*');
for i=2:length(A)
    for j=1:i-1
        if A(i,j)>0
            line([X(i,1),X(j,1)],[X(i,2),X(j,2)]); 
            
        end
    end
end

end


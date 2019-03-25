function [] = my2dgplot(A,B)
[m n]=size(A);
for i=1:m
     text(B(i,1),B(i,2),'*');
        for j=i:m
            if(A(i,j)==1)
                 hold on;
                 line([B(i,1),B(j,1)],[B(i,2),B(j,2)]);
            end
        end
    end
end

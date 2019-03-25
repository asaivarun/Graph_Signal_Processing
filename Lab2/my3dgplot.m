function [] = my3dgplot(A,B,X)
[m n]=size(A);
    for i=1:m
        text(B(i,1),B(i,2),B(i,3),'*');
        for j=i:m
            if(A(i,j)==1)
                 hold on;
                 line([B(i,1),B(j,1)],[B(i,2),B(j,2)],[B(i,3),B(j,3)]);
            end
        end
       l= line([B(i,1),B(i,1)],[B(i,2),B(i,2)],[B(i,3),(B(i,3)+X(i,1))]);
       set(l,'color','red');
    end
end

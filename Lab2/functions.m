%1st Function
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
%2rd Function
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
        line([B(i,1),B(i,1)],[B(i,2),B(i,2)],[B(i,3),(B(i,3)+X(i,1))]);
    end
end
%3rd Function
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

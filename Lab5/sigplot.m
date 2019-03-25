function  sigplot( A,B,X )

dplot(A,B); 
for i=1:length(A)
        line([B(i,1) B(i,1)],[B(i,2) B(i,2)],[0 X(i,1)]); 
end

end


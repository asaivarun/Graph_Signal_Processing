function  Gsignalplot( A,R1,X )

P3=D2plot(A,R1); %plotting it in 2D
for i=1:length(A)
        line([R1(i,1) R1(i,1)],[R1(i,2) R1(i,2)],[0 X(1,i)]); %drawing line between the coordinates
       % text([ R1(i,1)],[ R1(i,2)],[ R1(i,3)+X(1,i)],num2str(X(1,i))); %labling the weights
end

end


function[y]=conv(X,H,U)
 Y=X.*H;
 y=U*Y;
 figure;
 stem(y);
end
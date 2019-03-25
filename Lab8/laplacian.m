function [L ] = laplacian(A)
m= size(A,1);
D =diag(sum(ceil(A),2));
L=D-ceil(A);
%Lw=D-A;
%Ln = D^-0.5*L*D^-0.5;
end

function [L] = laplacian(A)
m= size(A,1);
D =diag(sum(ceil(A),2));
L=D-ceil(A);
end

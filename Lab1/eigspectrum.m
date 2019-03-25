function []=eigspectrum(A)
hold off;
E=eig(A);
B = unique(E); 
E = histc(E, B);
stem(E,B);;
end
%% Author : Shaik Basheeruddin Shah
% Email ID: bs600@snu.edu.in
% Research Scholar 
% Shiv Nadar University 
% Aim: Plotting graph signals and Graph Fourier Transform(GFT)
% Note: If there are any modifications/suggestions, please contact above
% mail ID
%%
clc;
clear all;
close all;
%% 1. Plotting graph signal for the class example
A = [0 1 0 1 0;1 0 1 0 0;0 1 0 1 0;1 0 1 0 1;0 0 0 1 0];
Signal = [1 -1 -1 1 1];
% userdefined function to plot the graph signals
graphSignalPlot(A,Signal);
%% 2. Plotting graph signal for the given random data using Bucky ball example
[B,XY] = bucky;
graphPlot(B,XY(:,1:2));
% The keyword 'randi' generates the signal values from -4 to 4 for the
% given size
randData = randi([-4,4],[size(B,1),1]);
graphSignalPlot(B,randData,XY);
%% 3. GFT and IGFT computation
% for class example
classD = diag(sum(A));
classL = classD - A;
[cEigVec,cEigVal] = eig(classL);
cGftCoeff = cEigVec.'*Signal.';
% verifying the orthonormality condition
if ((cEigVec.'*cEigVec)-eye(length(A)))<1e-4
    disp('Eigen vector matrix is orthonormal');
end
reCSignal = cEigVec*cGftCoeff;
%% 4. Bucky ball example GFT computation
% The keyword 'full' converts the sparse double representation of matrix to
% full matrix
buckyD = diag(sum(full(B))); 
buckyL = buckyD-full(B);                
[bEigVec,bEigVal] = eig(buckyL);
Signal1 = 3*bEigVec(:,1)+10*bEigVec(:,15)+2*bEigVec(:,32);
Signal2 = 5*bEigVec(:,60);
Signal3 = 2*bEigVec(:,1);
bGftCoeff1 = bEigVec.'*Signal1;
bGftCoeff2 = bEigVec.'*Signal2;
bGftCoeff3 = bEigVec.'*Signal3;
% verifying the orthonormality condition
if ((bEigVec.'*bEigVec)-eye(length(B)))<1e-4
    disp('Eigen vector matrix is orthonormal');
end
reBSignal1 = bEigVec*bGftCoeff1;
reBSignal2 = bEigVec*bGftCoeff2;
reBSignal3 = bEigVec*bGftCoeff3;
%% 5. Calculating the sparsity order for GFT coefficients
% Counting the no.of non-zero elements in the gft coefficients
for i=1:length(bGftCoeff1)
   if bGftCoeff1(i,1)<1e-7
       bGftCoeff1(i,1)=0;
   end
   if bGftCoeff2(i,1)<1e-7
       bGftCoeff2(i,1)=0;
   end
   if bGftCoeff3(i,1)<1e-7
       bGftCoeff3(i,1)=0;
   end    
end
% find keyword finds indices and values of nonzero elements
sOrder1 = length(find(bGftCoeff1));
sOrder2 = length(find(bGftCoeff2));
sOrder3 = length(find(bGftCoeff3));
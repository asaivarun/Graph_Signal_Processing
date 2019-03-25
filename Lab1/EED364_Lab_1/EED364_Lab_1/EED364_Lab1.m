%% Author : Shaik Basheeruddin Shah
% Mail ID: bs600@snu.edu.in
% Ph.D research Scholar
% Shiv Nadar University
% Aim : 1. Graph plotting based on adjacency matrix and calculating the
% eigen spectrum for the plotted graphs
% Note: If there are any modifications/suggestions, please contact above mail ID
%%
clc;
clear all;
close all;
%% 1. Plotting the 2D graph based on adjacency matrix
%A = ones(3)-eye(3);
%A = [0 1 1 0;1 0 0 1; 1 0 0 1;0 1 1 0];
A = [0 1 1 0 0;1 0 0 1 0;1 0 0 1 0;0 1 1 0 0;0 0 0 0 0];
xy = rand(length(A),2);
graphPlot(A,xy);
% verifying the result using 'gplot' keyword
figure,gplot(A,xy);
%% 2. Plotting the 3D graph based on adjacency matrix
xy = rand(length(A),3);
graphPlot3(A,xy);
%% 3. Plotting the 2D and 3D graphs for Bucky ball example
[B,xy] = bucky;
graphPlot(B,xy);
graphPlot3(B,xy);
%% 4. Generating random adjacency matrix and plotting its 2D and 3D graphs
N = 16;
R = round(rand(N));
L = triu(R)-diag(diag(R));
randA = L+L.';
xy = rand(N,2);
graphPlot(randA,xy);
xyz = rand(N,3);
graphPlot3(randA,xyz);
%% 5. Calculating eigen spectrum
[eigVec,eigVal] = eig(full(B));
% rounding the values in eigVal matrix upto 4 digits
eigVal = round(eigVal.*10000)/10000;
[Count, uniqVal] = hist(diag(eigVal),unique(diag(eigVal)));
figure;
stem(uniqVal,Count);title('Eigen spectrum');
xlabel('Eigen Values');ylabel('Algebraic Multiplicity');
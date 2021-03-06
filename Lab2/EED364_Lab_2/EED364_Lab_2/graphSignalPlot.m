function [] = graphSignalPlot(A,Signal,xy)
% Author : Shaik Basheeruddin Shah
% Email ID: bs600@snu.edu.in, Research Scholar, Shiv Nadar University
% Note: If there are any modifications/suggestions, please contact above
% mail ID
% Aim: Plots the graph signal for the given adjacency matrix(A), signal and
% coordinates(xy). When xyz is omitted, the coordinates generated by using
% 'rand' keywords are used by default

% Checking input arguments and set defaults.
N = size(A,1);
narginchk(2,3);
if nargin<3
    xy = rand(N,2);
end
if size(Signal,1)==1
    Signal = Signal.';
end
labels = cellstr(num2str((1:N).'));
figure,
plot3(xy(:,1),xy(:,2),zeros(N,1),'*');
text(xy(:,1),xy(:,2),zeros(N,1),labels,'HorizontalAlignment','right',...
    'VerticalAlignment','Top');
hold on;
plot3(xy(:,1),xy(:,2),Signal(:,1),'o');
text(xy(:,1),xy(:,2),Signal(:,1),cellstr(num2str(Signal)),'HorizontalAlignment','right',...
    'VerticalAlignment','Top');
for i = 1:size(A,1)
    for j = i+1:size(A,2)
        if A(i,j)==1
            line([xy(i,1),xy(j,1)],[xy(i,2),xy(j,2)],[0,0]);
        end
    end
    l = line([xy(i,1),xy(i,1)],[xy(i,2),xy(i,2)],[0,Signal(i,1)]);
    set(l,'color','red');
end
end
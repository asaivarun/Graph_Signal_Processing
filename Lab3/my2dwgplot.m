function [] = my2dwgplot(A,E,B)
narginchk(1,3);
if nargin<3
    B = rand(length(A),2);
end
% Generating the node labels and plotting the graph
%labels = cellstr(num2str((1:size(B,1)).'));
figure;
plot(B(:,1),B(:,2),'*');
%text(B(:,1),B(:,2),'HorizontalAlignment','right',.. 'VerticalAlignment','Top');
hold on;
for i = 1:size(A,1)
    for j = i+1:size(A,2)
        if A(i,j)>0
            line([B(i,1),B(j,1)],[B(i,2),B(j,2)]);
            text((B(i,1)+B(j,1))/2,((B(i,2)+B(j,2))/2),cellstr(num2str(E(1,i))));
        end
    end
end
end

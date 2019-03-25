function [] = my3dgplot(A,B,X)

%labels = cellstr(num2str((1:size(X,1)).'));
figure,
plot3(X(:,1),X(:,2),X(:,3),'*');
%plot3(X(:,1),X(:,2),X(:,3)+B(:,1),num2str(B(:,1)));
%text(X(:,1),X(:,2),X(:,3)+B(:,1),labels,'HorizontalAlignment','right', 'VerticalAlignment','Top');
%text(X(:,1),X(:,2),X(:,3),labels,'HorizontalAlignment','right', 'VerticalAlignment','Top');
plot3(X(:,1),X(:,2),X(:,3)+B(:,1),'o');
%text(X(:,1),X(:,2),X(:,3)+B(:,1),cellstr(num2str(B)),'HorizontalAlignment','right', 'VerticalAlignment','Top');

hold on;
for i = 1:size(A,1)
    for j = i+1:size(A,2)
        if A(i,j)==1
            line([X(i,1),X(j,1)],[X(i,2),X(j,2)],[X(i,3),X(j,3)]);
        end
    end
    l= line([X(i,1),X(i,1)],[X(i,2),X(i,2)],[X(i,3),(X(i,3)+B(i,1))]);
    set(l,'color','red');
end
end

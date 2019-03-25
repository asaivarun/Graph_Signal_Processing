function[s]=gs(A,XY,X)
[a b] = dijkstra(A,XY);
c=cellfun(@length,b)-1;
for i=1:length(c)
    d(i,1)= sum(a(i,:).^2.*X);
end 
s=min(d)/sum(X.*X);
end


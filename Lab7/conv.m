function[y]=conv(x,h,U)
 X=U'*x;
 H=U'*h;
 Y=X.*H;
 y=U*Y;
 load('Lab3_minnesota.mat', 'Problem');
 my2dgplot(Problem.A,Problem.aux.coord);
hold on;
for i = 1:size(Problem.A,1)
 line([Problem.aux.coord(i,1),Problem.aux.coord(i,1)],[Problem.aux.coord(i,2),Problem.aux.coord(i,2)],[0,y(i,1)]);
end
hold off;
rotate3d off
end

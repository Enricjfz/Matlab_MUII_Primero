function  minimum(n,funX)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x = rand(n,1) * 7;
xs = sort(x);
x1 = xs(1);
tabla = zeros(n,1);
tabla(1) = funX(x1);
for i = 2:n
x2 = xs(i);
tabla(i) = fminbnd(funX,x1,x2);
end

yy = zeros(n,1);
for j = 1:n
 yy(j) = funX(xs(j));
end

plot(xs,tabla,'b',xs,yy,'r');



end
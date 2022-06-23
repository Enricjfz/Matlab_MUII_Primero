function y = funX(x)
% x should be a column vector
mycoef = [1 5 -2 5 7]';
z = [cos(x), cos(1.6*x) cos(2*x), cos(4.5*x), cos(9*x)];
y = z * mycoef;
end
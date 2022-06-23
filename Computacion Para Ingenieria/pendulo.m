function f = pendulo(t,y)
%Edo de orden 2 que describe el movimiento de un pendulo x'' - sin(x) = 0
% x es el angulo e x' es su derivada (velocidad)
f = [y(2);-sin(y(1))];
end
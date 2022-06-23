function b = pendulo_fzero(t)
%Edo de orden 2 que describe el movimiento de un pendulo x'' - sin(x) = 0
% x es el angulo e x' es su derivada (velocidad)
%función para usar con fzero
f = @(t,y) [y(2);-sin(y(1))];
[ts,xs] = ode45(f,[0,10],[0;t]); 
b = xs(end,1);   
end
function f = fun_foucault(t,x)
% EDO system which describes the foucault pendulum without friction
%   Detailed explanation goes here

g = 9.83; %acceleration of gravity (m/sec2)
l = 67; %pendulum length (m)
w = 2*pi/86400; %Earth s angular velocity of rotation about its axis (rad/sec)
phi = 49/180*pi; %latitude in (rad)

%x(1) = x, x(2) = x', x(3) = y, x(4) = y';
% x initial x coordinate (m)
% x' initial x velocity (m/sec)
% y initial y coordinate (m)
% y' initial y velocity (m/sec)
f = [x(2); 2*w*sin(phi)*x(4) - (g/l)*x(1); x(4); -2*w*sin(phi)*x(2) - (g/l)*x(3)];

end
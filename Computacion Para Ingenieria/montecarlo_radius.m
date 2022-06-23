function [error,area] = montecarlo_radius(r,xx)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if r <= 0
    error ("El radio no puede ser negativo o 0");
end

fprintf("Metodo de Montecarlo para estimar el area usando los puntos que se situan dentro del radio %d\n",r);
n = 100000;
if nargin == 1 
    xx = r * rand(n,2);
end
th = 0:pi/50:2*pi;
xunit = r * cos(th);
yunit = r * sin(th);
inside = (xx(:,1).^2 + xx(:,2).^2 < r^2);
%hold on
%plot(xunit, yunit, 'r');
%plot(xx(inside,1),xx(inside,2),'y*')
%plot(xx(:,1),xx(:,2),'b*');
%hold off
trueArea = (pi*r^2)/4;
error = zeros(5,1);
area = zeros(5,1);
for i = 1:5
    nn = 10^i;
    area(i) = r^2*(sum(inside(1:nn)))/nn;
    error(i) = abs(trueArea - area(i));
    disp(sprintf("TrueArea %f Area %f Error %f", trueArea, area(i), error(i)));
end

%{
x_base = [10,100,1000,10000,100000];
loglog(x_base,error,'b')
title('Error de MC frente al numero de muestras, escala logarítmica');
xlabel('Numero de muestras');
ylabel('Error');
%}
end
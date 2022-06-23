n = 10000
r = 5
xx = r * rand(n,2);
th = 0:pi/50:2*pi;
xunit = r * cos(th);
yunit = r * sin(th);
inside = (xx(:,1).^2 + xx(:,2).^2 < r^2);
hold on
plot(xunit, yunit, 'r');
plot(xx(inside,1),xx(inside,2),'y*')
plot(xx(:,1),xx(:,2),'b*');
hold off
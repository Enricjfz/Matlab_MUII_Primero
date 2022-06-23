function [error,MC_approx] = basic_MC(r,Xu)
%Uses the definition of a circle to calculate which points are inside of it

%{
true_area = (pi * r^2)/4;
rand('state',0);
xx = 0:0.01:r;
xx = [xx,r];
yy = sqrt(r^2 - xx.* xx);
%plot(xx,yy)
%}
fprintf("Metodo básico de Montecarlo para estimar el area de un circulo de radio %d\n",r);

nn = 100000;
if nargin == 1
   Xu = r * rand(nn,2);
end
true_area = (pi * r^2)/4;
fvals = sqrt(r^2 - Xu(:,1).^2); 
MC_approx = zeros(5,1);
error = zeros(5,1);
fprintf("Area verdadera: %f\n",true_area);

for i = 1:5
   n = 10^i;
   MC_approx(i) = r * sum(fvals(1:n))/n;
   error(i) = abs(MC_approx(i) - true_area);
   fprintf("Muestra: %d Aproximación MC: %f Error: %f\n", n,MC_approx(i),error(i));
end

x_base = [10,100,1000,10000,100000];

loglog(x_base,error,'b')
title('Error de MC frente al numero de muestras, escala logarítmica');
xlabel('Numero de muestras');
ylabel('Error');



end
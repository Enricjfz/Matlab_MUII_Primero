function error = newton_cotes_radius(r, iter)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if r <= 0
    error ("El radio no puede ser negativo o 0");
end

if iter <= 0
    error ("Las iteraciones no pueden ser negativas o 0");
end

fprintf("Metodo de newton cotes para estimar el area de un circulo de radio %d\n",r);
areaReal = (pi * r^2)/4;
error = zeros(iter,1);
for i = 1:iter
    x = 0:r/i:r;
    y = sqrt(r^2 - x.^2);
    %plot(x,y)
    area_trap = trapz(x,y);
    error(i) = abs(areaReal - area_trap);
    disp(sprintf("Area Real %f ,Area trapecio %f, Error %f",areaReal, area_trap, error(i)));
end

x_base = [1,2,3,4,5];
loglog(x_base,error,'b')
title('Newton Cotes Formula');
xlabel('Step de trapecios');
ylabel('Error');

end
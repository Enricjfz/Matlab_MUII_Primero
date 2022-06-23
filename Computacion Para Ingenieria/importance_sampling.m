function [error,MCapprox] = importance_sampling(n,r,ni,aleatorios)
%n es el total de numeros aleatorios generados
%r es el radio
%ni es el numero de puntos equispaciados
%aleatorios es el conjunto de numeros generados aleatoriamente

if r <= 0
    error ("El radio no puede ser negativo o 0");
end

if nargin == 3
    aleatorios = rand(n,1);
end
fprintf("Metodo de Importance Sampling para estimar de un circulo de radio %d\n",r);

true_area = (pi * r^2)/4;
h = r / ni;
x = 0:h:r-h;
f = sqrt(r^2 - x.^2);
p = f /sum(f); % p(i)= f(x(i))/sum(f(x(1:n))
MCapprox = zeros(5,1);
for i = 1:5
    nn = 10^i;
    ntps = round(nn * p);

    first = 0;
    MCapprox(i) = 0;
    for j = 1:ni
        xpts = (j - 1) * h + aleatorios(first +1: first + ntps(j))*h;
        MCapprox(i) = MCapprox(i) + sum(sqrt(r ^2  - xpts.^2)) / p(j);
        first = first + ntps(j);
    end
    MCapprox(i) = r * MCapprox(i) / (nn * ni);
end

error = zeros(5,1);
for i = 1:5
    error(i) = abs(MCapprox(i) - true_area);
    fprintf("N usado: %d Aproximación MC: %f Error: %f\n",10^i, MCapprox(i),error(i));
end


x_base = [10,100,1000,10000,100000];
loglog(x_base,error,'b')
title('Error de MC frente al numero de muestras, escala logarítmica');
xlabel('Numero de muestras');
ylabel('Error');
%}

end
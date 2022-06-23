function error = importance_sampling_sqrt(n,xx,ni,aleatorios)
%n es el total de numeros aleatorios generados
%xx es el intervalo superior del area de sqrt(x)
%ni es el numero de puntos equispaciados
%aleatorios es el conjunto de numeros generados aleatoriamente

if xx <= 0
    error ("El radio no puede ser negativo o 0");
end

if nargin == 3
    aleatorios = rand(n,1);
end
fprintf("Metodo de Importance Sampling para estimar la integral de la raiz cuadrada en el intervalo de [0,%d]\n",xx);

true_area = ((2*xx^(3/2))/ 3); %integral de sqrt(x) en el intervalo [0, xx]
h = xx / ni;
x = h:h:xx; %se empieza en el intervalo 0 + h, ya que en sqrt(0) = 0, no habría puntos
f = sqrt(x);
p = f /sum(f); % p(i)= f(x(i))/sum(f(x(1:n))
MCapprox = zeros(5,1);
for i = 1:5
    nn = 10^i;
    ntps = round(nn * p);
    first = 0;
    MCapprox(i) = 0;
    for j = 1:ni
        if ntps(j) == 0
            continue %no hay puntos en el intervalo, para controlar indeterminaciones
        end
        xpts = (j - 1) * h + aleatorios(first +1: first + ntps(j))*h;
        MCapprox(i) = MCapprox(i) + sum(sqrt(xpts)) / p(j);
        first = first + ntps(j);
    end
    MCapprox(i) = xx * MCapprox(i) / (nn * ni);
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
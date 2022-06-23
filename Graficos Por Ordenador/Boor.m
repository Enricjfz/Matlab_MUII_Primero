function X = Boor(P,p,U,u)
%Boor: calcula una curva B-spline anclada,
%P es una tabla que contiene los puntos de control,
%p es el grado del b-spline
%U es el conjunto de nodos
%u es el parametro comprendido entre 0 y 1
%la variable de salida es X (valor en la curva en el punto t)

if u < 0 || u > 1
    error("t must be between 0 and 1, %s",u)
end
n = height(P) - 1;
control = length(U) - 1;
if control ~= (n + p + 1)
    error("No se cumple la condición necesaria");
end

k=0;
%calculate k 
for i = 1:control
    if  u ~= 1 && u >= U(i) && u < U(i + 1) && U(i) < U(i + 1)
        k = i;
        break;
    end
    
    if  u == 1 && u >= U(i) && u <= U(i + 1) && U(i) < U(i + 1)
        k = i;
        break;
    end
end
%new dimension
P(end,end,p+1) = 0;
%calculate new points
for r = 2:p+1
    for i = k - p + (r-1):k
        a = (u - U(i))/(U(i + p - (r-1) + 1) - U(i));
        if isinf(a)
            a = 0;
        end
        P(i,:,r) = (1 - a)* P(i-1,:,r-1) + a*P(i,:,r-1);
    end
end
X = P(k,:,p+1);

end
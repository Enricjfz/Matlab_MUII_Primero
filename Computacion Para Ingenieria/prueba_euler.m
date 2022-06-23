%Resolver y’(x)=fun1(x,y)
%ci y(0)=10
%En el intervalo [0,20]
%Con el método Euler
%Tamaño de paso h=1/2
%Dibujar la gráfica
clear
h=1/2;
[xn,yn]=euler(0,10,20,h,'fun1');
plot(xn,yn,'o');
hold on
[xn,yn]=euler(0,10,20,5,'fun1');
plot(xn,yn,'b');
hold on
[xn,yn]= rk4(0,10,20,5,'fun1');
plot(xn,yn,'g*');
title('Gráfica solucion numérica con Metodo Euler')
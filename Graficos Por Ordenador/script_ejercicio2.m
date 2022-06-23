
%script ejercicio 2
%{
clear all
h1 = 0.1;
h2 = 0.01;
h3 = 0.001;
[xn,yn]=euler(1,2,5,h1,'function_ejer2');
plot(xn,yn,'b');
hold on
[xn,yn]=euler(1,2,5,h2,'function_ejer2');
plot(xn,yn,'g');
hold on
[xn,yn]= euler(1,2,5,h3,'function_ejer2');
plot(xn,yn,'y');
hold on
x = 1:0.5:5;
y = 2 * exp((2*(sqrt(x) - 1)));
plot(x,y,'r')
title('Gráfica solucion numérica con Metodo Euler y solución exacta (en rojo)')
%}



%script apartado b

clear all

n = 1:3;
h = 10.^-n;
error_euler = zeros(size(n));
error_rk2 = zeros(size(n));
error_rk4 = zeros(size(n));
x = 5;
y = 2 * exp((2*(sqrt(x) - 1)));

y0 = 2;
x0 = 1;
for i = 1:size(n,2)
[xn1,yn1]=euler(x0,y0,5,h(i),'function_ejer2');
[xn2,yn2]=runge_kutta2(x0,y0,5,h(i),'function_ejer2');
[xn3,yn3]=runge_kutta4(x0,y0,5,h(i),'function_ejer2');
error_euler(i) = abs(y - yn1(end));
error_rk2(i) = abs(y - yn2(end));
error_rk4(i) = abs(y - yn3(end));
end

loglog(h,error_euler,'b',h,error_rk2,'g',h,error_rk4,'y');
title('Errores de los distintos metodos (escala log)');
legend('error_euler','error_rk2','error_rk4');

%}
%{
%apartado c

clear all

n = 1:5;
h = 10.^-n;
error_euler = zeros(size(n));
error_rk2 = zeros(size(n));
error_rk4 = zeros(size(n));
x = 5;
y = 2 * exp((2*(sqrt(x) - 1)));

y0 = 2;
x0 = 0.00001;
for i = 1:size(n,2)
[xn1,yn1]=euler(x0,y0,5,h(i),'function_ejer2');
[xn2,yn2]=runge_kutta2(x0,y0,5,h(i),'function_ejer2');
[xn3,yn3]=runge_kutta4(x0,y0,5,h(i),'function_ejer2');
error_euler(i) = abs(y - yn1(end));
error_rk2(i) = abs(y - yn2(end));
error_rk4(i) = abs(y - yn3(end));
end

loglog(h,error_euler,'b');
hold on
loglog(h, error_rk2,'g');
hold on
loglog(h, error_euler,'y');
title('Errores de los distintos metodos (escala log)')
%}



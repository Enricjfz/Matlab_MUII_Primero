function [xn,yn] = runge_kutta4(x0,y0,xfin,h,fun)
%Implementa el método de Runge Kutta 4
%x0,y0, Condiciones iniciales
%x0,xfin, Intervalo de integración
%h Tamaño del paso
%fun Función f(x,y) que define la edo
%xn,yn Tabla de valores

xn=x0:h:xfin;lxn=length(xn);
% Discretización del tiempo, lxn=número de puntos
yn=zeros(1,lxn);yn(1)=y0; % Tabla e inicialización yn
for n=2:lxn
   k1 =  feval(fun,x0, yn(n-1));
   k2 =  feval(fun,x0 + 0.5 * h, yn(n-1) + 0.5 * h * k1);
   k3 =  feval(fun,x0 + 0.5 * h, yn(n-1) + 0.5 * h *k2);
   k4 =  feval(fun,x0 + h, yn(n-1) + k3* h);
   % Update next value of y
   yn(n) = yn(n-1) + h * (k1 + 2 * k2 + 2 * k3 + k4)/6.0;
   %Update next value of x
   x0 = x0 + h;


end
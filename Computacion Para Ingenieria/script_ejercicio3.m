%ejercicio 3
%{
%apartado a
tspan = [0,5];
y = [1,0,0.1];
[xn,yn] = ode45(@fun2, tspan,y);

plot(xn,yn(:,2),'-o',xn,yn(:,3),'-o')
title('Solution of order 3 pvi with ODE45');
xlabel('Time t');
ylabel('Solution y');
legend('y_2','y_3')

dx=diff(xn); 
tdx=xn(2:length(xn));
plot(tdx,dx,'o');
xlabel('time t');
ylabel('tamaño paso');
%}

%Apartado b
tspan = [0,3];
y = [1,0,1];
[xn,yn] = ode45(@fun2, tspan,y);

%plot(xn,yn(:,2),'-o',xn,yn(:,3),'-o')
%title('Solution of order 3 pvi with ODE45');
%xlabel('Time t');
%ylabel('Solution y');
%legend('y_2','y_3')

dx=diff(xn); 
tdx=xn(2:length(xn));
plot(tdx,dx,'o');
xlabel('time t');
ylabel('tamaño paso');

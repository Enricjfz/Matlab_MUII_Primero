%script ejercicio 2 proyecto pvf

%tspan = [0, 300];
tspan = [0,86400];
initial_condition = [1/100,0,0,0];
%opt=odeset('RelTol',1e-6);
[t,y] = ode45(@fun_foucault,tspan,initial_condition);

plot(t,y(:,3),'b');


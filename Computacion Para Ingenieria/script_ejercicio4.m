%ejercicio 4 atractor de lorenz

%{
%apartado a)
initial_condition = [-8 8 27];
time_span = [0 20];
[xn,yn] = ode45(@lorenz,time_span,initial_condition);   
plot3(yn(:,1),yn(:,2),yn(:,3),'r');
title('Initial Conditions: [-8,8,27]');
xlabel('Solution x');
ylabel('Solution y');
zlabel('Solution z');

%}

%apartado c)

initial_condition1 = [-8 8 27];
initial_condition2 = [-8.002 8.002 27.002];
time_span = [0 20];
[xn,yn] = ode45(@lorenz,time_span,initial_condition1);   
[xn2,yn2] = ode45(@lorenz,time_span,initial_condition2);  
plot3(yn(:,1),yn(:,2),yn(:,3),'b');
hold on
plot3(yn2(:,1),yn2(:,2),yn2(:,3),'r');
title('Initial Conditions: [-8,8,27] blue, [-8.001, 8.001 27.001] red');
xlabel('Solution x');
ylabel('Solution y');
zlabel('Solution z');

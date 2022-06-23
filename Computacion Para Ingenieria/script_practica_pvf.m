%script practica pvf
x1 = [0.001:0.001:2.1];
% t = 0
tspan = [0 30];
%condiciones iniciales x(0) = 0 x'(0) = x1(i)

%{
%apartado 1
x1 = 1;
%opt=odeset('RelTol',1e-6);
[t,y] = ode45(@pendulo,tspan,[0; x1]);
plot(t,y(:,1),'-ob',t,y(:,2),'-or')
title('Solution of Pendulum Ecuation with ODE45');
xlabel('Time t');
ylabel('Solution x');
legend('x_1','x_2');
%}

%{
%apartado 2
x1 = 0.8;
%opt=odeset('RelTol',1e-6);
[t,y] = ode45(@pendulo,tspan,[0; x1]);
plot(t,y(:,1),'-ob',t,y(:,2),'-or')
title('Solution of Pendulum Ecuation with ODE45');
xlabel('Time t');
ylabel('Solution x');
legend('x_1','x_2');
%}


%apartado 3

n = size(x1,2);
error = zeros(1,n);
for i = 1:n
    error(i) = error_tiro(x1(i));
end

plot(x1,error,'b-o',x1,0,'k.');


%}

%{
%apartado 4 y 5
%x0 = 0.9;

r0 = fzero(@pendulo_fzero,0);

r1 = fzero(@pendulo_fzero,[0.9,1]);

r2 = fzero(@pendulo_fzero,[1.7,1.9]);

r3 = fzero(@pendulo_fzero,[1.95,2.2]);

%opt=odeset('RelTol',1e-6);
[t,y] = ode45(@pendulo,tspan,[0; r2]);
plot(t,y(:,1),'-ob',t,y(:,2),'-or')
title('Solution of Pendulum Ecuation with ODE45, x1 = 1.997');
xlabel('Time t');
ylabel('Solution x');
legend('x_1','x_2');
%}

%apartado 7

%{

n = size(x1,2);
error = zeros(1,n);

for i = 1:n
    error(i) = error_tiro(x1(i));
end
plot(x1,error,'b-o',x1,0,'k.');

%{
r6 = fzero(@pendulo_fzero,[1.991,2]);

%opt=odeset('RelTol',1e-6);
[t,y] = ode45(@pendulo,tspan,[0; r6]);
plot(t,y(:,1),'-ob',t,y(:,2),'-or')
title('Solution of Pendulum Ecuation with ODE45, x1 = 1.9985');
xlabel('Time t');
ylabel('Solution x');
legend('x_1','x_2');
%}




r0 = 0;

r1 = fzero(@pendulo_fzero,[0.8,1]);

r2 = fzero(@pendulo_fzero,[1.5,1.7]);

r3 = fzero(@pendulo_fzero,[1.7,1.9]);

r4 = fzero(@pendulo_fzero,[1.97,1.99]);


%opt=odeset('RelTol',1e-6);
[t,y] = ode45(@pendulo,tspan,[0; r4]);
plot(t,y(:,1),'-ob',t,y(:,2),'-or')
title('Solution of Pendulum Ecuation with ODE45, x1 = 1.9805');
xlabel('Time t');
ylabel('Solution x');
legend('x_1','x_2');

%}


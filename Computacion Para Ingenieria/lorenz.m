function f = lorenz(t,y)
%parametros fisicos:
sigma = 10;
beta = 8/3;
rho = 28;

f = [-sigma*y(1) + sigma*y(2); rho*y(1) - y(2) - y(1)*y(3); -beta*y(3) + y(1)*y(2)];

end
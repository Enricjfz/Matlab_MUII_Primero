function E=error_tiro(x)
% x=condición inicial
% E=error
b_value_end=0; % valor en xf, x(xf)=valor_final
opt=odeset('RelTol',1e-6);
[t,y]=ode45(@pendulo,[0,10],[0;x],opt);
E=y(end,1)-b_value_end;
return
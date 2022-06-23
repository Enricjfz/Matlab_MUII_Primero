function E=error_tiro2(x)
% x=condición inicial (x(1) es para x y x(2) para su derivada)
% E=error
b_value_end=0; % valor en xf, x(xf)=valor_final
opt=odeset('RelTol',1e-6);
[t,y]=ode45(@pendulo,[0,20],[x(1);x(2)],opt);
E=y(end,1)-b_value_end;
return
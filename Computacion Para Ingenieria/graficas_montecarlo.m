%graficas para la entrega de montecarlo

x_base = [10,100,1000,10000,100000];
r = 2.0;
aleatorios = rand(x_base(end),2);
Xu = r* aleatorios;
[error_basic_MC,area_basic] =  basic_MC(r,Xu);
[error_importance_sampling,area_importance] = importance_sampling(100000,r,10,aleatorios(:,1));
[error_montecarlo_radius,area_radius] = montecarlo_radius(r,Xu);

%{
loglog(x_base,error_basic_MC,'b',x_base,error_importance_sampling,'r',x_base,error_montecarlo_radius,'g');
title('Error de los distintos metodos de MC');
xlabel('Número de muestras usadas');
ylabel('Error');
legend("errorBasicMC","errorImportanceSampling","errorMontecarloRadius");
%}
loglog(x_base,area_basic,'b',x_base,area_importance,'r',x_base,area_radius,'g');
title('Area de los distintos metodos de MC');
xlabel('Número de muestras usadas');
ylabel('Area (u2)');
legend("basicMC","importanceSampling","montecarloRadius");
%legend


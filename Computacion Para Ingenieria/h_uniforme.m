function h_uniforme(n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
aleatorios = rand(n,1);
hist(aleatorios,100);
title(sprintf('Histogram of %d uniform random numbers',n));
sum = 0;
sum2 = 0;
for i = 1:n
    sum = sum + aleatorios(i);
    sum2 = sum2 + aleatorios(i) * aleatorios(i);
end
average = sum/n;
average2 = sum2/n;
sigma = sqrt(average2 -average*average);
disp(sprintf("promedio %f",average));
disp(sprintf("sigma %f", sigma));


end
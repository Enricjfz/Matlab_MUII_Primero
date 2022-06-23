%codigo de pruebas de Bezier

clear all
t=0:0.01:1;n=size(t,2);X=zeros(n,2);
P=[1 1;2 3; 4 3;3 1];         % Puntos de control en 2D
P2=[1.5 1.2;1 1;2 3;2.2 1.8;2.6 1.8; 4 3;3 1;2.5 1.2]; % Puntos de control 2D
for k=1:n
X(k,:)=Bezier(P2,t(k));
end
subplot(131),plot(X(:,1),X(:,2),'b.')   % Poligono de control (rojo)
hold on
subplot(131),plot(P2(:,1),P2(:,2),'--ro')  % Curva de Bezier (azul)
title('Poligono de control (rojo) y curva de Bezier (azul) en 2D')


%{
% Curva 3: Puntos de control en 3D
clear 
t=0:0.001:1;n=size(t,2);X=zeros(n,3);i=0:0.5:5*pi;P=[sin(i);cos(i);i]';     
for k=1:n
X(k,:)=Bezier(P,t(k));
end
subplot(133),plot3(X(:,1),X(:,2),X(:,3),'b.')   
hold on
subplot(133),plot3(P(:,1),P(:,2),P(:,3),'--ro') 
title('Poligono de control (rojo) y curva de Bezier (azul) en 3D')
%}

%ejercicio 3 individual tema 1

P=NaN(2,5,3);
P(1,1,:)=[0.0 0.0 0.5];  
P(2,1,:)=[1.0 0.0 -0.5];
P(1,2,:)=[0.0 1.0 -0.5];
P(2,2,:)=[1.0 1.0 0.5]; 
P(1,3,:)=[0.0 2.0 0.5];
P(2,3,:)=[1.0 2.0 -0.5];
P(1,4,:)=[0.0 3.0 -0.5];
P(2,4,:)=[1.0 3.0 0.5]; 
P(1,5,:)=[0.0 4.0 0.5];
P(2,5,:)=[1.0 4.0 -0.5];
Q1=NaN(5,3); %Primera fila de puntos de control
Q1(:,:)=squeeze(P(1,:,:));
Q2 = NaN(5,3); %Segunda fila de puntos de control
Q2(:,:) = squeeze(P(2,:,:));


%apartado c y d
t=0:0.001:1;
n=size(t,2);
X1=zeros(n,3);
X2 = zeros(n,3);
X3 = zeros(n,3);
X4 = zeros(n,3);
Q3 = [0 0 0.5; 0 -1 1.5; 1 -1 -1.5; 1 0 -0.5];
Q4 = [0 4 0.5; 0 5 1.5; 1 5 -1.5; 1 4 -0.5];

for k=1:n
X1(k,:)=Bezier(Q1,t(k));
X2(k,:)=Bezier(Q2,t(k));
X3(k,:)=Bezier(Q3,t(k));
X4(k,:)=Bezier(Q4,t(k));
end
plot3(Q1(:,1),Q1(:,2),Q1(:,3),'ro--');
hold on % Polígono de control (rojo)
plot3(X1(:,1),X1(:,2),X1(:,3),'b.')
hold on
plot3(X2(:,1),X2(:,2),X2(:,3),'b.')
hold on
plot3(Q2(:,1),Q2(:,2),Q2(:,3), 'ro--');
hold on
plot3(X3(:,1),X3(:,2),X3(:,3), 'g.');
hold on
plot3(X4(:,1),X4(:,2),X4(:,3), 'y.');
hold on


%{
P1 = [0 0 0.5; 0 1 -0.5; 0 2 0.5; 0 3 -0.5; 0 4 0.5; 1 0 -0.5; 1 1 0.5; 1 2 -0.5; 1 3 0.5; 1 4 -0.5;0 0 0.5];
P2 = [0 0 0.5; 0 1 -0.5; 0 2 0.5; 0 3 -0.5; 0 4 0.5; 1 0 -0.5; 1 1 0.5; 1 2 -0.5; 1 3 0.5; 1 4 -0.5;0, -1.0, 1.5;0 0 0.5];
t=0:0.001:1;
n=size(t,2);
X1=zeros(n,3);
for k=1:n
X1(k,:)=Bezier(P2,t(k));
end
plot3(Q1(:,1),Q1(:,2),Q1(:,3),'ro--',Q2(:,1),Q2(:,2),Q2(:,3),'ro--');
hold on
plot3(X1(:,1),X1(:,2),X1(:,3),'b.')
hold on

%}

%apartado 2 practica tema 1

clear all
P(1,:)=[0,4]; %P1
P(2,:)=[2,4];
P(3,:)=[2,6];
P(4,:)=[2,8]; %P4
P(5,:)=[0,8];
P(6,:)=[-2,8];
P(7,:)=[-2,6];
P(8,:)=[-2,4]; %P8
p = 3;
U = [0 0 0 0 0.167 0.333 0.5 0.666 0.833 1 1 1 1];
P_c = [P(1,:);P(2,:);P(3,:);P(4,:);P(5,:);P(6,:);P(7,:);P(8,:);P(1,:)];
u = 0:0.01:1;
Q = NaN(size(u,2),2);
for i = 1:size(u,2)
    Q(i,:) = Boor(P_c,p,U,u(i));
end


P_c2 = P_c;
P_c2(4,:) = [4,10];
Q2 = NaN(size(u,2),2);
for j = 1:size(u,2)
    Q2(j,:) = Boor(P_c2,p,U,u(j));
end
plot(P(:,1),P(:,2),'ro--');
hold on
plot(Q(:,1),Q(:,2),'b.');
hold on
plot(Q2(:,1),Q2(:,2),'b.')
hold on
plot(P_c2(:,1),P_c2(:,2),'ro--')
%}

%{
%apartado b
clear all
P(1,:)=[0,4]; %P1
P(2,:)=[2,4];
P(3,:)=[2,6];
P(4,:)=[4,10]; %P4
P(5,:)=[0,8];
P(6,:)=[-2,8];
P(7,:)=[-2,6];
P(8,:)=[-2,4]; %P8
p = 3;
U = [0 0 0 0 0.142 0.285 0.428 0.571 0.714 0.857 1 1 1 1];
P_c = [P(1,:);P(2,:);P(3,:);P(4,:);P(4,:);P(5,:);P(6,:);P(7,:);P(8,:);P(1,:)];
u = 0:0.01:1;
Q = NaN(size(u,2),2);
for i = 1:size(u,2)
    Q(i,:) = Boor(P_c,p,U,u(i));
end

P_c2 =  [P(1,:);P(2,:);P(3,:);P(4,:);P(4,:);P(4,:);P(5,:);P(6,:);P(7,:);P(8,:);P(1,:)];
U2 = [0 0 0 0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1 1 1 1];
Q2 = NaN(size(u,2),2);
for i = 1:size(u,2)
    Q2(i,:) = Boor(P_c2,p,U2,u(i));
end

plot(P_c(:,1),P_c(:,2),'ro--');
hold on
plot(P_c2(:,1),P_c2(:,2),'ro--');
hold on
plot(Q(:,1),Q(:,2),'b.');
hold on
plot(Q2(:,1),Q2(:,2),'g.'); % en verde la nueva curva cúbica
%}

%{
%apartado c
clear all
alfa=0:pi/4:2*pi;
P(1,:,:)=[0,4,0]; %P1
P(2,:,:)=[2,4,0];
P(3,:,:)=[2,6,0];
P(4,:,:)=[4,10,0]; %P4
P(5,:,:)=[0,8,0];
P(6,:,:)=[-2,8,0];
P(7,:,:)=[-2,6,0];
P(8,:,:)=[-2,4,0]; %P8
P_c = [P(1,:);P(2,:);P(3,:);P(4,:);P(4,:);P(4,:);P(5,:);P(6,:);P(7,:);P(8,:);P(1,:)];
Q = NaN(9,11,3);
U2 = [0 0 0 0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1 1 1 1];
u = 0:0.01:1;
p = 3;
W = NaN(9,size(u,2),3);
for i = 1:9
    Q(i,:,:) = P_c * [1 0 0; 0 cos(alfa(i)) sin(alfa(i)); 0 -sin(alfa(i)) cos(alfa(i))];
    for j = 1:size(u,2)
      W(i,j,:) = Boor(squeeze(Q(i,:,:)),p,U2,u(j));
    end
end


for i = 1:9
    plot3(squeeze(Q(i,:,1)),squeeze(Q(i,:,2)),squeeze(Q(i,:,3)),'ro--');
    hold on
    plot3(squeeze(W(i,:,1)),squeeze(W(i,:,2)),squeeze(W(i,:,3)),'b.');
    hold on
end
%}


%apartado d

clear all
alfa=0:pi/4:2*pi;
P(1,:,:)=[0,4,0]; %P1
P(2,:,:)=[2,4,0];
P(3,:,:)=[2,6,0];
P(4,:,:)=[4,10,0]; %P4
P(5,:,:)=[0,8,0];
P(6,:,:)=[-2,8,0];
P(7,:,:)=[-2,6,0];
P(8,:,:)=[-2,4,0]; %P8
P_c = [P(1,:);P(2,:);P(3,:);P(4,:);P(4,:);P(4,:);P(5,:);P(6,:);P(7,:);P(8,:);P(1,:)];
Q = NaN(9,11,3);
U = [0 0 0 0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1 1 1 1];
u = 0:0.01:1;
p = 3;
W = NaN(9,3);
for i = 1:9
    Q(i,:,:) = P_c * [1 0 0; 0 cos(alfa(i)) sin(alfa(i)); 0 -sin(alfa(i)) cos(alfa(i))];
end

v = 0:0.01:1;
q = 3;
V = [0 0 0 0 0.166 0.333 0.5 0.666 0.833 1 1 1 1];
S = NaN(size(u,2),size(v,2),3);
for i = 1:size(v,2)
    for j = 1:size(u,2)
        for n = 1:9
            W(n,:) = Boor(squeeze(Q(n,:,:)),p,U,u(j));
        end
         S(i,j,:) = Boor(W,q,V,v(i));
    end
end

for i = 1:9
    plot3(squeeze(Q(i,:,1)),squeeze(Q(i,:,2)),squeeze(Q(i,:,3)),'ro--');
    hold on
end
surf(S(:,:,1),S(:,:,2),S(:,:,3));
%plot3(S(:,:,1),S(:,:,2),S(:,:,3),'b.');
%}



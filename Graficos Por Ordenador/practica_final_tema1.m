clear all
alfa=0:pi/4:2*pi;
U = [0 0 0 0 0.055 0.111 0.166 0.222 0.277 0.333 0.388 0.444 0.5 0.555 0.611 0.666 0.722 0.777 0.833 0.888 0.944 1 1 1 1];
P(1,:,:)=[1,0,0]; %P1
P(2,:,:)=[0,2,0];
P(3,:,:)=[0,6,0];
P(4,:,:)=[1,8,0];
P(5,:,:)=[4,8,0]; %P4
P(6,:,:)=[5,6,0];
P(7,:,:)=[5,2,0];
P(8,:,:)=[4,0,0];
P(9,:,:)=[4,-1,0]; 
P(10,:,:)=[4,-12,0]; 
P(11,:,:)=[4,-13,0]; 
P(12,:,:)=[5,-15,0]; 
P(13,:,:)=[5,-19,0]; 
P(14,:,:)=[4,-21,0]; 
P(15,:,:)=[1,-21,0]; 
P(16,:,:)=[0,-19,0]; %P16
P(17,:,:)=[0,-15,0]; 
P(18,:,:)=[1,-13,0];
P(19,:,:)=[1,-12,0];
P(20,:,:)=[1,-1,0]; 
P(21,:,:)=[1,0,0]; %P21


Q = NaN(9,21,3);
%U = [0 0 0 0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1 1 1 1];
u = 0:0.01:1;
p = 3;
W = NaN(9,3);
for i = 1:9
    Q(i,:,:) = squeeze(P(:,1,:)) * [1 0 0; 0 cos(alfa(i)) sin(alfa(i)); 0 -sin(alfa(i)) cos(alfa(i))];
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
        if i ~= size(v,2)
            S(i,j,:) = Boor(W,q,V,v(i));
        else
            S(i,j,:) = S(1,j,:);
        end
    end
end

for i = 1:9
    plot3(squeeze(Q(i,:,1)),squeeze(Q(i,:,2)),squeeze(Q(i,:,3)),'ro--');
    hold on
end
surf(S(:,:,1),S(:,:,2),S(:,:,3));
%plot3(S(:,:,1),S(:,:,2),S(:,:,3),'b.');


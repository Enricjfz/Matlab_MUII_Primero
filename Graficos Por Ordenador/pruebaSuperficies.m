P=zeros(7,5,3);
for k=1:7 
    for l=1:5 
        P(k,l,:)=[k-1 l-1 mod(k+l,2)-0.5]; 
    end 
end
P(4,3,:) = [3, 2, 0.75];
p = 3;
q = 2;
%U = [0 0 0 0 0.5 0.5 0.5 1 1 1 1];
%V = [0 0 0 0.5 0.6 1 1 1];
U = [0 0 0 0 0.2 0.2 0.2 1 1 1 1];
V = [0 0 0 0.6 0.6 1 1 1];
u = 0:0.01:1;
v = 0:0.01:1;
X = NaN(7,3);
Y = NaN(5,3);
Z = NaN(1,3);
Y = squeeze(P(1,:,:));
X = squeeze(P(:,1,:));
Z = squeeze(P(end,:,:));
K = NaN(7,3);
K = squeeze(P(:,end,:));
W = NaN(size(u,2),size(u,2),3);
%W = NaN(3,size(u,2),3);
Q = NaN(5,3);
for i = 1:size(u,2)
    for j = 1:size(v,2)
        for n = 0:size(Y,1)-1
          Q(n+1,:) = Boor(squeeze(P(:,n+1,:)), p, U, u(j)); %Q is a 5x3 matrix and P is a 7x3 matrix
        end
        W(i,j,:) = Boor(Q,q,V,v(i));
    end
end


surf(W(:,:,1),W(:,:,2),W(:,:,3));
hold on
%plot3(W(51,:,1),W(51,:,2),W(51,:,3),'--b.');
%hold on
plot3(W(:,51,1),W(:,51,2),W(:,51,3),'--b.');
hold on
plot3(squeeze(P(4,:,1)),squeeze(P(4,:,2)),squeeze(P(4,:,3)),'go--');
hold on
plot3(Z(:,1),Z(:,2),Z(:,3),'--ro',Y(:,1),Y(:,2),Y(:,3),'--ro');
hold on
plot3(X(:,1),X(:,2),X(:,3),'--ro',K(:,1),K(:,2),K(:,3),'--ro');



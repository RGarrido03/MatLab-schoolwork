clear all
close all
clc

% a)
comp = 10;
V1(1,:) = 1:comp;
V1(2,:) = 0;


% b)
V2(1,:) = V1(1,:) + 0.5;
V2(2,:) = 0.5;


% c)
Z = zeros(2,2*comp); % Inicialização da matriz / do array
for i = 1:10
    impar = 2*(i-1)+1;
    par = 2*i;
    Z(:,impar) = V1(:,i);
    Z(:,par) = V2(:,i);
end


% d)
figure(1)
plot(Z(1,:),Z(2,:),'k-')
hold on
plot(Z(1,end),Z(2,end),'k.','MarkerSize',100)
hold off
axis equal


% e)
a = 2; T = 10;
t0 = 0; dt = 0.1; tmax = 60;
figure(2)
for t = t0:dt:tmax
    dx = 1+(a/comp) * cos(2*pi*t/T);
    M = [dx,0;0,1];
    Z = M * Z;
    plot(Z(1,:),Z(2,:),'k-')
    xlim([0 comp+2*a])
    pause(0.05)
end
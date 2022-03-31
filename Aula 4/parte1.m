% Tragam-me saúde, porque estas aulas matam-me 🥲

clear all
close all
clc

n = 4;
theta = 2*pi/n;
M = [cos(theta),sin(theta);-sin(theta),cos(theta)];
v = [1;1];

for i=1:n
    v(:,i+1) = M*v(:,i);
end

figure(1)
plot(v(1,:),v(2,:),'k-') % Polígono original
axis equal

% Translação
v0 = v;
u = ones(2,n+1);
u(1,:) = u(1,:)*3;
u(2,:) = u(2,:)*2;

v = v0 + u;
hold on
plot(v(1,:),v(2,:),'r-') % Polígono translacionado

% Rotação
theta = pi/4;
M = [cos(theta),sin(theta);-sin(theta),cos(theta)];
v = M * v0 + u;
plot(v(1,:),v(2,:),'g-') % Polígono translacionado e rodado

% Redução
M_amp = [0.5,0;0,0.5];
v = M_amp * v0 + u;
plot(v(1,:),v(2,:),'b-') % Polígono translacionado, rodado e reduzido
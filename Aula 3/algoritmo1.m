clear all
close all
clc

%% a)
n = 5;
theta = 2*pi/n;
mrot = [cos(theta),sin(theta);-sin(theta),cos(theta)];

v = zeros(2,n); % cria uma matriz com duas linhas e n colunas, preenchida com zeros.
v(:,1) = [1;0];

for i = 2:n
    v(:,i) = mrot*v(:,i-1);
end

v(:,n+1) = v(:,1);

figure(1)
plot(v(1,:),v(2,:), "r-")
hold on
plot(v(1,:),v(2,:), "ro")
axis equal
hold off


%% b)
th_t = pi/4; % ângulo de translação
% definir o vetor translação
t = [];
t(1,:) = 3*cos(th_t);
t(2,:) = 3*sin(th_t);

v1 = v + t;
v2 = v + 2*t;
v3 = v + 3*t;
v4 = v + 4*t;

figure(2)
plot(v(1,:), v(2,:), "r-",v1(1,:), v1(2,:), "r-",v2(1,:), v2(2,:), "r-",v3(1,:), v3(2,:), "r-",v4(1,:), v4(2,:), "r-")
axis equal
text(10,1,"b)")


%% c)
theta = pi/6;
clear v1 v2 v3 v4
v1 = mrot*v + t;
v2 = mrot^2*v + 2*t; % é necessário o ^2 para que rode face ao anterior.
v3 = mrot^3*v + 3*t;
v4 = mrot^4*v + 4*t;

figure(3)
plot(v(1,:), v(2,:), "r-", v1(1,:), v1(2,:), "r-", v2(1,:), v2(2,:), "r-", v3(1,:), v3(2,:), "r-", v4(1,:), v4(2,:), "r-")
hold on

% Para melhor visualização do exercício, uma vez que o polígono é regular. Desenha cada vértice.
plot(v(1,1), v(2,1), "bo", v1(1,1), v1(2,1), "bo", v2(1,1), v2(2,1), "bo", v3(1,1), v3(2,1), "bo", v4(1,1), v4(2,1), "bo")
axis equal
text(10,1,"c)")


%% e)
% Deve-se limpar as variáveis ou então correr esta secção à parte.

n = 6;
theta = 2*pi/n;
mrot = [cos(theta),sin(theta);-sin(theta),cos(theta)];

v = zeros(2,n); % cria uma matriz com duas linhas e n colunas, preenchida com zeros.
v(:,1) = [1;0];

for i = 2:n
    v(:,i) = mrot*v(:,i-1);
end

v(:,n+1) = v(:,1);

% figure(5)
% plot(v(1,:),v(2,:), "r-")
% hold on
% plot(v(1,:),v(2,:), "ro")
% axis equal
% hold off

T0 = 1;
w0 = 2*pi/T0; % Rotação em torno da origem

T1 = 0.5;
w1 = 2*pi/T1; % Rotação em torno dele próprio

R = 2;
r0 = [R;0]; % Ponto em que o polígono vai começar a rodar

figure(4)

for t = 0:T0/100:10*T0
    th0 = w0*t;
    m0 = [cos(th0),sin(th0);-sin(th0),cos(th0)];
    r = m0 * r0;

    th1 = w1*t;
    m1 = [cos(th1),sin(th1);-sin(th1),cos(th1)];
    v1 = m1 * v + r;

    plot(v(1,:), v(2,:), "r-")
    theta = 0:0.01:2*pi;
    x = R*cos(theta);
    y = R*sin(theta);
    hold on
    plot(x,y,"k")
    axis equal
    % Incompleto.
end
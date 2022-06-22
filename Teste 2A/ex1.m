clear all
close all
clc

%% Alínea a)
% Ver função distancia.



%% Alínea b)
R1 = 0.5; % cm
R2 = 1; % cm
t = 0;
dist = distancia(t);

while dist > R1+R2
    t = t + 0.01;
    dist = distancia(t);
end



%% Alínea c)
t_col = t;
m1 = 0.125; % g
m2 = 0.5; % g

r1_0 = [-2;0.5]; % cm
v1_0 = [1;0]; % cm/s
a1 = [1;0]; % cm/s^2
v1_antes = v1_0 + a1 * t_col;
r1_antes = r1_0 + v1_0*t_col + 0.5*a1*t_col.^2;

v2_0 = [0;0];
v2_antes = v2_0; % Está em repouso
r2_antes = [0;0];

v_12 = v1_antes - v2_antes;
r_12 = r1_antes - r2_antes;

v_col_1 = v1_antes - (2*m2/(m1+m2))*v_12;
v_col_2 = v2_antes + (2*m1/(m1+m2))*v_12;



%% Alínea d)
figure(1)
for t = 0:0.01:3*t_col
    if t < t_col
        r1 = r1_0 + v1_0*t + 0.5*a1*t.^2;
        r2 = [0;0];
    else
        r1 = r1_antes + v_col_1*(t-t_col);
        r2 = r2_antes + v_col_2*(t-t_col);
    end
    plot(r1(1),r1(2),'ko',r2(1),r2(2),'bo','MarkerSize',95)
    axis equal
    axis([-3,2,-2,2])
    drawnow
end


%% Funções
function dist = distancia(t)
r1_0 = [-2;0.5]; % cm
v1_0 = [1;0]; % cm/s
a1 = [1;0]; % cm/s^2
r2_0 = [0;0]; % em repouso está na origem

r1 = r1_0 + v1_0*t + 0.5*a1*t.^2;
r2 = r2_0;


dist = sqrt((r2-r1(1)).^2 + (r2-r1(2)).^2);
end
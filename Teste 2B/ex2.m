clear all
close all
clc

%% a)
% Ver função no fim do script.



%% b)
[r_end,v_end] = velocity_verlet(1.01606,6.1788,1.2);



%% c)
i = 0;
t = 0.01:0.01:1;
for ti = t
    i = i+1;
    [r_t(i),v_t(i)] = velocity_verlet(1.01606,6.1788,ti);
end

% Cálculo da derivada da velocidade
dv_dt(1) = 0;
for a = 2:i-1
    dv_dt(a) = (v_t(a+1)-v_t(a-1))/2*0.01;
end

% Plot
figure(1)
plot(t,r_t,'k-',t,v_t,'b-')
figure(2)
plot(t(1:end-1),dv_dt,'k-')



%% d)
for i = 2:length(v_t)
    if abs(v_t(i)) > abs(v_t(i-1)) % Presumo que seja em módulo, já que o sinal apenas indica o sentido
        v_max = v_t(i);
        r_correspondente = r_t(i);
        t_correspondente = t(i);
    end
end



%% Fúnxones
function [r_end,v_end] = velocity_verlet(x0,vy0,tmax) % Alínea a)
r0 = [x0;0];
v0 = [0;vy0];
dt = 0.0001;
t = 0;
r(1,:) = r0;
v(1,:) = v0;
i = 1;

while t < tmax
    i = i + 1;
    t = t + dt;
    r(i) = r(i-1) + v(i-1)*dt + 0.5*dt.^2*(-39.4644978/r(i-1));
    v(i) = v(i-1) + 0.5*dt*(-39.4644978/r(i-1) - 39.4644978/r(i));
end
r_end = r(:,end);
v_end = v(:,end);
end
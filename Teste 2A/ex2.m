% ALGO ESTÁ ERRADO NISTO!
clear all
close all
clc

%% Alínea a)
m = 1; % kg
v0 = 0;
h0 = 10;
g = -10;
b = 0.1;

[h(1),v(1),t(1)] = euler_cromer(h0,v0,g,0,b,1000);
prec = 1e-4;

i = 1;
while h > prec
    i = i+1;
    [h(i),v(i),t(i)] = euler_cromer(h(i-1),v(i-1),g,t(i-1),b,1000);
end



%% Alínea b)
h_exato = h0 - (m*g/b)*t + (m*v0/b + m.^2*g/b.^2) * (1-exp((-b/m)*t));
figure(1)
plot(t,h,'k-',t,h_exato,'b-')



%% Alínea c)
h_exato_1 = h0 - m*g/b + (m*v0/b + m.^2*g/b.^2) * (1-exp(-b/m));
erro_10 = h_exato_1 - euler_cromer(h0,v0,g,1,b,10);
erro_100 = h_exato_1 - euler_cromer(h0,v0,g,1,b,100);
erro_1000 = h_exato_1 - euler_cromer(h0,v0,g,1,b,1000);
figure(2)
plot(10,erro_10,'ko',100,erro_100,'ko',1000,erro_1000,'ko')



%% Função
function [h,v,t] = euler_cromer(h0,v0,g,t,b,n)
dt = 1/n;
t = t + dt;
res_ar = -b * v0;
a = g + res_ar;
v = v0 + dt * a;
h = h0 + dt * v;
end
clear all
close all
clc

v0 = 0.1;
inicial = [0;0];
tmax = 60;
dt = 1;
x0 = 0;
tx = 0:dt:tmax;
x = x0 + v0 * tx;
t = 0;
i = 1;

plot(tx, x, 'k')

while t < tmax
    t = t + dt;
    i = i+1;
    xb(i) = x0 + v0*t;
    plot(tx,x,t,xb(i),"ro","MarkerFaceColor","r")
    xlabel('t(s)'); ylabel('x(m)')
    axis([0 60 0 6])
    drawnow
end

while t > 0
    t = t - dt;
    i = i+1;
    xb(i) = x0 + v0*t;
    plot(tx,x,t,xb(i),"ro","MarkerFaceColor","r")
    xlabel('t(s)'); ylabel('x(m)')
    axis([0 60 0 6])
    drawnow
end
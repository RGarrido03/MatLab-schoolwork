clear all
close all
clc

% d)
n = 7;
theta = 2*pi/n;
mrot = [cos(theta),sin(theta);-sin(theta),cos(theta)];
l = [2;0];
xa = 5;
ya = 5;
xs = xa;
ys = ya;

for i=2:n
    l(:,i) = mrot*l(:,i-1);
    xa = xa + l(1,i-1);
    ya = ya + l(2,i-1);
    xs = [xs,xa];
    ys = [ys,ya];
end

figure(1)
quiver(xs,ys,l(1,:),l(2,:), "k")
axis equal



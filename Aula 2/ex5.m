clear all
close all
clc

raio = 2;
teta = 0:0.01:2*pi;
centro = [1 0];

x = raio * cos(teta) + centro(1);
y = raio * sin(teta) + centro(2);

T = 3;
w = 2*pi/T;

for t = 0:0.05:10
    xb = raio * cos(w*t) + centro(1);
    yb = raio * sin(w*t) + centro(2);
    vx = -w * raio * sin(w*t);
    vy = w * raio * cos(w*t);
    ax = -w * w * raio * cos(w*t);
    ay = -w * w * raio * sin(w*t);
    plot(x,y,'--k',xb,yb,'ro','MarkerFaceColor','r') % O Marker Face Color é usado para "pintar" a bola
    hold on
    quiver([xb;xb], [yb;yb], [vx;ax], [vy;ay],0.2,'g')
    hold off
    xlim([-2 4])
    ylim([-3 3])
    axis equal
    drawnow
end
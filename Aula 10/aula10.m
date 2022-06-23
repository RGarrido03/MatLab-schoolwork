% Dúvidas não serão respondidas porque também eu não sei.
% Obrigado,
% A gerência.

% Este código está como a minha vida. Cheio de erros.

clear
close all
clc

% Posição inicial da bola
x0 = 0.5;
y0 = 10;
v0x = 0;
v0y = 0;
g = 9.8;

% Superfície
alfa = 2;
ti = 0;
t0 = 0.5;
prec = 1e-10;
lambda = 0.01;

tf = pfixo(x0,y0,v0x,v0y,alfa,g,lambda,prec,t0);

nc = 20;
for i = 1:nc
    for t = ti:0.01:tf
        x = x0 + v0x * t;
        y = y0 + v0y * t - 0.5 * g * t.^2;
        vx = v0x;
        vy = v0y - g * t;
        super(alfa,x,y)
        % Isto não está a parar e nem a stora tem o código bem, portanto que se foda.
    end
    grad = [2 * alfa * x - 4 * x.^3, 1];
    grad = grad/norm(grad); % Vetor normal
    hold on
    quiver(x,y,grad(1),grad(2),0,'b');
    v = [vx,vy];
    nv = norm(v);
    quiver(x,y,vx/nv,vy/nv,0,'r')
end


function super(alfa,x,y)
xs = -2:0.01:2;
ys = -alfa * xs.^2 + xs.^4 + 6;
figure(1)
plot(xs,ys,'b-',x,y,'ro')
axis([min(xs) max(xs) min(ys) max(ys)])
axis off
axis square
drawnow
hold on
end

function [dy,der] = dist(x0,y0,v0x,v0y,alfa,t,g)
x = x0 + v0x * t;
dy = y0 + v0y * t - 0.5 * g * t.^2 + alfa * x.^2 - x.^4 -6;
der = v0y - g * t + 2 * alfa * x * v0x - 4 * x.^3 * v0x;
end

% Eu a partir daqui já desisti.
function tn = pfixo(x0,y0,v0x,v0y,alfa,g,lambda,prec,t0)
[dy1,der] = dist(x0,y0,v0x,v0y,alfa,t0,g);
tn = t0 - lambda * dy1;
[dy2,der] = dist(x0,y0,v0x,v0y,alfa,tn,g);
dy = dy2;

if (abs(dy1) < abs(dy2))
    lambda = -lambda;
    dy = dy1;
    tn = t0;
end

ni = 0;
while(abs(lambda*dy)>prec && ni<100000)
    ni = ni + 1;
    [dy2,der] = dist(x0,y0,v0x,v0y,alfa,tn,g);
    tn = tn - lambda * dy;
end
end

function tn = newton(x0,y0,v0x,v0y,alfa,tn,g)
ni = 0;
dy = 10000;
der = 1;
while(abs(lambda*dy)>prec && ni<100000)
    [dy,der] = dist(x0,y0,v0x,v0y,alfa,t,g);
    tn = tn - dy/der;
end
end
clear all
close all
clc

s0 = 'F++F++F';
sF = 'F-F++F-F';
teta = pi/3;
mrot = [cos(teta),-sin(teta);sin(teta),cos(teta)];
niter = 10;
n = length(s0);

for ni = 1:niter
    s = [];
    for i = 1:n
        if s0(i) == 'F'
            s = [s sF];
        else
            s = [s s0(i)];
        end
    end
    s0 = s;
    n = length(s);

    % fazer o desenho
    aresta = [0;1];
    v = [0;0];
    for i = 1:n
        if s0(i) == 'F'
            novoponto = [v(1,end);v(2,end)]+aresta;
            v = [v,novoponto];
        elseif s0(i) == '+'
            aresta = mrot * aresta;
        elseif s0(i) == '-'
            aresta = mrot'*aresta;
        end
    end
    plot(v(1,:),v(2,:),'k-')
    axis equal
    drawnow
    axis off
end
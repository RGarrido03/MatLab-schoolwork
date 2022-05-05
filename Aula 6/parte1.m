clear all
close all
clc

nmax = 1000;

for R = 3.9
    x0 = 0.4;
    x(1) = x0;
    for n = 1:nmax
        x(n+1) = f(x(n),R);
    end
    np = 100;
    figure(1)
    plot(nmax-(np-1):nmax,x(nmax-(np-1):nmax),'-k')
    ylim([0,1])
    hold on
    xlabel('n')
    ylabel('x')

    figure(2)
    plot(R*ones(1,np),x(nmax-(np-1):nmax),'.k')
    hold on
    xlabel('R')
    ylabel('x')
    

    x0 = 0.4001;
    x(1) = x0;
    for n = 1:nmax
        x(n+1) = f(x(n),R);
    end
    np = 100;
    figure(1)
    plot(nmax-(np-1):nmax,x(nmax-(np-1):nmax),'-b')
    hold on
    ylim([0,1])
    xlabel('n')
    ylabel('x')

    figure(2)
    plot(R*ones(1,np),x(nmax-(np-1):nmax),'.b')
    hold on
    xlabel('R')
    ylabel('x')
    drawnow
end

function x = f(x,R)
    x = R*x*(1-x);
end
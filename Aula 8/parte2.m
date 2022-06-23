clear all
close all
clc
nmax = 1000;

for R = 3.5
    x0 = 0.4;
    x(1) = x0;
    for n = 1:nmax
        x(n+1) = f(f(x(n),R),R);
    end
    np = 100;
    figure(1)
    plot(nmax-(np-1):nmax,x(nmax-(np-1):nmax),'-k')
    hold on
    ylim([0,1])
    xlabel('n')
    ylabel('x')

    figure(2)
    plot(R*ones(1,np),x(nmax-(np-1):nmax),'.k')
    hold on
    xlabel('R')
    ylabel('x')
    drawnow

    x0 = 0.5;
    x(1) = x0;
    for n = 1:nmax
        x(n+1) = f(f(x(n),R),R);
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

%% Segunda parte

clear all
close all
clc
nmax = 1000;

for R = 2.5:0.01:3.9
    x0 = 0.4;
    x(1) = x0;
    for n = 1:nmax
        x(n+1) = f(f(x(n),R),R);
    end
    np = 100;
    figure(1)
    plot(nmax-(np-1):nmax,x(nmax-(np-1):nmax),'-r')
    %hold on
    ylim([0,1])
    xlabel('n')
    ylabel('x')

    figure(2)
    plot(R*ones(1,np),x(nmax-(np-1):nmax),'.r')
    hold on
    xlabel('R')
    ylabel('x')

    x2(1) = x0;
    for n = 1:nmax
        x2(n+1) = f(x2(n),R);
    end
    np = 100;
    figure(1)
    plot(nmax-(np-1):nmax,x2(nmax-(np-1):nmax),'-b')
    %hold on
    ylim([0,1])
    xlabel('n')
    ylabel('x2')

    figure(2)
    plot(R*ones(1,np),x2(nmax-(np-1):nmax),'.b')
    hold on
    xlabel('R')
    ylabel('x2')
    drawnow
end

function x = f(x,R)
    x = R*x*(1-x);
end
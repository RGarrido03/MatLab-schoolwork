clear all
close all
clc

m = 1;
k = 1;
L = 1;
Mc = 100;
a = 0.1;

dt = 0.05;
npassos = 1000;
t = (0:npassos-1)*dt;

x1 = zeros(npassos,1);
v1 = x1;
x2 = x1; v2 = x1;
xc = x1; vc = x1;
Em = x1;
Em1 = x1; Em2 = x1;

% 1º modo
xc(1) = 0;
vc(1) = 0;
x1(1) = L + 0.3;
v1(1) = 0;
x2(1) = 2*L - 0.3;
v2(1) = 0;

% Energia mecânica total do sistema
Em(1) = 0.5*m*(v1(1)^2+v2(1)^2) + 0.5*Mc*(vc(1)^2)...
    + 0.5*k*((x1(1)-xc(1)-L)^2 + (2*L+xc(1)-x2(1))^2 + (x2(1)-x1(1)-L)^2);

% Energia mecânica para as esferas
Em1(1) = 0.5*m*v1(1)^2 + 0.5*k*((x1(1)-xc(1)-L)^2 + 0.5*(x2(1)-x1(1)-L)^2);
Em2(1) = 0.5*m*v2(1)^2 + 0.5*k*(0.5*(x2(1)-x1(1)-L)^2 + (2*L+xc(1)-x2(1))^2);

for n = 1:npassos-1
    v1(n+1) = v1(n) + dt*(k/m)*(-2*x1(n)+x2(n)+xc(n));
    x1(n+1) = x1(n) + dt*v1(n+1);

    v2(n+1) = v2(n) + dt*(k/m)*(x1(n)-2*x2(n)+xc(n)+3*L);
    x2(n+1) = x2(n) + dt*v2(n+1);

    vc(n+1) = vc(n) + dt*(k/Mc)*(x1(n)+x2(n)-2*xc(n)+3*L)-dt*(a/Mc)*vc(n);
    xc(n+1) = xc(n) + dt*vc(n+1);

    % Energia mecânica ao longo do tempo
    Em(n+1) = 0.5*m*(v1(n+1)^2+v2(n+1)^2) + 0.5*Mc*(vc(n+1)^2)...
    + 0.5*k*((x1(n+1)-xc(n+1)-L)^2 + (2*L+xc(n+1)-x2(n+1))^2 + (x2(n+1)-x1(n+1)-L)^2);

    % Energia mecânica para as esferas
    Em1(n+1) = 0.5*m*v1(n+1)^2 + 0.5*k*((x1(n+1)-xc(n+1)-L)^2 + 0.5*(x2(n+1)-x1(n+1)-L)^2);
    Em2(n+1) = 0.5*m*v2(n+1)^2 + 0.5*k*(0.5*(x2(n+1)-x1(n+1)-L)^2 + (2*L+xc(n+1)-x2(n+1))^2);

    % GRÁ(AAAAAAAAAAAA)FICO
    caixa = [xc(n+1),1; xc(n+1),0; xc(n+1)+3*L,0; xc(n+1)+3*L,1];
    fio1 = [xc(n+1),0.5; x1(n+1),0.5];
    fio2 = [x1(n+1),0.5; x2(n+1),0.5];
    fio3 = [x2(n+1),0.5; xc(n+1)+3*L,0.5];
    figure(1)
    plot(caixa(:,1),caixa(:,2),'-k',fio1(:,1),fio1(:,2),'r-',fio2(:,1),fio2(:,2),'r-',fio3(:,1),fio3(:,2),'r-')
    hold on
    plot(x1(n+1),0.5,'b.','MarkerSize',40)
    plot(x2(n+1),0.5,'b.','MarkerSize',40)
    axis equal
    axis([-L,4*L,-0.1,2])
    hold off
end

% Posição das esferas e da caixa, em função do tempo
figure(2)
plot(t(1:n+1),xc(1:n+1),'r',t(1:n+1),x1(1:n+1),'k',t(1:n+1),x2(1:n+1),'b')

% Energia mecânica, em função do tempo
figure(3)
plot(t(1:n+1),Em(1:n+1),'k-')
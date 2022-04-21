clear all
close all
clc

teta = pi/4;
A1 = [cos(teta),-sin(teta);sin(teta),cos(teta)]/sqrt(2); B1 = [0;0];
A2 = [cos(pi-teta),-sin(pi-teta);sin(pi-teta),cos(pi-teta)]/sqrt(2); B2 = [1;0];

r0 = [0;0];
N = 10000;
m = zeros(2,N);
m(:,1) = r0; % Neste caso particular, este passo é redundante, uma vez que r0 é uma matriz de zeros.

for niter = 1:N-1 % N-1 para serem só 10000 pontos (e não 10001), já que a relação é r_(n+1) = A * r_n + b.
    x = rand(1);
    if x < 0.5
        A = A1; B = B1;
    else
        A = A2; B = B2;
    end
    m(:,niter+1) = A * m(:,niter) + B;
end
plot(m(1,:),m(2,:),'k.')
axis equal
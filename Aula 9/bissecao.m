clear all
close all
clc

m = 1;
d0 = 0.4;
v1_0 = 1.7;
x1_0 = 0;

k = 1;
L = 12;
Lm = 4;
A_0 = 1;
phi_0 = 0;
t0 = 0;
w = sqrt(k/m);

npontos = 50;
tv = linspace(0,10,npontos);
i = 0;
dv = zeros(npontos,1);

for t = tv
    i = i + 1;
    dv(i) = dist2(x1_0,v1_0,t,t0,A_0,w,phi_0,L,Lm,d0);
end

figure(1)
plot(tv,dv,'k-');
xlabel('t')
ylabel('x')

dt = 0.1;
% Primeira colisão
ic = 1;
[v1col,x1col,tcol,col,A,phi] = colisao(t0,v1_0,x1_0,A_0,phi_0,w,L,Lm,d0);
fprintf('Colisão %d, t=%f\n',ic,tcol)

while col == true
    animacao(L,dt,t0,tcol,x1_0,v1_0,w,phi_0,Lm,A_0)
end
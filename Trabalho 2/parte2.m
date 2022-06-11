% PL3
% Bruna Alexandra Lopes Tavares (108504)
% Rúben Tavares Garrido (107927)
% Parte 2

clear all
close all
clc

% Notas:
% -> Alterar o valor de xf para 2, para realizar a alínea h)
% -> Aumentar o valor de u0, para realizar a alínea i)
%    Foi escolhido u0 = 200
% -> A função velocity_verlet foi atualizada para incluir u0, o x inicial e o x final



%% Alínea d)
u0 = 80;
env = 5:1:u0;
i = 0;
for en = env
    i = i+1;
    [x,psi] = velocity_verlet(en,1,0,u0,0,1);
    psi1(i) = psi(end);
end

figure(1)
plot(env,psi1)
xlabel('Energia')
ylabel('Psi')
title('Variação de psi em função da energia')

nz = 0;
prec = 1e-12;

for i = 1:length(psi1)-1
    if psi1(i)*psi1(i+1) < 0 % Caso exista um zero
        nz = nz + 1;
        enl = env(i); % À esquerda
        enr = env(i+1); % À direita
        enm = 0.5*(enl+enr);
        erro_relativo = (enr-enl)/enm;
        psi1l = psi1(i);
        psi1r = psi1(i+1);

        while erro_relativo > prec
            [x,psi] = velocity_verlet(enm,1,0,u0,0,1);
            psi1m = psi(end);
            if psi1r*psi1l < 0
                psi1r = psi1m;
                enr = enm;
            else
                psi1l = psi1m;
                enl = enm;
            end
            enm = 0.5*(enl+enr);
            erro_relativo = (enr-enl)/enm;
        end
        enz(nz) = enm;
        psi1m = (psi1r - psi1l)/2;
        psiz(nz) = psi1m;
    end
end

hold on
plot(enz,psiz,'ko')
hold off
legend('Psi(energia)','Valores obtidos','Location','southeast')


%% Alínea e)
old_nz = nz; % Guardar o número de zeros da alínea d)
i = 0;
for en = env
    i = i+1;
    [x,psi] = velocity_verlet(en,0,1,u0,0,1);
    psi1(i) = psi(end);
end

for i = 1:length(psi1)-1
    if psi1(i)*psi1(i+1) < 0 % Caso exista um zero
        nz = nz + 1;
        enl = env(i); % À esquerda
        enr = env(i+1); % À direita
        enm = 0.5*(enl+enr);
        erro_relativo = (enr-enl)/enm;
        psi1l = psi1(i);
        psi1r = psi1(i+1);

        while erro_relativo > prec
            [x,psi] = velocity_verlet(enm,0,1,u0,0,1);
            psi1m = psi(end);
            if psi1r*psi1l < 0
                psi1r = psi1m;
                enr = enm;
            else
                psi1l = psi1m;
                enl = enm;
            end
            enm = 0.5*(enl+enr);
            erro_relativo = (enr-enl)/enm;
        end
        enz(nz) = enm;
        psi1m = (psi1r - psi1l)/2;
        psiz(nz) = psi1m;
    end
end

figure(2)
plot(env,psi1,enz((old_nz+1):end),psiz((old_nz+1):end),'ko')
% O ((old_nz+1):end) serve para que o plot apenas represente os pontos da nova curva
xlabel('Energia')
ylabel('Psi')
title('Variação de psi em função da energia')
legend('Psi(energia)','Valores obtidos')



%% Alínea f)
enz_ordem = sort(enz);

x = 0:0.01:length(enz);
y = pi.^2 * x.^2;
figure(3)
plot(x,y,'b-',1:length(enz_ordem),enz_ordem,'ko')
title('Comparação entre a curva teórica e os valores obtidos')
xlabel('n^2')
ylabel('Energia')
legend('ε_n = π^2×n^2','Valores obtidos','Location','southeast')


%% Alínea g)
% Cada alínea tem o seu valor de psi(0) e v(0). Automatizar com base no número de zeros.
psi0 = zeros(1,nz);
psi0(1:old_nz) = psi0(1:old_nz) + 1;
v0 = zeros(1,nz);
v0(old_nz+1:end) = v0(old_nz+1:end) + 1;

for i = 1:length(enz)
    [x,psi_i(i,:)] = velocity_verlet(enz(i),psi0(i),v0(i),u0,0,1);
end

figure(4)
hold on
plot(x,psi_i(1,:),'g-',-x,psi_i(1,:),'g-') % Simétrica
plot(x,psi_i(2,:),'m-',-x,psi_i(2,:),'m-') % Simétrica
plot(x,psi_i(3,:),'c-',-x,-psi_i(3,:),'c-') % Anti-simétrica
hold off
xlabel('x')
ylabel('Psi')
title('Variação de psi em função de x, para cada energia')



%% Função
function [x,psi] = velocity_verlet(en,psi0,v0,u0,xi,xf)
n = (xf-xi)*1000;
distancia = xf-xi;
dx = distancia/n;
psi = zeros(1,n+1);
psi(1) = psi0;
v = zeros(1,n+1);
v(1) = v0;
x = (xi*1000:xf*1000)*dx;

for i = 1:n
    if x(i)<0.5 && x(i)>-0.5
        psi(i+1) = psi(i) + v(i)*dx - 0.5*en*psi(i)*dx^2;
        v(i+1) = v(i) - 0.5 * dx * en * (psi(i+1)+psi(i));
    else
        psi(i+1) = psi(i) + v(i)*dx - 0.5*(en-u0)*psi(i)*dx^2;
        v(i+1) = v(i) - 0.5 * dx * (en-u0) * (psi(i+1)+psi(i));
    end
end
end
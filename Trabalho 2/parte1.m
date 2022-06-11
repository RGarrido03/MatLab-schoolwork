% PL3
% Bruna Alexandra Lopes Tavares (108504)
% Rúben Tavares Garrido (107927)
% Parte 1

clear all
close all
clc



%% Alínea a)
env = 5:1:250; % Vetor de energia
i = 0;
for en = env
    i = i+1;
    [x,psi] = velocity_verlet(en,0,1);
    psi1(i) = psi(end);
end

figure(1)
plot(env,psi1)
xlabel('Energia')
ylabel('Psi')
title('Variação de psi em função da energia')



%% Alínea b)
nz = 0; % Número de zeros
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
            [x,psi] = velocity_verlet(enm,0,1);
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
legend('Psi(energia)','Zeros obtidos experimentalmente')

% Comparação com a curva teórica
x = 0:0.01:length(enz);
y = pi.^2 * x.^2;
figure(2)
plot(x,y,'b-',1:length(enz),enz,'ko')
title('Comparação entre a curva teórica e os valores obtidos')
xlabel('n^2')
ylabel('Energia')
legend('ε_n=π^2×n^2','Zeros obtidos experimentalmente','Location','northwest')



%% Alínea c)
for i = 1:5
    en_teorico = pi^2 * i^2;
    [x,psi_teorico(i,:)] = velocity_verlet(en_teorico,0,1);
end

figure(3)
plot(x,psi_teorico(1,:),'r-',x,psi_teorico(2,:),'g-',x,psi_teorico(3,:),'b-',...
    x,psi_teorico(4,:),'m-',x,psi_teorico(5,:),'c-')
xlabel('x')
ylabel('Psi')
title('Variação de psi em função de x, para cada energia')
legend('n = 1','n = 2','n = 3','n = 4','n = 5')



%% Função
function [x,psi] = velocity_verlet(en,psi0,v0)
n = 1000;
dx = 1/n;
psi = zeros(1,n+1);
psi(1) = psi0;
v = zeros(1,n+1);
v(1) = v0;
x = [0,(1:n)*dx];

for i = 1:n
    psi(i+1) = psi(i) + v(i)*dx - 0.5*en*psi(i)*dx^2;
    v(i+1) = v(i) - 0.5 * dx * en * (psi(i+1)+psi(i));
end
end
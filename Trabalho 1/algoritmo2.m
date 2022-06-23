% PL3, Bruna Alexandra Lopes Tavares (108504), Rúben Tavares Garrido (107927)
% Trabalho 1 (Aula P6)

% Sandbox method

clear all
close all
clc

% Ler a imagem e mostrá-la:
imagem = imread('planta.pbm');
% figure
% imshow(imagem)

% Dimensões da imagem:
[Lx,Ly] = size(imagem);
Lmax = max([Lx,Ly]);

% Número de circunferências e número de centros onde se vai analisar a dimensão:
divisoes = 5:5:420;
numero_centros = 4;

% Coordenadas dos vários centros e inicialização de matriz:
% Por questão de padrão, escolhemos o centro da imagem, bem como o centro de cada parte resultante da divisão da imagem em 4.
centro = [105,105,315,315;140,420,140,420];
h = zeros(length(divisoes),1);

for N = 1:numero_centros
    h_R = zeros(length(divisoes),1);
    centro_R = centro(:,N); % Obter o centro correspondente à iteração

    for R = divisoes
        for ip = 1:Lx
            for jp = 1:Ly
                distancia = sqrt((ip-centro_R(1))^2+(jp-centro_R(2))^2); % Distância do ponto ao pixel
                if distancia <= R && imagem(ip,jp) == false % Caso seja um píxel preto dentro da circunferência
                    h_R(R/5,1) = h_R(R/5,1) + 1; % Adicionar uma unidade
                end
            end
        end
    end
    h(:,1) = h(:,1) + h_R; % Efetuar o somatório para os vários centros
end

h(:,1) = h(:,1) / numero_centros; % Dividir pelo número de centros

% Equação da regressão linear:
% log(N) = D * log(L) + b

figure
loglog(divisoes,h,'.')

% Regressão linear:
k = divisoes > 20 & divisoes < 105; % Região que tem comportamento fractal e onde se vai aplicar a regressão linear
par = polyfit(log(divisoes(k)),log(h(k)),1);
retax = [0, log(Lmax)];
retay = par(1) * retax + par(2);
hold on
loglog(exp(retax),exp(retay),'r-') % Tem de se colocar a exponencial porque o loglog tem escala logarítmica
xlabel('R')
ylabel('h(R)')

D = par(1); b = par(2);
fprintf(1,'Algoritmo2\nD - dimensão fractal = %f\n', D)
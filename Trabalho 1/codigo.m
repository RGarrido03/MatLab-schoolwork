% PL3, Bruna Alexandra Lopes Tavares (108504), Rúben Tavares Garrido (107927)
% Trabalho 1 (Aula P6)

clear all
close all
clc

imagem = imread('koch_snowflake.pbm'); % Ler a imagem (depois alterar o nome para a outra)
figure
imshow(imagem) % Mostrar a imagem

% Dimensões da imagem:
[Lx,Ly] = size(imagem);

% Obter a dimensão com maior valor:
Lmax = max([Lx,Ly]);

% Número de divisões da grelha em cada dimensão => L
% Vetor com os vários L que se vai analisar => Lv
Lv = 2:5:Lmax;

% Índice da matriz NL que vai conter o número de caixas ocupadas e que vai aumentando com cada interação no ciclo:
i = 0;

NL = zeros (length(Lv),1);

% Pretende-se construir uma matriz h, sendo que h(ic,jc) contém o número píxeis da caixa com coordenadas (ic,jc)
% Cada caixa tem coordenadas (ic,jc) e cada píxel da imagem tem coordenadas (ip,jp)

for L = Lv
    h = zeros(L,L);
    delta = Lmax/L;
    i = i+1;
    for ip=1:Lx
        for jp=1:Ly
            if imagem(ip,jp) == false % o mesmo que == 0, ou seja se o píxel for preto
                % Coordenadas da caixa (ic,jc) com o píxel preto (ip,jp)
                % Arredondado ao inteiro mais próximo
                ic = floor((ip-1)/delta) + 1;
                jc = floor((jp-1)/delta) + 1;
                h(ic,jc) = h(ic,jc) + 1; % Adicionar o número de píxeis na caixa (ic,jc)
            end
        end
    end
    NL(i) = sum(sum(h>0)); % O sum interno dá um vetor. h>0 permite ver o número de caixas com píxeis
    % O NL é o múmero de caixas ocupadas para o valor de L em causa
end


% Temos N para cada L, portanto podemos representar o gráfico em escala logarítmica para obter D
% log(N) = D * log(L) + b

figure
loglog(Lv,NL,'.')

% Regressão linear:
k = Lv > 1e1 & Lv < 1e2; % Região que tem comportamento fractal e onde se vai aplicar a regressão linear
                         % Diferente para cada figura.
par = polyfit(log(Lv(k)),log(NL(k)),1);
retax = [0, log(Lmax)];
retay = par(1) * retax + par(2);
hold on
loglog(exp(retax),exp(retay),'r-') % Coloca-se a exponencial porque o loglog tem escala logarítmica
xlabel('L')
ylabel('N(L)')

% Devolver e dar print do resultado da dimensão fractal
D = par(1); b = par(2);
fprintf(1,'snowflake.pbm\n\nAlgoritmo 1\nD - dimensão fractal = %f\n\n', D)


%% Segunda parte

imagem = imread('planta.pbm');
N1 = sum(sum(~imagem));
ip = randi(Lx,N1,1);
jp = randi(Ly,N1,1);
imagem_random=true(Lx,Ly);

for i = 1:N1
    imagem_random(ip(i),jp(i)) = false; % substituir em cada posição do píxel, o valor '0'.
end

imagem = imagem_random;
figure
imshow(imagem)

% Dimensões da imagem:
[Lx,Ly] = size(imagem);

% Obter a dimensão com maior valor:
Lmax = max([Lx,Ly]);

% Número de divisões da grelha em cada dimensão => L
% Vetor com os vários L que se vai analisar => Lv
Lv = 2:10:Lmax;

% Índice da matriz NL que vai conter o número de caixas ocupadas e que vai aumentando com cada interação no ciclo:
i = 0;

NL = zeros (length(Lv),1);

% Pretende-se construir uma matriz h, sendo que h(ic,jc) contém o número píxeis da caixa com coordenadas (ic,jc)
% Cada caixa tem coordenadas (ic,jc) e cada píxel da imagem tem coordenadas (ip,jp)

for L = Lv
    h = zeros(L,L);
    delta = Lmax/L;
    i = i+1;
    for ip=1:Lx
        for jp=1:Ly
            if imagem(ip,jp) == false % o mesmo que == 0, ou seja se o píxel for preto
                % Coordenadas da caixa (ic,jc) com o píxel preto (ip,jp)
                % Arredondado ao inteiro mais próximo
                ic = floor((ip-1)/delta) + 1;
                jc = floor((jp-1)/delta) + 1;
                h(ic,jc) = h(ic,jc) + 1; % Adicionar o número de píxeis na caixa (ic,jc)
            end
        end
    end
    NL(i) = sum(sum(h>0)); % O sum interno dá um vetor. h>0 permite ver o número de caixas com píxeis
    % O NL é o múmero de caixas ocupadas para o valor de L em causa
end


% Temos N para cada L, portanto podemos representar o gráfico em escala logarítmica para obter D
% log(N) = D * log(L) + b

figure
loglog(Lv,NL,'.')

% Regressão linear:
k = Lv > 1e1 & Lv < 1e2; % Região que tem comportamento fractal e onde se vai aplicar a regressão linear
par = polyfit(log(Lv(k)),log(NL(k)),1);
retax = [0, log(Lmax)];
retay = par(1) * retax + par(2);
hold on
loglog(exp(retax),exp(retay),'r-') % Coloca-se a exponencial porque o loglog tem escala logarítmica
xlabel('L')
ylabel('N(L)')

% Devolver e dar print do resultado da dimensão fractal
D = par(1); b = par(2);
fprintf(1,'D - dimensão fractal = %f\nb - ordenada na origem = %f\n', D, b)
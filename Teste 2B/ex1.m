clear all
close all
clc

%% a)
T = 0.5;
v = 0.1;
J = [-(24)/((3*v-1).^2), (144*T)/((3*v-1).^3)-(18)/(v.^4);...
    (144)/((3*v-1).^3), (-1296*T)/((3*v-1).^4)+(72)/(v.^5)];



%% b)
% Primeira iteração
f1 = -(24*T)/((3*v-1).^2) + 6/v.^3; % Calcular deltaP/deltav(T,v)
f2 = (144*T)/((3*v-1).^3)-(18)/(v.^4); % Calcular delta^2.P/deltav^2(T,v)

r = [T;v] - inv(J)*[f1;f2]; % Fórmula. A matriz J já se encontra definida em a)
dr = r - [T;v]; % Variação de r entre interações

erro = norm(dr)/norm(r);
prec = 1e-6;

% Loop
while erro > prec
    T = r(1); % Obter os dados da iteração anterior
    v = r(2); % Obter os dados da iteração anterior

    f1 = -(24*T)/((3*v-1).^2) + 6/v.^3; % Calcular deltaP/deltav(T,v)
    f2 = (144*T)/((3*v-1).^3)-(18)/(v.^4); % Calcular delta^2.P/deltav^2(T,v)
    
    J = [-(24)/((3*v-1).^2), (144*T)/((3*v-1).^3)-(18)/(v.^4);...
    (144)/((3*v-1).^3), (-1296*T)/((3*v-1).^4)+(72)/(v.^5)];
    
    r = [T;v] - inv(J)*[f1;f2]; % Fórmula
    dr = r - [T;v]; % Variação de r entre iterações
    
    erro = norm(dr)/norm(r);
end
clear all
close all
clc

b = [0 1 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0 0 0 0 1 1 1 1 1 1 0 1 1 0 1 0];

% Expressão para calcular x = (-1)^b_1 * (1+f) * 2^e

% Calcular e
somatorio_e = 0;
for n_e = 0:7
    somatorio_e = somatorio_e + b(9-n_e) * 2^n_e;
end
e = -127 + somatorio_e;

% Calcular f
f = 0;
for n_f = 1:23
    f = f + b(n_f+9) * 2^(-n_f);
end

% Calcular o número, x
x = (-1)^b(1) * (1+f) * 2^e;
fprintf('Número x, em decimal: %f\n',x)
clear all
close all
clc

m = rand(10,5);
maior = [];

for i = 1:10
    for j = 1:5
        if m(i,j) > 0.5
            maior = [maior [i;j]];
        end
    end
end
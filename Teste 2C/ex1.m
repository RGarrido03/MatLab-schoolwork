clear all
close all
clc

%% Alínea a)
% Ver a função no final do exercício



%% Alínea b)
epsilon = 0:0.01:4.1;

y0 = 1;
v0 = 0;

i = 0;
for e = epsilon
    i = i + 1;
    [y(i,:),v(i,:)] = velocity_verlet(y0,v0,e);
end

y0 = 0;
v0 = 1;
i = 0;
for e = epsilon
    i = i + 1;
    [y_1(i,:),v_1(i,:)] = velocity_verlet(y0,v0,e);
end

figure(1)
plot(epsilon,y(:,end),'k-', epsilon,y_1(:,end),'b-') % y(:,end) obtém os valores de y(8) para todos os epsilons.
ylim([-3e5,1e5]);





%% Alínea c)
% Não me está a dar certo, mas não tenho tempo suficiente para corrigir.
% Para x0 = 1,v0 = 0
x0 = 1;
v0 = 0;
prec = 1e-12;
zero = [];
for i = 1:length(epsilon)-1
    if y(i,end) * y(i+1,end) < 0
        xe = epsilon(i);
        xd = epsilon(i+1);
        value_left = velocity_verlet(x0,v0,xe);
        value_middle = velocity_verlet(x0,v0,(xe+xd)/2);
        value_right = velocity_verlet(x0,v0,xd);
        erro = (value_right-value_left)/2;
        while erro > prec
            if value_middle * value_left < 0
                xd = (xe+xd)/2;
            else
                xe = (xe+xd)/2;
            end

            value_left = velocity_verlet(x0,v0,xe);
            value_middle = velocity_verlet(x0,v0,(xe+xd)/2);
            value_right = velocity_verlet(x0,v0,xd);
            erro = (value_right-value_left)/2;
            zero = [zero,xe];
        end
    end
end

x0 = 0;
v0 = 1;
prec = 1e-12;
zero_1 = [];
for i = 1:length(epsilon)-1
    if y(i,end) * y(i+1,end) < 0
        xe = epsilon(i);
        xd = epsilon(i+1);
        value_left = velocity_verlet(x0,v0,xe);
        value_middle = velocity_verlet(x0,v0,(xe+xd)/2);
        value_right = velocity_verlet(x0,v0,xd);
        erro = (value_right-value_left)/2;
        while erro > prec
            if value_middle * value_left < 0
                xd = (xe+xd)/2;
            else
                xe = (xe+xd)/2;
            end

            value_left = velocity_verlet(x0,v0,xe);
            value_middle = velocity_verlet(x0,v0,(xe+xd)/2);
            value_right = velocity_verlet(x0,v0,xd);
            erro = (value_right-value_left)/2;
            zero_1 = [zero_1,xe];
        end
    end
end

hold on
plot(zero,zeros(1,length(zero)),'ko')
plot(zero_1,zeros(1,length(zero_1)),'bo')
hold off



%% Função
function [y,v] = velocity_verlet(y0,v0,epsilon)
% Comparando com o formulário, t = x e x = y (penso não me ter confundido).
dx = 0.001;
x = 0:dx:8;

y(1) = y0;
v(1) = v0;

i = 0;
for xiter = x(1:end-1)
    i = i + 1;
    y(i+1) = y(i) + v(i)*dx + 0.5*dx.^2*(-(epsilon - 0.25*x(i).^2)*y(i));
    v(i+1) = v(i) + 0.5*dx*(-(epsilon - 0.25*x(i).^2)*y(i) - (epsilon - 0.25*x(i+1).^2)*y(i+1));
end
end
clear all
close all
clc

%% Alínea a)
T = [1.1,1,0.9];
v = 0.5:0.05:3;

figure(1)
n = 0;
p = zeros(3,length(v));

for t = T
    n = n+1;
    for i = 1:length(v)
        p(n,i) = (8*t)/(3*v(i)-1) - 3/(v(i).^2);
    end
end

figure(1)
plot(v,p(1,:),'k-',v,p(2,:),'b-',v,p(3,:),'r-')
legend('T = 1.1','T = 1','T = 0.9')



%% b)
vi = 0.5:0.001:3;
p1_interp = interp1(v,p(1,:),vi,"cubic"); % T = 1.1
p2_interp = interp1(v,p(2,:),vi,"cubic"); % T = 1
p3_interp = interp1(v,p(3,:),vi,"cubic"); % T = 0.9

figure(2)
hold on
plot(v,p(1,:),'k-',v,p(2,:),'b-',v,p(3,:),'r-')
plot(vi,p1_interp,'g-',vi,p2_interp,'c-',vi,p3_interp,'m-')
hold off

% Como os gráficos se sebrepõem, coloquei cores diferentes e uma legenda
legend('a) T = 1.1','a) T = 1','a) T = 0.9','T = 1.1 interpolada','T = 1 interpolada','T = 0.9 interpolada')



%% c)
dv = 0.05;
n = 0;
for t = T
    n = n + 1;
    for i = 2:length(v)-1
        dp_dv(n,i) = (p(n,i+1)-p(n,i-1))/2*dv;
        d2p_dv2(n,i) = (p(n,i+1)-2*p(n,i)+p(n,i-1))/(dv.^2);
    end
end

figure(3)
plot(v(2:end),dp_dv(1,:),'k-',v(2:end),dp_dv(2,:),'b-',v(2:end),dp_dv(3,:),'r-')
legend('T = 1.1','T = 1','T = 0.9')
% ylim([-1,1])  % O gráfico não deve estar bem, porque não se ajusta bem ao limite [-1,1]

figure(4)
plot(v(2:end),d2p_dv2(1,:),'k-',v(2:end),d2p_dv2(2,:),'b-',v(2:end),d2p_dv2(3,:),'r-')
legend('T = 1.1','T = 1','T = 0.9')
% ylim([-1,1])  % O gráfico não deve estar bem, porque não se ajusta bem ao limite [-1,1]
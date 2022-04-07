clear all
close all
clc

npts = 10000;
v(:,1) = [0;0];

a1 = [0,0;0,0.16]; b1 = [0;0];
a2 = [0.2,-0.26;0.23,0.22]; b2 = [0;1.6];
a3 = [-0.15,0.28;0.26,0.24]; b3 = [0;0.44];
%a4 = [0,0;0,0]; b4 = [0;1.6];
a4 = [0.85,0.04;-0.04,0.85]; b4 = [0;1.6];

p = [0.25,0.25,0.25,0.25];
%p = [0.01,0.07,0.07,0.85];

for n = 1:npts
    x = rand(1);

    if x <= p(1)
        a = a1; b = b1; caso(n) = 1;
    elseif x <= p(1)+p(2)
        a = a2; b = b2; caso(n) = 2;
    elseif x <= p(1)+p(2)+p(3)
        a = a3; b = b3; caso(n) = 3;
    else
        a = a4; b = b4; caso(n) = 4;
    end
    
    v(:,n+1) = a * v(:,n) + b;
end

figure(1)
index1 = find(caso == 1);
index2 = find(caso == 2);
index3 = find(caso == 3);
index4 = find(caso == 4);
plot(v(1,index1),v(2,index1),'r.')
hold on
plot(v(1,index2),v(2,index2),'g.')
plot(v(1,index3),v(2,index3),'b.')
plot(v(1,index4),v(2,index4),'k.')
axis equal
axis off
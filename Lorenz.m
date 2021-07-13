%Clears all data stored to a variable:
clear; 
%Clears the command window:
clc; 
%Closes all open OCTAVE figure windows:
close all;
%Parameter Values chosen by Lorenz also called the Chaotic Values:
Beta = [10;28;8/3]; %Sigma, Rho and Beta
%Initial Condition/Position:
x0 = [0;1;20];
dt = 0.01;
tspan = dt:dt:50;
%We define a function lorenz. We can also define it in a separate script:
function dx = lorenz(t,x,Beta)
dx =[
    Beta(1)*(x(2) - x(1));
    x(1)*(Beta(2) - x(3))-x(2);
    x(1)*x(2) - Beta(3)*x(3);
    ];
end
%We use the ode45 solver to solve the system of ODEs popularly called the Lorenz System:
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
%PLotting the 3D figure of the attractor fro 2 initial consitions:
plot3(x(:,1),x(:,2),x(:,3),'b','Linewidth',1.5);
%This just beautifies the plot by making the backgroud black and the plot white
set(gca,'color','k','xcolor','w','ycolor','w','zcolor','w');
set(gcf,'color','k');
hold on
x1 = [0.000001 1 20];
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x1,options);
plot3(x(:,1),x(:,2),x(:,3),'r','Linewidth',1.5);
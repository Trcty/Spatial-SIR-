
% description: this script will load the inital values provided and solve
%           spatial SIR model using both ode45 and RK4. runtime of both
%           methods will be recorded. In the end, change of state of SIR
%           over time at (1,1), (5,18), and (30,70) will be plotted. The
%           overall spread of the disease will be animated as well


clear all;close all;clc;

% load data
load('initialValues.mat');
% define constant and t final
alpha=0.1;
beta=0.05;
gamma=0.1;
tFinal=60;


% calculate the system by calling solveSpatialSIR, once by using ode45,once
% by usingRK4. Record time it takes to run for both solvers.
tic;
[ode45_t, ode45_x] = solveSpatialSIR(tFinal, initialConditions, alpha, beta, gamma, @ode45);
ode45runtime=toc;
fprintf('Runtime using ode45: %f\n',ode45runtime);


tic;
[RK4_t, RK4_x] = solveSpatialSIR(tFinal, initialConditions, alpha, beta, gamma, @RK4);
RK4runtime=toc;
fprintf('Runtime using RK4: %f\n',RK4runtime);

%plot three figures: (1,1), (5,18),(30,70)
figure('Name','x=1 and y=1');
plotTimeSeries(RK4_t,RK4_x,1,1);
figure('Name','x=5 and y=18');
plotTimeSeries(RK4_t,RK4_x,5,18);
figure('Name','x=30 and y=70');
plotTimeSeries(RK4_t,RK4_x,30,70);

% create animation 
animate(RK4_x);


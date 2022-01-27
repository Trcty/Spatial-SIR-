% name of the file:  solvespatialSIR.m
% name: zhiwen cao 
function [t, x] = solveSpatialSIR(tFinal, initialCondition, alpha, beta, gamma, odeSolver)
% description:
% solveSpatialSIR Solve the spatial SIR model
% Inputs:
% tFinal: end time for the simulation (assuming start is t=0) initialCondition: a MxNx3 matrix that sums to 1 in third dimension alpha, beta, gamma: model parameters
% odeSolver: a function handle for an ode45-compatible solver
% Outputs:
% t: a vector of the time-steps
% x: MxNx3xlength(t) matrix representing the state vs. time
 M=length(initialCondition(:,1,1));
 N=length(initialCondition(1,:,1));
 y0=initialCondition(:);
 trange=[0,tFinal];
 
 % wrap the function in the anonymous function and then solve
 [t,y]=odeSolver(@(t,x)dynamicsSIR(x,M,N,alpha,beta,gamma),trange,y0);
 x=zeros(M,N,3,length(t));
 
 % fill in x after reshaping data in y
 for i=1:length(t)
     x(:,:,:,i)=reshape(y(i,:),[M,N,3]);
 end 
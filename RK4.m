% name of the file:  RK4.m
% name: zhiwen cao 

function [t, y] = RK4(f, tspan, y0)
 % description:
 % RK4 Numerically solves the differential equation using the fourth-order Runge-Kutta algorithm
 % Inputs:
 %     f: function handle of f(t, y)
 %     tspan: the time period for simulation (should be a 1x2 array contain start time and end time)
 %     y0: the initial conditions for the differential equation
 % Outputs:
 %     t: corresponding time sequence as a T x 1 vector
 %     y: the solution of the differential equation as a T x n matrix,
 %        where T is the number of time steps and n is the dimension of y

 
 h=0.1; % h is the step size
 t=zeros((tspan(2)-tspan(1))/h,1); % initializie t 
 y=zeros(numel(t),numel(y0)); % Memory preallocation
 y_in=reshape(y0,[1,numel(y0)]);
 y(1,:)=y_in; % initial condition
 t(1)=tspan(1);
 
 % implement algorithms for RK4
 for k=1:numel(t)
     k1 = f(t(k),y(k,:))';
     
     k2 = f(t(k)+h/2,y(k,:)+h*k1/2)';
     
     k3 = f(t(k)+h/2,y(k,:)+h*k2/2)'; 
       
     k4 = f(t(k)+h,y(k,:)+k3*h)';
      
     y(k+1,:) = y(k,:) + h*(k1+2*k2+2*k3+k4)/6;
     t(k+1)=t(k)+h;
     
 
 end
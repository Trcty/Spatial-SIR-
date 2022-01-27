% name of the file:  plotTimeSeries.m
% name: zhiwen cao 
function plotTimeSeries(t, X, x, y)
% description:
% plotTimeSeries: a function that plots and saves the local S.I.R distribution at spatial coordianate (x, y).
%   Inputs:
%       t: a vector of time steps
%       X: an M*N*3*length(t) matrix, where each point in the M*N space
%       corresponds to a local S.I.R. model with states whose values are between 0 and 1. 
%       This 3D matrix is repeated for each time step, making it a 4D matrix.
%       x: the spatial x-coordinate on the grid
%       y: the spatial y-coordinate on the grid
%   Outputs:
%       This function has no outputs


s=squeeze(X(x,y,1,:));
i=squeeze(X(x,y,2,:));
r=squeeze(X(x,y,3,:));

subplot(3,1,1);
plot(t,s);
title(sprintf('Subplot 1: percent of susceptiple individuals with x= %d, y=%d',x,y));
xlabel('time step');
ylabel('percentage of S(t)');
xlim([0 60]);
ylim([0 1]);

subplot(3,1,2);
plot(t,i);
title(sprintf('Subplot 2: percent of infected individuals with x= %d, y=%d',x,y));
xlabel('time step');
ylabel('percentage of I(t)');
xlim([0 60]);
ylim([0 1]);

subplot(3,1,3);
plot(t,r);
title(sprintf('Subplot 3: percent of recovered individuals with x= %d, y=%d',x,y));
xlabel('time step');
ylabel('percentage of R(t)');
xlim([0 60]);
ylim([0 1]);

print(sprintf('time_series_%d_%d',x,y),'-dpng');
end
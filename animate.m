% name of the file:  animate.m
% name: zhiwen cao 
function animate(X)
% description:
% animate: a function that shows the change in the ratio of susceptible,
% infected, and recovered individuals in the grid as an image.
%   Inputs:
%       X: an M*N*3*length(t) matrix, where each point in the M*N space
%       corresponds to a single grid with 3 numbers between 0 and 1 showing
%       the SIR result. this 3D matrix is repeated for each time step
%       making it a 4D matrix.
%   Output: this function does not output anything.



figure; 
[~,~,~,t] = size(X); % get matrix for time step
for n=1:t
    if mod(n-1,10)==0 % get frame for every 10th step 
         data(:,:,3) = X(:,:,1,n);  % use blue to represent S
         data(:,:,1) = X(:,:,2,n);  % use red to represent I
         data(:,:,2) = X(:,:,3,n);  % use green to represent R
        image(data);
        pause(0.2);
    end
end




end 

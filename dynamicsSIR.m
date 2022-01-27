% name of the file: dynamicsSIR.m
% name: zhiwen cao 
function dxdt = dynamicsSIR(x, M, N, alpha, beta, gamma)
% description: 
% dynamicsSIR Compute the rate of change of the model
%   Inputs:
%       x: vectorized state
%       M, N: size of the grid
%       alpha, beta, gamma: model parameters
%   Output:
%       dxdt: vectorized time derivative of state


% make into 3 M*N matrix 
data=reshape(x,[M,N,3]);
% define S I R and w
S=data(:,:,1);
I=data(:,:,2);
%R=data(:,:,3);
w=[1/2^0.5,1,1/2^0.5;1,0,1;1/2^0.5,1,1/2^0.5];

%compute dsdt,didt,drtd with weighting function w that describe proximity of
%nearby neighbors
dsdt=-(beta*I+alpha*conv2(I,w,'same')).*S;
didt=(beta*I+alpha*conv2(I,w,'same')).*S-gamma*I;
drdt=gamma*I;

%compute dxdt
combine(:,:,1)=dsdt;
combine(:,:,2)=didt;
combine(:,:,3)=drdt;
dxdt=combine(:);

end
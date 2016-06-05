%% Brusselator: Evaluation of the memory kernel

clear

%% What is done here:
% Compute the solution of the Brusselator in for t \in [0 tf]
% Compute the memory kernel using different approximations

%% Parameters

global A B K x0 ker

% 1 - if the memory integrand has been computed and ready to use
% 0 - if you just want to see the range in which the resolved variable
% evolves
ker = 1;

if ker == 0 % then set A and B
    A = 1;
    B = 2;
end

load('./OPDE/MemInteg.mat') % K T x0 y0 A B

NN = length(T);
T = T(1:20:NN);
K = K(:,1:20:NN);
Nt = length(T);
dt = T(2) - T(1);

%% Compute the solution

X0 = 1;
Y0 = 0;

Phi = zeros(2,Nt);

Phi(1,1) = X0;
Phi(2,1) = Y0;

for i = 1:Nt-1
    
   P = Phi(:,i);
   
   K1 = F(P);
%    K2 = F(K + 0.5*dt*K1);
%    K3 = F(K + 0.5*dt*K2);
%    K4 = F(K + dt*K3);
    
   Phi(:,i+1) = P + dt*K1;
%    Phi(:,i+1) = K + dt/6*(K1 + 2*K2 + 2*K3 + K4);
   
   
end

visualize(Phi,T)
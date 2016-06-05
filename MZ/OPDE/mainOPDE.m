%% Brusselator: Solve the PDE for the orthogonal dynamics
%  and provide the memory kernel integrand

clear
close all

%%

%%

global A B dX0 dY0 X0 Y0 x0 y0

% Steady - A = 1, B = 1.7
% LCO    - A = 1, B = 3

A = 1;
B = 3;

x0_min = 0; x0_max = 4; n1 = 100;
x0 = linspace(x0_min,x0_max,n1); dX0 = x0(2) - x0(1);

y0_min = 0; y0_max = 1; n2 = 5;
y0 = linspace(y0_min,y0_max,n2); dY0 = y0(2) - y0(1);

[X0,Y0] = meshgrid(x0,y0);
X0 = X0.';
Y0 = Y0.';

% wind_2D(x0_min,x0_max,y0_min,y0_max);

nu = 1;
dt = nu*time_step(X0,Y0);

tf = 30;
T = 0:dt:tf;
Nt = length(T);

F_ex = exact(x0,y0,T);

F = zeros(n1,n2,Nt);

F(:,:,1) = X0.^2.*Y0;

run 'BC'

for n = 1:Nt-1
    
   K = F(:,:,n); 
   
   K1 = Res(K,n);
%    K2 = Res(K + 0.5*dt*K1,t);
%    K3 = Res(K + 0.5*dt*K2,t);
%    K4 = Res(K + dt*K3,t);
    
   F(:,:,n+1) = F(:,:,n) + dt*K1;
%    F(:,:,n+1) = F(:,:,n) + dt/6*(K1 + 2*(K2 + K3) + K4);
   
end

% visualize(F,F_ex,x0,y0,T);
K = MemIntegrand(F); % Computes PL F
% check(K,T);

save MemInteg.mat K x0 y0 T A B
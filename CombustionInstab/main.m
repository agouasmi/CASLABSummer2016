%% Main file

clear

%% Global variables

global lambda dx nu A Ac x xc flux T0_in mp_in

%% Parameters

in2m = 0.0254;

Lc = 5 * in2m;       % Chamber length (in)
flux = 2;             % Flux type: 1-Roe / 2-LaxWendroff
dx = 5e-3;         % Mesh spacing

maxiter = 50000;      % Max number of iterations
minRes = 1e-3;        % threshold residual value
nu = 0.7;             % Courant number

run 'constants.m'

%% Define geometry

[x,A] = read_shape(Lc,dx);

A0 = A(1);
Nf = length(x);
Nc = Nf - 1;

Ac = 0.5*(A(1:Nc) + A(2:Nf));
xc = 0.5*(x(1:Nc) + x(2:Nf));

Nf = length(x)
Nc = Nf - 1;

%% Inlet Parameters: Stagnation temperature (K) and Mass flow rate (kg/s)

T0_in = 1010;     % Temperature:                  
mp_in = 0.459;    % Mass flow rate:                 rho * u * A 

% Initial conditions

Y0 = 1; Y1 = 0.1;
p0 = 2.08e6; p1 = 2.22e6;
T0 = 1010; T1 = 2700;
r0 = p0*MMass(Y0)/(R*T0); r1 = p1*MMass(Y1)/(R*T1);
mp0 = 0.459; mp1 = 0.524;

%% Structures

% Conservative variables
q = zeros(Nc,4); 
q_old = q;

% Temporary variables for RK4
q1 = q;
q2 = q;
q3 = q;

% Storage variable
solq_cons = [];
solq_prim = [];

%% Initialize q 
 

q(:,1) = r0 .* (xc<0) + r1 .* (xc>=0);
q(:,4) = r0*Y0 .* (xc<0) + r1*Y1 .* (xc>=0);

Y = q(:,4)./q(:,1);
T = T0 .* (xc<0) + T1 .* (xc>=0);
p = p0 .* (xc<0) + p1 .* (xc>=0);

q(:,2) = ((mp0 .* (xc<0) + mp1 .* (xc>=0)))./Ac;
u = q(:,2)./q(:,1);

q(:,3) = q(:,1).*h_o(Y,u,T) - p;

% visualize(q,xc);

%% Let's iterate now

iter = 0;
t = 0;
T = [];
Ress = [];
res = 1;

while (res > minRes && iter < maxiter)
    
    q_old = q;
    
    time = t;
    
    % Determine time step for the current iteration
    dt = time_step(Nc,q_old)
%     dt = 1e-5;
    
    lambda = dt/dx;
    
    % RK-4
%     q1 = q_old + dt/4*Res(q_old);
%      
%     q2 = q_old + dt/3*Res(q1);
%       
%     q3 = q_old + dt/2*Res(q2);
    
    q  = q_old + dt*Res(q);  
     
    % Update time
    t = t + dt;
    
    % Iter
    iter = iter + 1;
    
    res = l2norm(q,q_old)
    
    Ress = [Ress res];
    
end


plot(1:length(Ress),Ress)
tf = t;
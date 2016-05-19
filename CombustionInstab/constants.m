%% constants

% http://www.grc.nasa.gov/WWW/CEAWeb/    ---- link to the Chemical Equilibrium with Applications Code

R = 8.314e3;                     % Gas constant: the mixture molecular weight is expressed in g/mol hence the 1e3 factor

kf = 2000;                       % Constant in the steady combustion source term

h_f_pr = 4.46e6;                 % Heat of formation of the combustion products 
T_ref  = 2450;                   % Reference temperature

OF = 6.3;                        % Oxidizer-to-fuel ratio   (INPUT to CEA)
Cf = 1.13;                       % Equilibrium Fuel-to-oxidizer ratio (OUTPUT of CEA)

M_ox  = 17.16;                   % Oxidizer molecular weight (42% O, 58% H20)
Cp_ox = 1.544e3;                 % Oxidizer mass specific heat
A_ox  = -Cp_ox*T_ref;            % h_ox = Cp_ox * T + A_ox 

M_pr  = 18;                      % Combustion product molecular weight (OUTPUT of CEA)
Cp_pr = 10.9e3;                  % Combustion product specific heat
A_pr  =  h_f_pr - Cp_pr*T_ref;   % h_pr = Cp_pr * T + A_pr

dC = Cp_ox - Cp_pr;             
dA = A_ox - A_pr;

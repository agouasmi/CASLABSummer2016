%% constants

% http://www.grc.nasa.gov/WWW/CEAWeb/

R = 8.314e3;                   % Gas constant

kf = 2000;

h_f_pr = 4.46e6;
T_ref  = 2450;

OF = 6.3;                    % Oxidizer-to-fuel ratio   (INPUT to CEA)
Cf = 1.13;                   % Equilibrium Fuel-to-oxidizer ratio (OUTPUT of CEA)

M_ox  = 17.16;               % Oxidizer molecular weight (42% O, 58% H20)
Cp_ox = 1.544e3;             % Oxidizer mass specific heat
A_ox  = -Cp_ox*T_ref;

M_pr  = 18;                   % Combustion product molecular weight
Cp_pr = 10.9e3;               % Combustion product specific heat
A_pr  =  h_f_pr - Cp_pr*T_ref;

dC = Cp_ox - Cp_pr;
dA = A_ox - A_pr;

function h = h_o (Y,u,T)
% Computes h_o = h + 0.5 u^2

run 'constants.m'

h_ox = Cp_ox * (T - T_ref);
h_pr = h_f_pr + Cp_pr * (T - T_ref);

h = 0.5*u.^2 + Y.*h_ox + (1-Y).*h_pr; 

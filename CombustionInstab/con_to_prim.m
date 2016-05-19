function [r,u,p,gam,h,T] =  con_to_prim(q)
% Converts the conservative variables to primitive variables

run 'constants.m'

Y = q(4)./q(1);
M = MMass(Y);

gam = gamma_mix(Y);
% p = (gam-1) * (q(3) - 0.5 * q(2) * q(2) / q(1)); This formula, doesn't hold here

r = q(1);
u = q(2) ./ q(1);
E = q(3);

% For an explanation of how this is derived see report
p = (E - 0.5*r.*u.^2 - r.*(Y*dA + A_pr))./(M/R.*(Y*dC + Cp_pr) - 1);

T = p.*M./(r.*R);

h = h_o(Y,u,T);

end

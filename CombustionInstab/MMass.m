function M = MMass(Y)
% Computes the mixture molecular weight

% We need to get M_ox and M_Pr
run 'constants.m'  

M1 = Y*(1/M_ox) + (1-Y)*(1/M_pr);
M = 1./M1;

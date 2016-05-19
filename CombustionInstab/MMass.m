function M = MMass(Y)

run 'constants.m'

temp = Y*(1/M_ox) + (1-Y)*(1/M_pr);
M = 1./temp;
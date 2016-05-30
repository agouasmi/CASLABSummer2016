function gam = gamma_mix(Y)

run 'constants.m'

Cp = Y*Cp_ox + (1-Y)*Cp_pr;

gam = Cp/(Cp-(R/MMass(Y)));
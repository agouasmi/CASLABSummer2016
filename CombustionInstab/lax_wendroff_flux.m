function F = lax_wendroff_flux(ql,qr)
% Richtmyer 2-step formulation

global lambda

q_int = 0.5*(ql + qr) - 0.5*lambda*(physical_flux4(qr) - physical_flux4(ql)); 

F = physical_flux4(q_int);

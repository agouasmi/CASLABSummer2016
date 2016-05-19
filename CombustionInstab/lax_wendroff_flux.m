function F = lax_wendroff_flux(ql,qr)

global lambda

q_int = 0.5*(ql + qr) - 0.5*lambda*(physical_flux4(qr) - physical_flux4(ql)); 

F = physical_flux4(q_int);
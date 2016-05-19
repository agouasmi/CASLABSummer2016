function F = physical_flux4(q)

[r,u,p,~,h,~] = con_to_prim(q);

F = [r*u r*u^2+p r*h*u u*q(4)];
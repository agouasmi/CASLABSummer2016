function F_ex = exact_(x0,y0,t)

xQ1 = (x0./(2*y0 - x0 + 1e-8)).*(y0.*(exp(x0.*(2*y0 - x0)*t) + 1) - x0);  
yQ1 = (y0./(2*y0 - x0 + 1e-8)).*(2*y0 - x0.*exp(x0.*(2*y0 - x0)*t));

xQ2 = x0.^2.*y0*t + x0;
yQ2 = y0 - x0.^2.*y0*t;

F_ex = (2*y0 - x0 ~= 0).*(xQ1.^2.*yQ1) + (2*y0 - x0 == 0).*(xQ2.^2.*yQ2);

end
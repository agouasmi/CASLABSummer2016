function dt = time_step(nc,q)
% Computes the time-step using a CFL condition

global nu dx

R = 8.314e3;
dt1 = 1.0;

for i = 1:nc
    
      [~,u,~,gam,~,T] = con_to_prim(q(i,:));
      M = MMass(q(i,4)/q(i,1));
      a = sqrt(gam * R/M * T);
      dtlocal = dx / (abs(u) + a);
      
      dt1 = (dtlocal<dt1)*dtlocal + (dtlocal>=dt1)*dt1;
      
end

dt1 = nu * dt1;
dt = dt1;

function dt = time_step(X0,Y0)

global dX0 dY0 A B

u1 = abs(A + X0.^2.*Y0 - B*X0 - X0 + 1e-8);
u2 = abs(B*X0 - X0.^2.*Y0 + 1e-8);

dt = min(min( (u1/dX0 + u2/dY0).^(-1) ));

global BC

BC = struct;

% x0 = x0min - dx0
x = x0_min - dX0; y = y0;
BC.xm  = exact(x,y,T); 

% x0 = x0max + dx0
x = x0_max + dX0; y = y0;
BC.xM  = exact(x,y,T);

% y0 = y0min - dy0
x = x0; y = y0_min - dY0;
BC.ym  = exact(x,y,T);  

% y0 = y0max + dy0
x = x0; y = y0_max + dY0;
BC.yM  = exact(x,y,T); 
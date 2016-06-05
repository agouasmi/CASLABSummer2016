function F = addBC(f,n)

% I need: - x0min, x0max, dx0 ; - y0min, y0max, dy0

global BC

BCxm = BC.xm;
BCxM = BC.xM;
BCym = BC.ym;
BCyM = BC.yM;

[n1,n2] = size(f);

N1 = n1 + 2;
N2 = n2 + 2;

F = zeros(N1,N2);

F(2:N1-1,2:N2-1) = f;

% x0 = x0min - dx0
F(1,2:N2-1)  = BCxm(:,:,n); 

% x0 = x0max + dx0
F(N1,2:N2-1) = BCxM(:,:,n); 

% y0 = y0min - dy0
F(2:N1-1,1)  = BCym(:,:,n);  

% y0 = y0max + dy0
F(2:N1-1,N2) = BCyM(:,:,n); 


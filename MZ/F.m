function K = F(phi)

global A B

K = zeros(2,1);

X = phi(1);
Y = phi(2);

K(1) = A + X^2*Y -B*X - X;
K(2) = B*X - X^2*Y;
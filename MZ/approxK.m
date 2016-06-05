function K = approxK(X,T)

global B

Nt = size(X,2);
dt = T(2) - T(1);

K = zeros(Nt,1);

for i = 2:Nt
   
    t = T(i);
    
    Xs = X(1:i);  
    S = T(1:i);
    K(i) = dt*B*sum(Xs.^3.*exp(-Xs.^2.*(t - S)));
  
end
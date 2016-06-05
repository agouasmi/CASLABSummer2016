function K = deltamodelK(X,T)

global B

Nt = size(X,2);

K = zeros(Nt,1);

for i = 2:Nt
   
    t = T(i);
    
    K(i) = B*X(i)*(1 - exp(-X(i)^2*t));
  
end
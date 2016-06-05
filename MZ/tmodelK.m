function K = tmodelK(X,T)

global B

Nt = size(X,2);

K = zeros(Nt,1);

for i = 2:Nt
   
    t = T(i);
    K(i) = t*B*X(i)^3;
  
end
function Ker_num = KerNum(Phi,T)

global K x0

X = Phi(1,:);

Nt = length(T);
ds = T(2) - T(1);

Ker_num = zeros(1,Nt);

for n = 1:Nt
     
   x = X(1:n); 
   Ix = retrieve(x,x0);
   
   for s = 1:n
       
   Ker_num(n) = Ker_num(n) + K(Ix(s),n-s+1)*ds;
   
   end
   
end




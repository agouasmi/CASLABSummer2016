function Ix = retrieve(x,x0)

nx = length(x);

x0min = x0(1); 
dx0 = x0(2) - x0(1);

Ix = zeros(1,nx);

for j = 1:nx
    
   Ix(j) = floor((x(j) - x0min)/dx0) + 1;  
    
end
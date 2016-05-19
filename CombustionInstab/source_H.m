function H = source_H(q)
% Computes the basic source term of 1D Euler

global dx x A Ac

Nc = length(x)-1;
H = zeros(Nc,4);

for i = 1:Nc
   
    state = q(i,:);
    
    [~,~,p,~,~,~] =  con_to_prim(state);
    
    dA_dx = (A(i+1) - A(i))/dx;
    
    H(i,2) = p*dA_dx/Ac(i);
    
end

end

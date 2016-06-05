function K = MemIntegrand(F)
% K = (PL)F

[n1,~,Nt] = size(F);

K = zeros(n1,Nt);

for n = 1:Nt
   
   [~,temp] = P_proj(L(F(:,:,n)));  
   K(:,n) = temp; 
        
end


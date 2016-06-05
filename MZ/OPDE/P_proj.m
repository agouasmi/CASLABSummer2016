function [PF,F_at_Y0_0] = P_proj(F)

[~,N2] = size(F);

PF = F;
F_at_Y0_0 = F(:,1); % F(X0,0)

for j = 2:N2
    
    PF(:,j) = F_at_Y0_0;
    
end
    
function [dF1,dF2] = dif_central(F)

global dX0 dY0

[n1,n2] = size(F);

dF1 = zeros(n1,n2);
dF2 = zeros(n1,n2);

dF1(1,:) = 1/dX0*(F(2,:) - F(1,:));
dF2(:,1) = 1/dY0*(F(:,2) - F(:,1));

dF1(n1,:) = 1/dX0*(F(n1,:) - F(n1-1,:));
dF2(:,n2) = 1/dY0*(F(:,n2) - F(:,n2-1));

for i = 2:n1-1
    
   dF1(i,:) = 1/(2*dX0)*(F(i+1,:) - F(i-1,:));
   
end

for j = 2:n2-1
    
   dF2(:,j) = 1/(2*dY0)*(F(:,j+1) - F(:,j-1));
   
end

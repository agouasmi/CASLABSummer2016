function [dF1_up,dF1_do,dF2_up,dF2_do] = dif(F)

global dX0 dY0

[N1,N2] = size(F);

n1 = N1 - 2;
n2 = N2 - 2;

dF1_up = zeros(n1,n2);
dF1_do = zeros(n1,n2);

dF2_up = zeros(n1,n2);
dF2_do = zeros(n1,n2);

for i = 1:n1
    for j = 1:n2
       
        I = i+1; J = j+1;
        
        dF1_up(i,j) = (F(I,J) - F(I-1,J))/(dX0);
        dF2_up(i,j) = (F(I,J) - F(I,J-1))/(dY0);
        
        dF1_do(i,j) = (F(I+1,J) - F(I,J))/(dX0);
        dF2_do(i,j) = (F(I,J+1) - F(I,J))/(dY0);
        
    end
end

end
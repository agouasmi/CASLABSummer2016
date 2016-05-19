function e = l2norm(q1,q2)

N1 = size(q1,1);
N2 = size(q1,2);

e = 0;

for i = 1:N1
    for j = 1:N2
        e = e + (q1(i,j) - q2(i,j))^2;
    end
end

e = sqrt(e)/(N1*N2);
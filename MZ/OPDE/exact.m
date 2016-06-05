function F_ex = exact(x0,y0,T)

n1 = length(x0);
n2 = length(y0);

Nt = length(T);
dt = T(2) - T(1);

F_ex = zeros(n1,n2,Nt);

for i = 1:n1
    for j = 1:n2
        
        x_0 = x0(i);
        y_0 = y0(j);
        
        XQ = zeros(1,1,Nt);
        XQ(:,:,1) = x_0;
        
        for n = 1:Nt-1
           
            xq = XQ(:,:,n);
            XQ(:,:,n+1) = xq + dt*(xq^2*(x_0 + y_0 - xq));
            
        end
        
        F_ex(i,j,:) = XQ.^2.*(x_0 + y_0 - XQ);
        
    end
end

end
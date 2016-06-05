function check(K,T)

global x0

Nt = length(T);

figure('DoubleBuffer','on')

for n = 1:Nt
    
    plot(x0,K(:,n))
    xlabel('x_0')
    ylabel('K(x_0,t)')
    title(['Memory integrand at t = ' num2str(T(n))])
    
    drawnow
end

end
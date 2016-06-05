function visualize(F,F_ex,x,y,T)

xmin = min(x);
xmax = max(x);
ymin = min(y);
ymax = max(y);

[~,~,Nt] = size(F);

fig = figure('DoubleBuffer','on','Position',[50 50 700 400]);

for n = 1:10:Nt
    
    t = T(n);
    
    subplot(1,2,1)
    surf(x,y,F(:,:,n).')
    title(['(Numerical) -- F_1(X_0,Y_0,t) -- t = ' num2str(t) ' s'])
    xlabel('X_0')
    ylabel('Y_0')
    axis([xmin xmax ymin ymax -inf inf])
    
    subplot(1,2,2)
    surf(x,y,F_ex(:,:,n).')
    title(['(Exact) -- F_1(X_0,Y_0,t) = (X^Q)^2 Y^Q -- t = ' num2str(t) ' s'])
    axis([xmin xmax ymin ymax -inf inf])
    xlabel('X_0')
    ylabel('Y_0')
    
%     frames(n) = getframe(fig);
    
    drawnow
%     pause(0.02)
    
end

% movie2avi(frames, 'Brusselator.avi', 'compression', 'none');
end
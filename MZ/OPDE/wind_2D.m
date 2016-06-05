function wind_2D(x0_min,x0_max,y0_min,y0_max)

global A B

N1 = 20; x0 = linspace(x0_min,x0_max,N1);

N2 = 20; y0 = linspace(y0_min,y0_max,N2);

[X0,Y0] = meshgrid(x0,y0);
X0 = X0.';
Y0 = Y0.';

Speed_x = -(A + X0.^2.*Y0 - B*X0 - X0);
Speed_y = -(B*X0 - X0.^2.*Y0);

figure
quiver(X0,Y0,Speed_x,Speed_y,1.2,'LineWidth',1.2,'Color','red'); axis tight

% figure
% contourf(x0,y0,Speed_x,30);colorbar('southoutside');
% title('Wind in x dir');
% xlabel('x')
% ylabel('y')
% 
% figure 
% contourf(x0,y0,Speed_y,30);colorbar;
% title('Wind in y dir');
% xlabel('x')
% ylabel('y')

end




function [x,A] = read_shape(Lc,dx)

% Creates the mesh

in2m = 0.0254;     % inches to meters factor

Li = 6.82 * in2m;  % Injector Length
Ln = 3.0  * in2m;  % Nozzle Length

lc = 0.5  * in2m;  % length of transitions injector-chamber, chamber-nozzle 

Ri = 0.4  * in2m;           % Injector radius
Rc = 0.9  * in2m;           % Chamber radius
Rn = [0.425 0.525] * in2m;  % Nozzle radii

x = (-Li:dx:(Lc + Ln)).';

f = @(y) ...
    (y <=0)                 .*pi.*  Ri^2 + ...
    (y > 0).*(y <= lc)      .*pi.* (Ri + (Rc - Ri)/lc * y).^2 + ...
    (y > lc).*(y <= Lc - lc).*pi.*  Rc^2 + ... 
    (y > Lc - lc).*(y <= Lc).*pi.* (Rc - (Rc - Rn(1))/lc * (y - (Lc -lc))).^2 + ...
    (y > Lc)                .*pi.* (Rn(1) + (Rn(2) - Rn(1))/Ln* (y - Lc)).^2;

% if x(end) ~= (Lc + Ln)
%     x = [x (Lc + Ln)];
% end

A = f(x);

%% Visualization

figure('Position', [0, 0, 700, 500])
subplot(2,1,1)
plot(x,A,'k',x,0*x,'k','LineWidth',2)
axis tight
axis([x(1) x(end) -0.1*max(A) 1.1*max(A)])
grid on
grid minor
xlabel('x (m)')
ylabel('Cross-section (m^2)')
title('Cross-section')

% r = sqrt(A/pi);
% 
% subplot(2,1,2)
% plot(x,r,'k',x,0*x,'k','LineWidth',2)
% axis tight
% axis([x(1) x(end) -0.1*max(r) 1.1*max(r)])
% grid on
% grid minor
% xlabel('x (m)')
% ylabel('Radius (m)')
% title('Radius')

end

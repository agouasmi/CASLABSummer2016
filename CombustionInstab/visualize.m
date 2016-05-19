function visualize(q,xc)

Nc = size(q,1);

Y = q(:,4)./q(:,1);
U = zeros(Nc,1);
P = zeros(Nc,1);
T = zeros(Nc,1);

for i = 1:Nc
   
    [~,u,p,~,~,temp] =  con_to_prim(q(i,:));
    
    T(i) = temp;
    P(i) = p;
    U(i) = u;
    
end

figure
subplot(2,2,1)
plot(xc,Y)
title('Oxidizer mass fraction')
xlabel('x_c')
ylabel('Y_{Ox}')
axis tight
grid on; grid minor;

subplot(2,2,2)
plot(xc,P)
title('pressure')
xlabel('x_c')
ylabel('p')
axis tight
grid on; grid minor;

subplot(2,2,3)
plot(xc,T)
title('temperature')
xlabel('x_c')
ylabel('T')
axis tight
grid on; grid minor;

subplot(2,2,4)
plot(xc,U)
title('velocity')
xlabel('x_c')
ylabel('u')
axis tight
grid on; grid minor;

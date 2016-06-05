function visualize(Phi,T)

global A B ker

close all

X = Phi(1,:);
Y = Phi(2,:);

Ker_ex     = X.^2.*Y;

if ker
Ker_num    = KerNum(Phi,T);
end

% Ker_inf    = approxK(X,T);
% Ker_tmod   = tmodelK(X,T);
% Ker_delta  = deltamodelK(X,T);

figure('Position',[100,100,800,400])
subplot(1,2,1)
plot(T,X,T,Y,'LineWidth',2)
legend('species X','species Y')
xlabel('time (A.U.)')
ylabel('Concentration')
title(['(A = ' num2str(A) ', B = ' num2str(B) ')'])

% figure
% plot(T,Ker_ex,'--k',T,Ker_inf,T,Ker_delta,'LineWidth',2)
% xlabel('time (A.U.)')
% ylabel('Memory kernel')
% legend('exact','linearized','linearized (delta-model)')
% title(['Memory kernels: (A = ' num2str(A) ', B = ' num2str(B) ')'])

if ker
subplot(1,2,2)
plot(T,Ker_ex,'--k',T,Ker_num,'LineWidth',2)
xlabel('time (A.U.)')
ylabel('Memory kernel')
legend('exact','numerical')
title(['Brusselator: Memory kernels'])
end
%% Date: Dec 26, 2018
%% Author: Praful D. Mankar 
%% Discription:  This code find the corrected distributions for the n-th nearest BS for user in typical cell with service link distance Ro
%% Reference: [1] Moltchanov, Dmitri. "Distance distributions in random networks." Ad Hoc Networks 10.6 (2012): 1146-1166.


clear all
clc
lam                         = 1;
A                           = sqrt(100/(pi*lam));
N                           = 30;
Iter                        = 100000;
NearestDistancesBS_TypUserInTypCell(A,N,lam,Iter);
load('RnSamples')

%% Correction factors and CDFs of Rn
r                           = 0:0.05:5;
for k                       = 1:N
    FndSIM                  = arrayfun(@(r) sum(NDist_0(:,k)<r)/size(NDist_0,1),r);
    rho(k)                  = CF_MeanMatching(mean(NDist_0(:,k)),lam,k);
    FndANA                  = arrayfun(@(r) gammainc(pi*rho(k)*lam*r^2,k),r);
    figure(1);hold on;plot(r,FndSIM,'b-','linewidth',2);plot(r,FndANA,'--r','linewidth',2);hold off;
end
box on
legend({'Simulation','Approx. Eq. (8)'},'interpreter','latex','fontsize',14,'location','southeast')
xlabel({'$r$'},'interpreter','latex','fontsize',14)
ylabel({'CDF of $R_n$'},'interpreter','latex','fontsize',14)
grid minor
axis([0 5 0 1])
save('rho_n','rho')
%%  mean and variance Rn using approximated CDFs of Rn
muRnSIM             = mean(NDist_0);
n                   = 1:N;
muRnANA             = arrayfun(@(n) gamma(n+0.5)/(gamma(n).*sqrt(pi*lam*rho(n))),n);
[muRnSIM; muRnANA]

varRnSIM           = var(NDist_0);
varRnANA           = arrayfun(@(n) 1/(gamma(n).*pi*lam.*rho(n)).*(gamma(n+1)-gamma(n+0.5).^2./gamma(n)),n);
[varRnSIM; varRnANA]


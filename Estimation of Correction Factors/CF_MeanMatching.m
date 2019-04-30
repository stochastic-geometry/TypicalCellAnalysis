function rho    = CF_MeanMatching(mu,lam,k)

syms x
eqn             = gamma(k+0.5)/(gamma(k).*sqrt(pi*lam*x))==mu;
solx            = solve(eqn,x);
rho             = sym2poly(solx);
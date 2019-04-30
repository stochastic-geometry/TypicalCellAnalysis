function NearestDistancesBS_TypUserInTypCell(A,N,lam,Iter)

NDist_0                     = [];
for k                       = 1:Iter
    k
    NB                      = poissrnd(pi*lam*A^2);
    [x,y]                   = pol2cart(rand(1,NB)*2*pi,sqrt(rand(1,NB))*A);
    BSxy                    = [0 x+1i*y];
    [Vx,Vy]                 = voronoi(real(BSxy),imag(BSxy));
    pts                     = [Vx(1,:)+Vy(1,:)*1i ];
    dist                    = abs(repmat(pts,NB+1,1)-repmat(BSxy.',1,length(pts)));
    ind                     = abs(dist(1,:)-min(dist))<.001;
    pts0                    = pts(ind);
    [dt,~]                  = max(abs(pts0-BSxy(1)));
    [x,y]                   = pol2cart(rand(1,100)*2*pi,dt*sqrt(rand(1,100)));
    ptsb                    = (x+1i*y);
    dist1                   = abs(repmat(ptsb,NB+1,1)-repmat(BSxy.',1,length(ptsb)));
    [~,ind]                 = min(dist1);
    ptsb                    =  ptsb(ind==1);
    if ~isempty(ptsb)
        TypPt               = ptsb(randi(length(ptsb)));
        dist                = sort(abs(TypPt-BSxy));
        NDist_0                 = [NDist_0; dist(:,1:N)];
        %voronoi(real(BSxy),imag(BSxy));axis([-1 1 -1 1]*2);hold on;plot(real(TypPt),imag(TypPt),'*k');plot(0,0,'or');hold off;pause()
    end
end
save(['RnSamples'],'N','NDist_0');

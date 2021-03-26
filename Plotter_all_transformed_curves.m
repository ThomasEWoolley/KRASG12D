ccc
load tz_vec_data_50.mat
n=50;
%%
fs=15;
close all

pop=[];
W=[];
Names=[];
l=1;
figure('position',[0 0 1/2 2/3])
hold on
for iter=1:2:length(z_vec)
    z=z_vec{iter};
    
    for i=1:length(t_vec{iter})
        z1=reshape(z(i,:),2*n,n);
        W(:,:,i)=z1(1:n,:);
    end
    pop{iter}=squeeze(sum(sum(W)));
    
%     plot(t_vec{iter},(max(pop{iter})-pop{iter})/(max(pop{iter})-pop{iter}(1)))

plot(t_vec{iter},log(n^2./pop{iter}-1)-log(n^2./pop{iter}(1)-1))
    Names{l}=['Initial wild-type tissue, ', num2str(round(100*pop{iter}(1)/max(pop{iter}))),'%'];
    l=l+1;
end

% plot(0:20,-[0:20]/4,'k')

xlabel('Time a.u.')
ylabel('$\log\left(\frac{Total\, area}{wild-type\, area}-1\right)-\log\left(\frac{Total\, area}{initial\,wild-type\,area}-1\right)$','interpreter','latex')
% xlim([0 15])
% annotation('rectangle',[0.14 0.2 0.8 0.5],'Color','red')
legend(Names,'Location',[0.15 0.3 0.4 0.3])
set(gca,'fontsize',fs)
% export_fig('../Hogan_latex/Pictures/Transformed.tiff','-r300')
export_fig('../Hogan_latex/Pictures/Swamba_transformed.tiff','-r300')

%%

close all

pop=[];
W=[];
Names=[];
l=1;
figure('position',[0 0 1/2 2/3])
hold on
for iter=15:length(z_vec)
    z=z_vec{iter};
    
    for i=1:length(t_vec{iter})
        z1=reshape(z(i,:),2*n,n);
        W(:,:,i)=z1(1:n,:);
    end
    pop{iter}=squeeze(sum(sum(W)));
    
%     plot(t_vec{iter},(max(pop{iter})-pop{iter})/(max(pop{iter})-pop{iter}(1)))

plot(t_vec{iter}*2,log(n^2./pop{iter}-1)-log(n^2./pop{iter}(1)-1))
    Names{l}=['Initial wild-type tissue, ', num2str(round(100*pop{iter}(1)/max(pop{iter}))),'%'];
    l=l+1;
end

plot(0:20,-[0:20]/4,'k')

xlabel('Time a.u.')
ylabel('$\log\left(\frac{Total\, area}{wild-type\, area}-1\right)-\log\left(\frac{Total\, area}{initial\,wild-type\,area}-1\right)$','interpreter','latex')
axis([0 10 -2 0])

legend(Names,'Location','sw')
set(gca,'fontsize',fs)
% export_fig('../Hogan_latex/Pictures/Zoomed.tiff','-r300')
export_fig('../Hogan_latex/Pictures/SWAMBA_Zoomed.tiff','-r300')
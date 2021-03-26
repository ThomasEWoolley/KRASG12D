clear
close all
clc
load tz_vec_data_100.mat
n=100;
fs=15;

close all
pop=[];
W=[];
% figure('position',[0 0 1/3 .5])
hold on
l=1;
for iter=1:length(z_vec)
    z=z_vec{iter};
    
    for i=1:length(t_vec{iter})
        z1=reshape(z(i,:),2*n,n);
        W(:,:,i)=z1(1:n,:);
    end
    pop{iter}=squeeze(sum(sum(W)));
    
    plot(t_vec{iter},pop{iter}/max(pop{iter}))
    Names{l}=['Initial wild-type tissue, ', num2str(round(100*pop{iter}(1)/max(pop{iter}))),'%'];
    l=l+1;
end
xlabel('Time a.u.')
ylabel('Normalised wild-type tissue area')
xlim([0 15])
legend(Names,'Location','se')
set(gca,'fontsize',fs)
% export_fig('../Hogan_latex/Pictures/Rates.tiff','-r300')
%%
close all
figure('position',[0 0 2/3 1/3])
subplot(1,3,1)
imagesc(W(:,:,1))
axis square
axis off
subplot(1,3,2)
imagesc(W(:,:,5000))
axis square
axis off
subplot(1,3,3)
imagesc(W(:,:,7000))
axis square
axis off
% export_fig('../Hogan_latex/Pictures/Sequence.tiff','-r300')
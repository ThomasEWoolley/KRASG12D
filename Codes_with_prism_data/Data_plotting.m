ccc

if ~exist('z_vec')
    load ../Prism_data/tz_vec_data_4_days
end
T=readtable('../Prism_data/Kras HET over time.csv');
TT=table2array(T);
Bins=TT(:,1);
Week1=TT(~isnan(Bins),2:5);
Bins1=Bins(~isnan(Bins));

Week5=TT(~isnan(Bins),8:13);
Bins2=Bins1(~isnan(mean(Week5,2)));
Week5=Week5(~isnan(mean(Week5,2)),:);
% Week20=TT(:,14:17);
%%
close all
figure('position',[0.1 0 1/3 1/2 ])
m1=mean(Week1,2);
stdm1=std(Week1')';
errorbar(Bins1,m1,stdm1,stdm1,'bx')

hold on
m2=mean(Week5,2);
stdm2=std(Week5')';
errorbar(Bins2,m2,stdm2,stdm2,'rx')

ft = fittype('a*x^b');
[C,gofC] = fit(Bins1,m1,ft, 'StartPoint', [1663 -1]);
[M,gofM] = fit(Bins2,m2,ft, 'StartPoint', [200 -1]);
x=linspace(200, 1e4);
plot(x,C(x),'b--','linewidth',1)
plot(x,M(x),'r--','linewidth',1)


set(gca,'xscale','log')
% set(gca,'yscale','log')
axis([200,1e4,0,11])
xlabel('Cluster size $\left(\mu\textrm{m}^2\right)$')
ylabel('Cluster density $\left(\textrm{mm}^{-2}\right)$')



% The diameters of the circles are 5:5:100, so radii are 20 values that are
% half of these.
% Let each pixel be 1mum^2
% The areas of the circles are then


% j=1;
% for Decay_time=0:0.1:4;
% 
% for i=1:length(z_vec)
%     z=reshape(z_vec{i}(1,:),200,100);
%     Area(i)=sum(sum(z(101:200,:)));
%     Diameter(i)=sqrt(Area(i)/pi)*2;
%     
%     [~,Index]=min(abs(t_vec{i}-Decay_time));
%     z=reshape(z_vec{i}(Index,:),200,100);
%     Evolved_Area(i)=sum(sum(z(101:200,:)));
% end
% I=find(Evolved_Area>200,1);
% Residue(j)=norm(M(Evolved_Area(I:end))-C(Area(I:end)),2);
% j=j+1;
% end

Decay_time=3.5;

for i=1:length(z_vec)
    z=reshape(z_vec{i}(1,:),200,100);
    Area(i)=sum(sum(z(101:200,:)));
    Diameter(i)=sqrt(Area(i)/pi)*2;
    
    [~,Index]=min(abs(t_vec{i}-Decay_time));
    z=reshape(z_vec{i}(Index,:),200,100);
    Evolved_Area(i)=sum(sum(z(101:200,:)));
end
plot(Area,C(Area),'bo')
plot(Evolved_Area,C(Area),'ro')
legend('KrasG12D 7 days (mean$\pm$standard deviation)','KrasG12D 35 days (mean$\pm$standard deviation)','Power law fit 7 days','Power law fit 35 days','7 day distribution used as initial condition','Modelling prediction 35 days')
set(gca,'fontsize',13)
export_fig('Size_density_plot.tiff','-r300')

% plot(Evolved_Area,M(Evolved_Area),'ko')

% %%
% normM(Evolved_Area(6:20))-C(Area(6:20))
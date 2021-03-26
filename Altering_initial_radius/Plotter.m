ccc
load tz_data.mat
n=100;
for i=1:length(t)
z1=reshape(z(i,:),2*n,n);
W(:,:,i)=z1(1:n,:);
end

pop=squeeze(sum(sum(W)));
%%
close all
filename='WT_vs_mutant.gif';
if exist(filename, 'file')==2
    delete(filename);
end
figure('position',[0 0 .5 1/3])
for i=1:20:length(t)
subplot(1,2,1)
imagesc(W(:,:,i))
axis equal
axis off

subplot(1,2,2)
plot(t(1:i),pop(1:i),'r')
hold on
plot(t(1:i),max(pop)-pop(1:i),'g')
colormap([0 1 0;1 0 0])
xlim([0 ceil(t(end-1))])
ylim([0 max(pop)])
xlabel('Arbitrary time')
ylabel('Number of cells')
legend('WT','Mutant')
drawnow


frame = getframe(1);    im = frame2im(frame);    [imind,cm] = rgb2ind(im,256);
    if i == 1;
        imwrite(imind,cm,filename,'gif','Delaytime',0.1, 'Loopcount',inf);
        for j=1:10
            imwrite(imind,cm,filename,'gif','Delaytime',0.1,'WriteMode','append');
        end
    else
        imwrite(imind,cm,filename,'gif','Delaytime',0.1,'WriteMode','append');
    end
     
end
for i=1:10
    imwrite(imind,cm,filename,'gif','Delaytime',0.1,'WriteMode','append');
end
close


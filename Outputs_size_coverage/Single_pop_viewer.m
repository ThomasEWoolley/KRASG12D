close all
clc

for i=1:length(t_vec{1})
z=reshape(z_vec{1}(i,:),n,n);
p(i)=sum(z(:));
% pcolor(z)
% drawnow
end

plot(t_vec{1},p)


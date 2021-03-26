ccc
hold on
load tz_vec_data_fix_rate.mat
for i=1:20
    z_tot=[];
    for j=1:length(t_vec{i})
    z=reshape(z_vec{i}(j,:),200,100);
    z_tot(j)=sum(sum(z(101:200,:)));
    end
plot(t_vec{i},z_tot)

end

load tz_vec_data_4_days.mat
for i=1:20
    z_tot=[];
    for j=1:length(t_vec{i})
    z=reshape(z_vec{i}(j,:),200,100);
    z_tot(j)=sum(sum(z(101:200,:)));
    end
plot(t_vec{i}*10,z_tot,'--')

end

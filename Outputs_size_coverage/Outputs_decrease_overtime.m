clear
close all
clc
load tz_vec_data_100.mat

radii=2.5:2.5:50;
Square_area=100^2;
round(100*(1-pi/100^2*[2.5:2.5:50].^2));
round(100*(pi/100^2*[2.5:2.5:50].^2));

Circle_areas=pi*radii.^2;

How_many=54*min(Circle_areas)./Circle_areas;
%%
close all
semilogx(Circle_areas,How_many,'-*')
%%
Reshaped_z=reshape(z_vec{20}(1,:),200,100);
spy(Reshaped_z);
spy(Reshaped_z(101:200,1:100));
shg
%%
close all
clc
for i=1:length(z_vec)

    Reshaped_z=reshape(z_vec{i}(1,:),200,100);
    Mutant_image=Reshaped_z(101:200,1:100);
    Mut_pop_t1(i)=sum(Mutant_image(:));
end

How_many_data=54*min(Mut_pop_t1)./Mut_pop_t1
semilogx(Mut_pop_t1,How_many_data,'-*')
hold on
Decay_time=2;

for i=1:length(z_vec)
    [~,Index]=min(abs(t_vec{i}-Decay_time));
    Reshaped_z=reshape(z_vec{i}(Index,:),200,100);
    Mutant_image=Reshaped_z(101:200,1:100);
    Mut_pop_td(i)=sum(Mutant_image(:));
end
Density=Mut_pop_td.*54/min(Mut_pop_t1);

semilogx(Mut_pop_td,How_many_data,'-*')

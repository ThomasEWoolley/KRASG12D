
function [t_vec,z_vec] =ssa_infection()
ccc
% Simulate a two-state model of gene expression
import Gillespie.*
p=[];
tspan = [0, 20]; %seconds
n=100;
l=1;
pfun = @(x,p)propensities_2state(x,p,n);
iter=5:5:n;
parfor l=1:length(iter)
    
    
    x0=IC(n,iter(l));
    [stoich_matrix,x0]=Matrices_with_IC(n,x0);
    
    
    [t,z] = directMethod(stoich_matrix, pfun, tspan, x0, p);
    t_vec{l}=t;
    z_vec{l}=z;
end

save('tz_vec_data_100.mat','t_vec','z_vec','n','-v7.3')
end


function a = propensities_2state(x,p,n)
% Return reaction propensities given current state x
z=reshape(x,2*n,n);
W=z(1:n,:);
M=z(n+1:2*n,:);
R=[];L=[];U=[];D=[];
for i=1:n^2
    if i<n^2-n+1
        R = [R;W(i)*M(i+n)];
        L = [L;W(i+n)*M(i)];
    end
    if mod(i,n)~=0
        U = [U;W(i+1)*M(i)];
    end
    if mod(i,n)~=1
        D = [D;W(i-1)*M(i)];
    end
    
end
a=[R;L;U;D;eps];
end
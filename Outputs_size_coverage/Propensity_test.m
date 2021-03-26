ccc
propensities_2state([0 0 0; 0 1 0;0 0 0],1,3)

function a = propensities_2state(x,p,n)
% Return reaction propensities given current state x
W=reshape(x,n,n);

R=[];L=[];U=[];D=[];
for i=1:n^2
    if i<n^2-n+1
        R = [R;W(i)*(1-W(i+n))];
        L = [L;W(i+n)*(1-W(i))];
    end
    if mod(i,n)~=0
        U = [U;W(i+1)*(1-W(i))];
    end
    if mod(i,n)~=1
        D = [D;W(i-1)*(1-W(i))];
    end
    
end
a=[R;L;U;D;eps];
end
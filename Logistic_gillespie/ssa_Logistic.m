ccc

import Gillespie.*
n=1;
Omega=1e3;
p.kR = 10;%0.01;      
p.kP = p.kR/Omega;

%% Initial state
tspan = [0, 1]; %seconds
x0    = n;     %mRNA, protein

%% Specify reaction network
pfun = @propensities_2state;
stoich_matrix = [ 1  
                 -1  ]; %protein decay

%% Run simulation
[t,x] = directMethod(stoich_matrix, pfun, tspan, x0, p);
%[t,x] = firstReactionMethod(stoich_matrix, pfun, tspan, x0, p);

% %% Plot time course
% figure();
% stairs(t,x/Omega); set(gca,'XLim',tspan);
% xlabel('time (s)');
% ylabel('molecules');
% % figure
% % histogram(x/Omega)
% 
% w0=n/Omega;
% f=-w0./(exp(-p.kR*t)*w0-exp(-p.kR*t)-w0);
% hold on
% plot(t,f)
w=x/Omega;
plot(t,log(1./w-1)-log(1./w(1)-1))



function a = propensities_2state(x, p)
% Return reaction propensities given current state x

a = [p.kR*x;            %transcription
     p.kP*x.^2];   %protein decay
end

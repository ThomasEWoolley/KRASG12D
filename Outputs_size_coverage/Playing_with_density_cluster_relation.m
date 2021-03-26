ccc

r=linspace(0.1,10,1e3);
A=@(t)exp(-2*pi*t);
T=linspace(0,0.5/pi,2);
s='*od^x';
i=1;
for t=T
semilogx(pi*r.^2*A(t),1./(pi*r.^2)*1./A(t).^.5);%,s(i));
hold on
axis([0 3 0 50]);
drawnow
i=i+1;
end

legend('start','finish')
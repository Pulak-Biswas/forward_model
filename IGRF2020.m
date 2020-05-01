% plot of logRn vs n
clear all
data=importdata('IGRF2020.dat');
n1=data(1,1):data(end,1);

for n=1:(data(end,1))
    [r,c]=find(data(:,1)==n);
    Rn(n,1)=(n+1)*sum(data(r,2).^2);
end
plot(n1,log10(Rn),'ok')
grid on, hold on


P=polyfit(n1',log10(Rn),1);
y1=polyval(P,n1);
plot(n1,y1','r')
title('Power Spectrum IGRF2020')
xlabel('n\rightarrow'),ylabel('log(Rn)\rightarrow')

% Contact body
clear all,close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CF = 100; %Amplitude coefficient
tht = [0,pi/6,pi/4,pi/3,pi/2]; %arbitrary magnetization angle
h = [5,10, 15]; %(Depth to the center of the body)
x = -20:2:20; % Distance of the pt of obs from origin

for k=1:length(tht)
    figure(k)
    for i=1:length(h)
        for j=1:length(x)
            delF(j,k,i)= CF*(((atan(h(i)/x(j))+pi/2)*cos(tht(k))+...
            (log(sqrt(x(j)^2 + h(i)^2)))*sin(tht(k))));
        end
        plot(x,delF(:,k,i))
        hold on, grid on
    end
    leg=legend({'5 units','10 units','15 units'},'Location','southeast');
    title(leg,'Depths')
    if k>1
    str=sprintf('%s/%d','\pi',pi/tht(k));
    title(['Depthwise variation for a const theta=',str])
    else
    title(['Depthwise variation for a const theta=',num2str(tht(k))])
    end
    xlabel('Distannce(m)\rightarrow'),ylabel('delF\rightarrow')
end

figure()
plot(x,delF(:,:,2))
grid on
leg=legend({'0','pi/6','pi/4','pi/3','pi/2'},'Location','southeast');
title(leg,'Theta')
title(['Variation w.r.t dir^n of magnetization for a const depth=',num2str(10),'units'])
xlabel('Distannce(m)\rightarrow'),ylabel('delF\rightarrow')

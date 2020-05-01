% Dike model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$$$$$$

clear all,close all
CF = 100; %[=2*J*sin(tht)](amplitude coefficient)
Q = [0,30,60,90]; %(arbitrary angle of magnetisation)
Z = [5, 10] ; %in m (depth to the centre of the body)
T = [10, 50]; %in m (width of the dyke)
x = -100:10:100; %in m (Distance of the pt of obs from origin)

for k=1:length(Q)
    figure(k)
    for l=1:length(T)
    for i=1:length(Z)
        for j=1:length(x)    
        F(j,k,l,i)=CF*((atan((x(j)+T(l))/Z(i))-atan((x(j)-T(l))/Z(i)))*cosd(Q(k))+...
        (log(((x(j)+T(l))^2+Z(i)^2)/((x(j)-T(l))^2+Z(i)^2))*sind(Q(k))));
        end
        subplot(2,1,1)
        plot(x,F(:,k,l,i))
        hold on, grid on,
    end
        hold off
        title(['Depthwise variation for a const Q=',num2str(Q(k))])
        leg=legend({'5 m','10 m'},'Location','southeast');
        title(leg,'Depths')
        xlabel('Distannce(m)\rightarrow'),ylabel('F\rightarrow')
        subplot(2,1,2)
        plot(x,F(:,k,l,i))
        hold on, grid on
    end
    leg=legend({'10 m','50 m'},'Location','southeast');
    title(leg,'Widths')
    title(['Depthwise variation for a const Q=',num2str(Q(k))])
    xlabel('Distannce(m)\rightarrow'),ylabel('F\rightarrow')
    title(['Variation w.r.t width of magnetization for a const Q=',num2str(Q(k))])
end

figure()
V=F(:,:,2,1);
plot(x,V)
grid on
leg=legend({'0','30','60','90'},'Location','southeast');
title(leg,'Q')
title(['Variation w.r.t dir^n of magnetisation for const depth=',...
    num2str(Z(1)),'m and const Width=',num2str(T(2)),'m'])
xlabel('Distannce(m)\rightarrow'),ylabel('F\rightarrow')

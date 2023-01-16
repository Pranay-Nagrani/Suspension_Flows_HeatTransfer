% 675 um, gamma = 3/s, c=0.3, 323K-293K %
clc; clear all; close all;
        
[status,cmdout] = system('pwd');

% Particle concentration %
cd('files');
files = ["cell80_radial_phi.csv","cell120_radial_phi.csv","cell160_radial_phi.csv"];


 figure(1)
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    if i==1
        plot((s(:,50)-0.05)./0.012,s(:,30)./0.68,'--k');
        hold on;
    elseif i==2
         plot((s(:,50)-0.05)./0.012,s(:,30)./0.68,'-.b');
         hold on;   
    else
         plot((s(:,50)-0.05)./0.012,s(:,30)./0.68,'-g');   
    end
end

xlabel('$(r-R_{\rm in})/(R_{\rm out}-R_{\rm in})$','Interpreter','latex','FontSize',35);
ylabel('$\phi/\phi_{\rm m}$','Interpreter','latex','FontSize',35);
leg1 = legend('$N_{\rm cells}=80$','$N_{\rm cells}=120$','$N_{\rm cells}=180$','Interpreter','latex');
legend boxoff;
leg1.FontSize = 30;
set(gca,'FontSize',32);
set(findall(gca,'Type','Line'),'Linewidth',3)
cd('../');


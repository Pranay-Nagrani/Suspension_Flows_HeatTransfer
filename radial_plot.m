% 675 um, gamma = 3/s, c=0.3, 323K-293K %
clc; clear all; close all;

calpha = [  [255 255 204];
            [255 237 160];
            [254 217 118];
            [254 178 76];
            [253 141 60];
            [252 78 42];
            [227 26 28];
            [189 0 38];
            [128 0 38]];
        

[status,cmdout] = system('pwd');

% Particle concentration %

cd('phi_b_variation_case-1'); 
files = ["radial_phi_c10.csv","radial_phi_c15.csv","radial_phi_c20.csv","radial_phi_c25.csv",...
 "radial_phi_c30.csv","radial_phi_c35.csv","radial_phi_c40.csv",...
"radial_phi_c45.csv","radial_phi_c50.csv"];

% cd('phi_b_variation_case-2'); 
% files = ["radial_phi_inv_c10.csv","radial_phi_inv_c15.csv","radial_phi_inv_c20.csv","radial_phi_inv_c25.csv",...
%    "radial_phi_inv_c30.csv","radial_phi_inv_c35.csv","radial_phi_inv_c40.csv",...
%    "radial_phi_inv_c45.csv","radial_phi_inv_c50.csv"];

 figure(1)
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    plot((s(:,50)-0.05)./0.012,s(:,30)./0.68,'color',calpha(i,:)./255);
    hold on;
end
ylim([0 0.95]);
% xlabel('$(r-R_{in})/(R_{out}-R_{in})$','Interpreter','latex','FontSize',35);
% ylabel('${\it} \phi/\phi_{m}$','Interpreter','latex','FontSize',35);
% leg1 = legend('\phi_b = 0.10','','','',...
%     '','','','','\phi_b = 0.50');
% %legend boxoff;
% leg1.FontSize = 30;
set(gca,'FontSize',32);
set(findall(gca,'Type','Line'),'Linewidth',3)
cd('../');

calpha1 = [  [153 179 255];
            [128 159 255];
            [102 140 255];
            [77 121 255];
            [51 102 255];
            [20 83 255];
            [0 64 255];
            [0 57 230];
            [0 51 204]];

cd('phi_b_variation_case-2'); 
files = ["radial_phi_inv_c10.csv","radial_phi_inv_c15.csv","radial_phi_inv_c20.csv","radial_phi_inv_c25.csv",...
   "radial_phi_inv_c30.csv","radial_phi_inv_c35.csv","radial_phi_inv_c40.csv",...
   "radial_phi_inv_c45.csv","radial_phi_inv_c50.csv"];

for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    plot((s(:,50)-0.05)./0.012,s(:,30)./0.68,'--','color',calpha1(i,:)./255);
    hold on;
end
xlabel('$(r-R_{\rm in})/(R_{\rm out}-R_{\rm in})$','Interpreter','latex','FontSize',35);
ylabel('${\it} \phi/\phi_{\rm m}$','Interpreter','latex','FontSize',35);
% leg2 = legend('\phi_b = 0.10','\phi_b = 0.15','\phi_b = 0.20','\phi_b = 0.25',...
%     '\phi_b = 0.30','\phi_b = 0.35','\phi_b = 0.40','\phi_b = 0.45','\phi_b = 0.50');
% %legend boxoff;
% leg2.FontSize = 30;
text([0.1 0.1],[0.9 0.8],{'$\Delta T > 0$','$\Delta T < 0$'},'Interpreter','latex','FontSize',32);
set(gca,'FontSize',32);
set(findall(gca,'Type','Line'),'Linewidth',3)


figure(2)
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    temp = zeros(length(s(:,1)),1);
    temp = s(:,30).*s(:,8) + s(:,28).*s(:,7);
    plot((s(:,50)-0.05)./0.012,temp,'color',calpha(i,:)./255);
    hold on;
end
xlabel('$(r-R_{in})/(R_{out}-R_{in})$','Interpreter','latex','FontSize',35);
ylabel('${\it} T$ (K)','Interpreter','latex','FontSize',35);
leg = legend('\phi_b = 0.10','\phi_b = 0.15','\phi_b = 0.20','\phi_b = 0.25',...
    '\phi_b = 0.30','\phi_b = 0.35','\phi_b = 0.40','\phi_b = 0.45','\phi_b = 0.50');
%legend boxoff;
leg.FontSize = 30;
set(gca,'FontSize',32);
set(findall(gca,'Type','Line'),'Linewidth',3)
cd('../')

% Shear Rate Radial Plot %


cd('shear_rate_variation_case_1_phib_0.5'); 
files = ["radial_phi_gamma1.csv","radial_phi_gamma2.csv","radial_phi_gamma3.csv","radial_phi_gamma4.csv",...
    "radial_phi_gamma5.csv","radial_phi_gamma6.csv","radial_phi_gamma7.csv","radial_phi_gamma8.csv"];

figure(3)
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    plot((s(:,50)-0.05)./0.012,s(:,30)./0.68,'color',calpha(i,:)./255);
    hold on;   
end
% xlabel('$(r-R_{in})/(R_{out}-R_{in})$','Interpreter','latex','FontSize',35);
% ylabel('${\it} \phi/\phi_{m}$','Interpreter','latex','FontSize',35);
% ylim([0.35 0.5]);
% leg1 = legend('$\dot{\gamma} = 1$ 1/s','$\dot{\gamma} = 2$ 1/s','$\dot{\gamma} = 3$ 1/s','$\dot{\gamma} = 4$ 1/s'...
%     ,'$\dot{\gamma} = 5$ 1/s','$\dot{\gamma} = 6$ 1/s','$\dot{\gamma} = 7$ 1/s','$\dot{\gamma} = 8$ 1/s','Interpreter','latex');
leg1.FontSize = 30;
% set(gca,'FontSize',32);
% set(findall(gca,'Type','Line'),'Linewidth',3)
cd('../');

cd('shear_rate_variation_case-2_phib_0.5_partialSlip'); 
files = ["radial_phi_inv_gamma1.csv","radial_phi_inv_gamma2.csv","radial_phi_inv_gamma3.csv",...
    "radial_phi_inv_gamma4.csv","radial_phi_inv_gamma5.csv","radial_phi_inv_gamma6.csv",...
    "radial_phi_inv_gamma7.csv","radial_phi_inv_gamma8.csv"];
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    if i==1
        plot((s(:,46)-0.05)./0.012,s(:,30)./0.68,'--','color',calpha1(i,:)./255);
        hold on; 
    else
        plot((s(:,43)-0.05)./0.012,s(:,30)./0.68,'--','color',calpha1(i,:)./255);
        hold on;
    end
       
end
xlabel('$(r-R_{\rm in})/(R_{\rm out}-R_{\rm in})$','Interpreter','latex','FontSize',35);
ylabel('${\it} \phi/\phi_{\rm m}$','Interpreter','latex','FontSize',35);
%ylim([0.35 0.5]);
% leg2 = legend('$\dot{\gamma} = 1$ 1/s','$\dot{\gamma} = 2$ 1/s','$\dot{\gamma} = 3$ 1/s','$\dot{\gamma} = 4$ 1/s'...
%     ,'$\dot{\gamma} = 5$ 1/s','$\dot{\gamma} = 6$ 1/s','$\dot{\gamma} = 7$ 1/s','$\dot{\gamma} = 8$ 1/s','Interpreter','latex');
% leg2.FontSize = 30;
text([0.1 0.1],[0.76 0.75],{'$\Delta T > 0$','$\Delta T < 0$'},'Interpreter','Latex','FontSize',35)
set(gca,'FontSize',32);
set(findall(gca,'Type','Line'),'Linewidth',3)


figure(4)
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    temp = zeros(length(s(:,1)),1);
    temp = s(:,30).*s(:,8) + s(:,28).*s(:,7);
    if i==1
        plot((s(:,46)-0.05)./0.012,temp,'color',calpha(i,:)./255);
        hold on;
    else
        plot((s(:,43)-0.05)./0.012,temp,'color',calpha(i,:)./255);
        hold on;
    end
end
xlabel('$(r-R_{in})/(R_{out}-R_{in})$','Interpreter','latex','FontSize',35);
ylabel('${\it} T$ (K)','Interpreter','latex','FontSize',35);
leg = legend('$\dot{\gamma} = 1$ 1/s','$\dot{\gamma} = 2$ 1/s','$\dot{\gamma} = 3$ 1/s','$\dot{\gamma} = 4$ 1/s'...
    ,'$\dot{\gamma} = 5$ 1/s','$\dot{\gamma} = 6$ 1/s','$\dot{\gamma} = 7$ 1/s','$\dot{\gamma} = 8$ 1/s','Interpreter','latex');
leg.FontSize = 20;
set(gca,'FontSize',32);
set(findall(gca,'Type','Line'),'Linewidth',3)
cd('../')

% Temperature Difference %
cd('deltaT_variation_phib_0.5_case-1');

files = ["radial_phi_0delta.csv","radial_phi_5delta.csv","radial_phi_10delta.csv","radial_phi_15delta.csv",...
    "radial_phi_20delta.csv","radial_phi_25delta.csv","radial_phi_30delta.csv"]; 
 figure(5)
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    if i==1
        plot((s(:,50)-0.05)./0.012,s(:,30)./0.68,'--k');
    else
        plot((s(:,50)-0.05)./0.012,s(:,30)./0.68,'color',calpha(i,:)./255);
    end
    hold on;
end
% xlabel('$(r-R_{in})/(R_{out}-R_{in})$','Interpreter','latex','FontSize',35);
% ylabel('${\it} \phi/\phi_{m}$','Interpreter','latex','FontSize',35);
% leg = legend('\Delta T = 0','\Delta T = 5','\Delta T = 10','\Delta T = 15','\Delta T = 20','\Delta T = 25','\Delta T = 30');
% %legend boxoff;
% leg.FontSize = 30;
% set(gca,'FontSize',32);
% set(findall(gca,'Type','Line'),'Linewidth',3);
cd('../')

cd('deltaT_variation_phib_0.5_case-2');

files = ["radial_phi_inv_5delta.csv","radial_phi_inv_10delta.csv","radial_phi_inv_15delta.csv",...
    "radial_phi_inv_20delta.csv","radial_phi_inv_25delta.csv","radial_phi_inv_30delta.csv"]; 
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    plot((s(:,50)-0.05)./0.012,s(:,30)./0.68,'--','color',calpha1(i,:)./255);
    hold on;
end
xlabel('$(r-R_{\rm in})/(R_{\rm out}-R_{\rm in})$','Interpreter','latex','FontSize',35);
ylabel('${\it} \phi/\phi_{\rm m}$','Interpreter','latex','FontSize',35);
%leg = legend('\Delta T = 0','\Delta T = 5','\Delta T = 10','\Delta T = 15','\Delta T = 20','\Delta T = 25','\Delta T = 30');
%legend boxoff;
%leg.FontSize = 30;
text([0.1 0.1],[0.76 0.75],{'$\Delta T > 0$','$\Delta T < 0$'},'Interpreter','Latex','FontSize',35)
set(gca,'FontSize',32);
set(findall(gca,'Type','Line'),'Linewidth',3);
cd('../')

% % Particle Diameter Radial Plot %

cd('diameter_variation_case_1_phib_0.5');       
files =  ["radial_phi_dp0.5mm.csv","radial_phi_dp0.75mm.csv","radial_phi_dp1mm.csv","radial_phi_dp1.25mm.csv","radial_phi_dp1.5mm.csv"];

% cd('diameter_variation_case_2_phib_0.5');       
% files =  ["radial_phi_inv_dp0.5mm.csv","radial_phi_inv_dp0.75mm.csv","radial_phi_inv_dp1mm.csv","radial_phi_inv_dp1.25mm.csv",...
%     "radial_phi_inv_dp1.5mm.csv"];
figure(6)
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    plot((s(:,50)-0.05)./0.012,s(:,30)./0.68,'color',calpha(i,:)./255);
    hold on;
end
% xlabel('$(r-R_{in})/(R_{out}-R_{in})$','Interpreter','latex','FontSize',35);
% ylabel('${\it} \phi/\phi_{m}$','Interpreter','latex','FontSize',35);
% %ylim([0.3 0.55]);
% leg = legend('$d_p$ = 0.5 mm','$d_p$ = 0.75 mm','$d_p$ = 1 mm','$d_p$ = 1.25 mm','$d_p$ = 1.5 mm','Interpreter','latex');
% leg.FontSize = 30;
% set(gca,'FontSize',32);
% set(findall(gca,'Type','Line'),'Linewidth',3);

cd('../');

cd('diameter_variation_case_2_phib_0.5');       
files =  ["radial_phi_inv_dp0.5mm.csv","radial_phi_inv_dp0.75mm.csv","radial_phi_inv_dp1mm.csv","radial_phi_inv_dp1.25mm.csv",...
    "radial_phi_inv_dp1.5mm.csv"];
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    plot((s(:,50)-0.05)./0.012,s(:,30)./0.68,'--','color',calpha1(i,:)./255);
    hold on;
end
xlabel('$(r-R_{\rm in})/(R_{\rm out}-R_{\rm in})$','Interpreter','latex','FontSize',35);
ylabel('${\it} \phi/\phi_{\rm m}$','Interpreter','latex','FontSize',35);
%ylim([0.3 0.55]);
% leg = legend('$d_p$ = 0.5 mm','$d_p$ = 0.75 mm','$d_p$ = 1 mm','$d_p$ = 1.25 mm','$d_p$ = 1.5 mm','Interpreter','latex');
% leg.FontSize = 30;
text([0.1 0.1],[0.76 0.75],{'$\Delta T > 0$','$\Delta T < 0$'},'Interpreter','latex','FontSize',35)
set(gca,'FontSize',32);
set(findall(gca,'Type','Line'),'Linewidth',3);

figure(7)
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    temp = zeros(length(s(:,1)),1);
    temp = s(:,30).*s(:,8) + s(:,28).*s(:,7);
    plot((s(:,50)-0.05)./0.012,temp,'color',calpha(i,:)./255);
    hold on;
end
xlabel('$(r-R_{in})/(R_{out}-R_{in})$','Interpreter','latex','FontSize',35);
ylabel('${\it} T$ (K)','Interpreter','latex','FontSize',35);
leg = legend('$d_p$ = 0.5 mm','$d_p$ = 0.75 mm','$d_p$ = 1 mm','$d_p$ = 1.25 mm','$d_p$ = 1.5 mm','Interpreter','latex'); %,'Pure Conduction Model');
leg.FontSize = 20;
set(gca,'FontSize',32);
set(findall(gca,'Type','Line'),'Linewidth',3)
cd('../')

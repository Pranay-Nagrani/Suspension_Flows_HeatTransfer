clc; clear all; close all;
h = [];
%dr = [0.019;0.0209;0.0228;0.0247;0.0266;0.0285;0.0304;0.0323;0.0342];
k = 0.3*35.5 + 0.7*0.065;
ro = 0.0254;
ri = 0.0064;
[status,cmdout] = system('pwd');

%cd('ECC_results_muF_within_divergence');
cd('ECC_new');
ecc = [0;0.1;0.2;0.3;0.4;0.5;0.6];
e = ecc.*(ro-ri);
%dr = e + (ro-ri);
dr = ro - ri;
% particle_flux = [];
% particle_vol_frac = [];
% particle_grad = [];
figure(1)

files = ["inner_E00.csv","inner_E01.csv","inner_E02.csv","inner_E03.csv","inner_E04.csv"...
    "inner_E05.csv","inner_E06.csv"];

for i=1:length(files)
    q_local = zeros(200,1);
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    q_local = 35.5.*abs(s(:,30)).*abs(s(:,47)) + 0.065.*abs(s(:,28)).*abs(s(:,46));
   
    q = sum(q_local)/length(s(:,1));
    h_temp = q/30;
    h = [h;h_temp];
end
Nu = h.*dr/k;
plot(ecc,Nu,'ob','MarkerSize',15,'MarkerFaceColor','b'); %10
hold on;

h_inv = [];

files = ["outer_E00.csv","outer_E01.csv","outer_E02.csv","outer_E03.csv","outer_E04_new.csv",...
    "outer_E05.csv","outer_E06_new.csv"];

for i=1:length(files)
    q_local = zeros(200,1);
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    q_local = 35.5.*abs(s(:,30)).*abs(s(:,47)) + 0.065.*abs(s(:,28)).*abs(s(:,46));
%      particle_vol_frac = [particle_vol_frac;sum(abs(s(:,30)))/200];
%     particle_grad = [particle_grad;sum(abs(s(:,47)))/200];
%     particle_flux = [particle_flux;sum(35.5.*abs(s(:,30)).*abs(s(:,47)))/200];
    q = sum(q_local)/length(s(:,1));
    h_temp_inv = q/30;
    h_inv = [h_inv;h_temp_inv];
end
h_inv_in = h_inv.*ro/ri;
Nu_inv_in = h_inv_in.*dr./k;
plot(ecc,Nu_inv_in,'ok','MarkerSize',15,'MarkerFaceColor','k'); %12
xlabel('$E$','Interpreter','latex','FontSize',35);
ylabel('$Nu$','Interpreter','Latex','FontSize',35);
leg = legend('$\Delta T > 0$','$\Delta T < 0$','Interpreter','Latex');
leg.FontSize = 35; 
set(findall(gca,'Type','Line'),'Linewidth',3); 
set(gca,'FontSize',32);
cd('../');

cd('ECC-part_1');
figure(2)
h_fc = [];
files = ["E00_FC.csv","E01_FC.csv","E02_FC.csv","E03_FC.csv","E04_FC.csv","E05_FC.csv"...
    "E06_FC.csv"]; 
for i=1:length(files)
    q_local = zeros(200,1);
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    q_local = 0.065.*abs(s(:,7));
    q = sum(q_local)/length(s(:,1));
    h_temp_fc = q/30;
    h_fc = [h_fc;h_temp_fc];
end
Nu_fc = h_fc.*dr/k;
plot(ecc,Nu./Nu_fc,'ob','MarkerSize',15,'MarkerFaceColor','b');
hold on;

h_inv_fc = [];
files = ["inverseE00_FC.csv","inverseE01_FC.csv","inverseE02_FC.csv","inverseE03_FC.csv","inverseE04_FC.csv",...
    "inverseE05_FC.csv","inverseE06_FC.csv"];
for i=1:length(files)
    q_local = zeros(200,1);
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    q_local = 0.065.*abs(s(:,7));
    q = sum(q_local)/length(s(:,1));
    h_temp_fc = q/30;
    h_inv_fc = [h_inv_fc;h_temp_fc];
end
h_inv_fc_in = h_inv_fc.*ro/ri;
Nu_inv_fc_in = h_inv_fc_in.*dr/k;
plot(ecc,Nu_inv_in./Nu_inv_fc_in,'ok','MarkerSize',15,'MarkerFaceColor','k'); % sr 18

cd('../')
xlabel('$E$','Interpreter','latex','FontSize',35);
ylabel('$Nu_{\rm sus}/Nu_{\rm fc}$','Interpreter','latex','FontSize',35);
leg = legend('$\Delta T > 0$','$\Delta T < 0$','Interpreter','Latex');
leg.FontSize = 35; 
%legend boxoff;
set(findall(gca,'Type','Line'),'Linewidth',3);  %2
set(gca,'FontSize',32); %20




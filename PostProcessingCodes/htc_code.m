% 675 um, 3/s, c=0.3 (new is increased radial mesh elements)  %

clc; clear all; close all;
dr = 0.012;
rin = 0.05;
rout = 0.062;

% Particle Concentration Variation %
c = [0.1;0.15;0.2;0.25;0.3;0.35;0.4;0.45;0.5];
ksus = 35.5.*c + 0.065.*(1-c);
[status,cmdout] = system('pwd');
cd('phi_b_variation_case-1');  
htc_c_in = [];
files = ["inner_c10.csv","inner_c15.csv","inner_c20.csv","inner_c25.csv",...
 "inner_c30.csv","inner_c35.csv","inner_c40.csv",...
"inner_c45.csv","inner_c50.csv"];

for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    h_temp_c = (35.5*abs(s(82,30))*abs(s(82,37)) + 0.065*abs(s(82,28))*abs(s(82,35)))/30; % 82 = (83-1) (csvread) is point 0.05,0,0 (In CCC, axisymmetry is assumed)
    htc_c_in = [htc_c_in;h_temp_c];
end
figure(1)
Nu_c_in = htc_c_in.*dr./ksus;
plot(c./0.68,Nu_c_in,'ob','MarkerSize',15,'MarkerFaceColor','b');
hold on; 
cd('../');

cd('phi_b_variation_case-2');
htc_c_inv_out = [];
files = ["outer_c10.csv","outer_c15.csv","outer_c20.csv","outer_c25.csv",...
 "outer_c30.csv","outer_c35.csv","outer_c40.csv",...
"outer_c45.csv","outer_c50.csv"];
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    h_temp_c = (35.5*abs(s(82,30))*abs(s(82,37)) + 0.065*abs(s(82,28))*abs(s(82,35)))/30; % 82 = (83-1) (csvread) is point 0.062,0,0 (In CCC, axisymmetry is assumed)
    htc_c_inv_out = [htc_c_inv_out;h_temp_c];
end

htc_c_inv_in = htc_c_inv_out.*rout/rin;
Nu_c_inv_in = htc_c_inv_in.*dr./ksus;
plot(c./0.68,Nu_c_inv_in,'sk','MarkerSize',18,'MarkerFaceColor','k');
%leg = legend('$T_{in} = 323$ K, $T_{out} = 293$ K','$T_{in} = 293$ K, $T_{out} = 323$ K','Interpreter','latex');
leg = legend('$\Delta T > 0$','$\Delta T < 0$','Interpreter','Latex');
leg.FontSize = 35;
xlabel('$\phi_{\rm b} / \phi_{\rm m}$','Interpreter','Latex','FontSize',35);
%ylabel('${\it} h_{sus}/h_{fc}$','Interpreter','latex','FontSize',35);
ylabel('$Nu$','Interpreter','Latex','FontSize',35);
set(findall(gca,'Type','Line'),'Linewidth',3);
set(gca,'FontSize',32);
cd('../');

% Shear Rate Variation %
k_suspension = 35.5*0.5 + 0.065*0.5;
cd('shear_rate_variation_case_1_phib_0.5');  
gamma = [1;2;3;4;5;6;7;8];
htc_N_in = [];
files = ["inner_gamma1.csv","inner_gamma2.csv","inner_gamma3.csv","inner_gamma4.csv",...
    "inner_gamma5.csv","inner_gamma6.csv","inner_gamma7.csv","inner_gamma8.csv"];
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    h_temp_N = (35.5*abs(s(82,30))*abs(s(82,37)) + 0.065*abs(s(82,28))*abs(s(82,35)))/30; % 82 = (83-1) (csvread) is point 0.05,0,0 (In CCC, axisymmetry is assumed)
    htc_N_in = [htc_N_in;h_temp_N];
end
Nu_N_in = htc_N_in.*dr./k_suspension;
figure(3)
plot(gamma./8,Nu_N_in,'ob','MarkerSize',15,'MarkerFaceColor','b'); %10
hold on;
cd('../');

cd('shear_rate_variation_case_2_phib_0.5');
htc_N_inv_out = [];
files = ["outer_gamma1.csv","outer_gamma2.csv","outer_gamma3.csv","outer_gamma4.csv",...
    "outer_gamma5.csv","outer_gamma6.csv","outer_gamma7.csv","outer_gamma8.csv"];
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    h_temp_N = (35.5*abs(s(82,30))*abs(s(82,37)) + 0.065*abs(s(82,28))*abs(s(82,35)))/30; % 62 = (63-1) (csvread) is point 0.062,0,0 (In CCC, axisymmetry is assumed)
    htc_N_inv_out = [htc_N_inv_out;h_temp_N];
end


htc_N_inv_in = htc_N_inv_out.*rout/rin;
Nu_N_inv_in = htc_N_inv_in.*dr./k_suspension;
plot(gamma./8,Nu_N_inv_in,'sk','MarkerSize',18,'MarkerFaceColor','k');

xlabel('$\dot{\gamma}$ / $\dot{\gamma}_{\rm max}$','Interpreter','latex','FontSize',35); 
ylabel('$Nu$','Interpreter','latex','FontSize',35); 
%leg = legend('$T_{in} = 323$ K, $T_{out} = 293$ K','$T_{in} = 293$ K, $T_{out} = 323$ K','Interpreter','latex');
leg = legend('$\Delta T > 0$','$\Delta T < 0$','Interpreter','latex');
leg.FontSize = 35;
set(findall(gca,'Type','Line'),'Linewidth',3); 
set(gca,'FontSize',32);  
% axes('Position',[.21 .3 .34 .34]) % .2 .3 .35 .35
% plot(gamma,htc_N_in,'ob','MarkerSize',10,'MarkerFaceColor','b');
% xlabel('$\dot{\gamma}$ (1/s)','Interpreter','latex','FontSize',15);
% ylabel('{\it h} (W/m^2K)','FontSize',15);
% set(findall(gca,'Type','Line'),'Linewidth',3); %2
% set(gca,'FontSize',15);
cd('../')

% Temperature Difference %
cd('deltaT_variation_phib_0.5_case-1'); 
dT = [0;5;10;15;20;25;30];
htc_dT_in = [];
files =  ["inner_delta0.csv","inner_delta5.csv","inner_delta10.csv","inner_delta15.csv",...
    "inner_delta20.csv","inner_delta25.csv","inner_delta30.csv"];
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    h_temp_dT = (35.5*abs(s(82,30))*abs(s(82,37)) + 0.065*abs(s(82,28))*abs(s(82,35)))/dT(i); % 82 = (83-1) (csvread) is point 0.05,0,0 (In CCC, axisymmetry is assumed)
    htc_dT_in = [htc_dT_in;h_temp_dT];
end
Nu_dT_in = htc_dT_in.*dr./k_suspension;
figure(4)
plot(dT,Nu_dT_in,'ob','MarkerSize',15,'MarkerFaceColor','b');
hold on;
cd('../');

cd('deltaT_variation_phib_0.5_case-2'); 
dT = [5;10;15;20;25;30];
htc_dT_out = [];
files =  ["outer_delta5.csv","outer_delta10.csv","outer_delta15.csv",...
    "outer_delta20.csv","outer_delta25.csv","outer_delta30.csv"];
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    h_temp_dT = (35.5*abs(s(82,30))*abs(s(82,37)) + 0.065*abs(s(82,28))*abs(s(82,35)))/dT(i); % 82 = (83-1) (csvread) is point 0.05,0,0 (In CCC, axisymmetry is assumed)
    htc_dT_out = [htc_dT_out;h_temp_dT];
end
htc_dT_inv_in = htc_dT_out.*rout/rin;
Nu_dT_inv_in = htc_dT_inv_in.*dr./k_suspension;
plot(dT,Nu_dT_inv_in,'sk','MarkerSize',18,'MarkerFaceColor','k');
xlabel('$\Delta T$ (K)','Interpreter','latex','FontSize',35); %20
ylabel('$Nu$','Interpreter','Latex','FontSize',35); %20;
%ylim([1600 1700]);
%leg = legend('$T_{in} = 323$ K, $T_{out} = 293$ K','$T_{in} = 293$ K, $T_{out} = 323$ K','Interpreter','latex');
leg = legend('$\Delta T > 0$','$\Delta T < 0$','Interpreter','latex');
leg.FontSize = 35;
set(findall(gca,'Type','Line'),'Linewidth',3); %2
set(gca,'FontSize',32);  %20
cd('../');

% Particle Diameter Variation %
cd('diameter_variation_case_1_phib_0.5'); 
d_new = [0.5;0.75;1;1.25;1.5];
htc_d_in = [];
files =  ["inner_dp0.5mm.csv","inner_dp0.75mm.csv","inner_dp1mm.csv","inner_dp1.25mm.csv","inner_dp1.5mm.csv"];
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    h_temp_d = (35.5*abs(s(82,30))*abs(s(82,37)) + 0.065*abs(s(82,28))*abs(s(82,35)))/30; % 82 = (83-1) (csvread) is point 0.05,0,0 (In CCC, axisymmetry is assumed)
    htc_d_in = [htc_d_in;h_temp_d];
end
figure(5)
Nu_d_in = htc_d_in.*dr./k_suspension;
plot(d_new.*10^(-3)./dr,Nu_d_in,'ob','MarkerSize',15,'MarkerFaceColor','b');
hold on;

cd('../');
cd('diameter_variation_case_2_phib_0.5'); 

htc_d_inv_out = [];
files = ["outer_dp0.5mm.csv","outer_dp0.75mm.csv",...
    "outer_dp1mm.csv","outer_dp1.25mm.csv","outer_dp1.5mm.csv"];  
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    h_temp_d = (35.5*abs(s(82,30))*abs(s(82,37)) + 0.065*abs(s(82,28))*abs(s(82,35)))/30; % 82 = (83-1) (csvread) is point 0.062,0,0 (In CCC, axisymmetry is assumed)
    htc_d_inv_out = [htc_d_inv_out;h_temp_d];
end


htc_d_inv_in = htc_d_inv_out.*rout/rin;
Nu_d_inv_in = htc_d_inv_in.*dr./k_suspension;
plot(d_new.*10^(-3)./dr,Nu_d_inv_in,'sk','MarkerSize',15,'MarkerFaceColor','k');
xlabel('$ {\it d_p}/ \Delta r$','Interpreter','latex','FontSize',35); %32
% xlim([0.2 1.6])
% ylim([0 1000])
ylabel('$Nu$','Interpreter','Latex','FontSize',35); %32
%ylabel('${\it} h_{sus}/h_{fc}$','Interpreter','latex','FontSize',35);
%leg = legend('$T_{in} = 323$ K, $T_{out} = 293$ K','$T_{in} = 293$ K, $T_{out} = 323$ K','Interpreter','latex');
leg = legend('$\Delta T > 0$','$\Delta T < 0$','Interpreter','latex');
leg.FontSize = 35;
set(findall(gca,'Type','Line'),'Linewidth',3);
set(gca,'FontSize',32); %30

% axes('Position',[.21 .3 .34 .34]) % .35 .35
% plot(d_new,htc_d_in,'ob','MarkerSize',10,'MarkerFaceColor','b');
% xlabel('$ {\it}d_p$ (mm)','Interpreter','latex','FontSize',15);
% ylabel('{\it h} (W/m^2K)','FontSize',15);
% set(findall(gca,'Type','Line'),'Linewidth',3);
% set(gca,'FontSize',15);

cd('../')

figure(6)
plot(gamma.*(675*10^(-6))^2./(1.946*10^(-5)),Nu_N_in,'ob','MarkerSize',15,'MarkerFaceColor','b');
hold on;
plot(gamma.*(675*10^(-6))^2./(1.946*10^(-5)),Nu_N_inv_in,'sk','MarkerSize',18,'MarkerFaceColor','k');
hold on;
plot(3.*(d_new.*10^(-3)).^2./(1.946*10^(-5)),Nu_d_in,'ob','MarkerSize',15,'MarkerFaceColor','b');
hold on;
plot(3.*(d_new.*10^(-3)).^2./(1.946*10^(-5)),Nu_d_inv_in,'sk','MarkerSize',18,'MarkerFaceColor','k');


leg = legend('$\Delta T > 0$','$\Delta T < 0$','Interpreter','latex');
leg.FontSize = 35;
xlabel('$Pe_{\rm th}$','Interpreter','latex','FontSize',35);
ylabel('$Nu$','Interpreter','latex','FontSize',35);
set(findall(gca,'Type','Line'),'Linewidth',3);
set(gca,'FontSize',32);
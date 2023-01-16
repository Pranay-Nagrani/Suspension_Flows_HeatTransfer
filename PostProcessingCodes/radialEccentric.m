clc; clear all; close all;
e = [0;0.0019;0.0038;0.0057;0.0076;0.0095;0.0114;0.0133;0.0152];
[status,cmdout] = system('pwd');
cd('data');
files = ["elinezero.csv","elineone.csv","elinetwo.csv","elinethree.csv","elinefour.csv",...
    "elinefive.csv","elinesix.csv","elineseven.csv","elineeight.csv"];
colors =["-r","-g","-b","-k","-m","-c","-y","--b","--k","--g"];
jin = [375;337;300;262;225;188;150;113;75];
jout = [627;590;553;515;478;440;403;366;328];
figure(1)
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    index1 = jin(i,1);
    index2 = jout(i,1);
    nondimr = zeros(1001,1);
    nondimr(1:1001,1) = nan;
    for j=1:length(s(:,39))
        if j<=index1
           nondimr(j,1) = -(abs(s(j,39))-abs(s(index1,39)))/(abs(s(1,39))-abs(s(index1,39)));
        elseif j>=index2
           nondimr(j,1) = (s(j,39)-s(index2,39))/(s(1001,39)-s(index2,39));
        end
    end
    color = sprintf('%s',colors(i));
    plot(nondimr,s(:,24)./0.68,color);
    hold on;
end
xlabel('${\it} Scaled Non-Dimensional Position$','Interpreter','latex','FontSize',20);
ylabel('${\it} \phi/\phi_{m}$','Interpreter','latex','FontSize',20);
%xlim([-0.0254 0.0254]);
%ylim([0 0.42]);
leg = legend('E = 0','E = 0.1','E = 0.2','E = 0.3','E = 0.4','E = 0.5','E = 0.6','E = 0.7','E = 0.8');
legend boxoff;
leg.FontSize = 15;
set(gca,'FontSize',20);
set(findall(gca,'Type','Line'),'Linewidth',2);

figure(2)
for i=1:length(files)
    sample = sprintf('%s',files(i));
    s = csvread(sample,1,0);
    index1 = jin(i,1);
    index2 = jout(i,1);
    nondimr = zeros(1001,1);
    nondimr(1:1001,1) = nan;
    for j=1:length(s(:,39))
        if j<=index1
           nondimr(j,1) = -(abs(s(j,39))-abs(s(index1,39)))/(abs(s(1,39))-abs(s(index1,39)));
        elseif j>=index2
           nondimr(j,1) = (s(j,39)-s(index2,39))/(s(1001,39)-s(index2,39));
        end
    end
    color = sprintf('%s',colors(i));
    %T = zeros(size(s(:,1)),1);
    T = s(:,24).*s(:,12) + s(:,23).*s(:,11);
    plot(nondimr,T,color);
    hold on;
end
xlabel('${\it} Scaled Non-Dimensional Position$','Interpreter','latex','FontSize',20);
ylabel('${\it} T(K)$','Interpreter','latex','FontSize',20);
%xlim([-0.0254 0.0254]);
%ylim([293 323]);
leg = legend('E = 0','E = 0.1','E = 0.2','E = 0.3','E = 0.4','E = 0.5','E = 0.6','E = 0.7','E = 0.8');
legend boxoff;
leg.FontSize = 15;
set(gca,'FontSize',20);
set(findall(gca,'Type','Line'),'Linewidth',2);
cd('../')
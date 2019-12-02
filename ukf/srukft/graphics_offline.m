close all
clear
clc

root = getenv('root_directory');
load(strcat(root, 'data/srukf_f_6_prbs.mat'));
core_name = 'srukf_f_6_prbs_j';
%%
% ehfbEDFBOIWERBU = AKJSDDKJ
% time = mt(1:length(xv));
% q = mq(1:length(xv),:);
% dq = mdq(1:length(xv),:);
% torque = mtorque(1:length(xv),:);

%%

time = time(1:length(xv));
q = q(1:length(xv),:);
dq = d_q(1:length(xv),:);
% torque = m_torque(1:length(xv),:);
torque = torque_with_force_noisy(1:length(xv),:);

%% Torque

for i=1:6
    
    
    g = figure();
    plot(time, torque(:,i), time, xv(18+i,:));
    title('Torque medido e estimado')
    ylabel('Torque (N.m)')
    xlabel('Tempo (s)')
    legend('Medido', 'Estimado')
    xlim([0 30])
    
    poss = g.Children(2).Children;
    poss(1).LineWidth = 1.5;
    poss(1).Color = [0.4940, 0.1840, 0.5560];
    poss(1).LineStyle = ':';
    poss(2).LineWidth = 1.5;
    poss(2).Color = [0.9290, 0.6940, 0.1250];
    poss(2).LineStyle = '-';
    
    g = tight(g);
    fullname = strcat(root, 'Figures/torque_', core_name, string(i), '.png');
    saveas(g, fullname);
    
end

%% pos

for i=1:6
    
    g = figure();
    plot(time, q(:,i), time, xv(i,:));
    title('Posição medida e estimada')
    ylabel('Posição (rad)')
    xlabel('Tempo (s)')
    legend('Medido', 'Estimado')
    xlim([0 30])
    
    poss = g.Children(2).Children;
    poss(1).LineWidth = 1.5;
    poss(1).Color = [0.4940, 0.1840, 0.5560];
    poss(1).LineStyle = ':';
    poss(2).LineWidth = 1.5;
    poss(2).Color = [0.9290, 0.6940, 0.1250];
    poss(2).LineStyle = '-';
    
    g = tight(g);
    fullname = strcat(root, 'Figures/pos_', core_name, string(i), '.png');
    saveas(g, fullname);
    
end

%% vel

for i=1:6
    
    g = figure();
    plot(time, dq(:,i), time, xv(6+i,:));
    title('Velocidade medida e estimada')
    ylabel('Velocidade (rad/s)')
    xlabel('Tempo (s)')
    legend('Medido', 'Estimado')
    xlim([0 30])
    
    poss = g.Children(2).Children;
    poss(1).LineWidth = 1.5;
    poss(1).Color = [0.4940, 0.1840, 0.5560];
    poss(1).LineStyle = ':';
    poss(2).LineWidth = 1.5;
    poss(2).Color = [0.9290, 0.6940, 0.1250];
    poss(2).LineStyle = '-';
    
    g = tight(g);
    fullname = strcat(root, 'Figures/vel_', core_name, string(i), '.png');
    saveas(g, fullname);
    
end

%% acc

% load(strcat(root, 'data/fprbs.mat'));

for i=1:6
    
    g = figure();
%     plot(ftime(1:length(time)), fddq(1:length(time),i));
%     hold on
    plot(time, xv(12+i,:));
    title('Aceleração estimada')
%     title('Aceleração estimada e derivada')
    ylabel('Aceleração (rad/s^2)')
    xlabel('Tempo (s)')
    ylim([-10 10])
    xlim([0 30])
    legend('Estimado')
%     legend('Derivado', 'Estimado')
    xlim([0 30])
    
    poss = g.Children(2).Children;
    poss(1).LineWidth = 1.5;
    poss(1).Color = [0.4940, 0.1840, 0.5560];
    poss(1).LineStyle = ':';
    
%     poss(1).LineWidth = 1.5;
%     poss(1).Color = [0.4940, 0.1840, 0.5560];
%     poss(1).LineStyle = ':';
%     poss(2).LineWidth = 1.5;
%     poss(2).Color = [0.8500, 0.3250, 0.0980];
%     poss(2).LineStyle = '-';

    
    g = tight(g);
    fullname = strcat(root, 'Figures/acc_', core_name, string(i), '.png');
    saveas(g, fullname);
    
end

%% force


for i=1:6
    
    g = figure();
    plot(time, xv(24+i,:));
    title('Esforço no efetuador terminal estimado')
    if i <= 3
        ylabel('Força (N)')
    else
        ylabel('Momento (N.m)')
    end
    xlabel('Tempo (s)')
    legend('Estimado')
    xlim([0 30])
    
    poss = g.Children(2).Children;
    poss(1).LineWidth = 1.5;
    poss(1).Color = [0.4940, 0.1840, 0.5560];
    poss(1).LineStyle = ':';

    
    g = tight(g);
    fullname = strcat(root, 'Figures/force_', core_name, string(i), '.png');
    saveas(g, fullname);

    
end




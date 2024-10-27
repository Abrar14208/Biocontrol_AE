clear all
clc
close all
%%
str=[pwd '\new data\' ];

%15ml
fifteen.data_trial_1= importdata([str 'trial_1_15ml.mat']);
fifteen.data_trial_2= importdata([str 'trial_2_15ml.mat']);
fifteen.data_trial_3= importdata([str 'trial_3_15ml.mat']);

%20ml
twenty.data_trial_1= importdata([str 'trial_1_20ml.mat']);
twenty.data_trial_2= importdata([str 'trial_2_20ml.mat']);
twenty.data_trial_3= importdata([str 'trial_3_20ml.mat']);

%25ml
twentyFive.data_trial_1= importdata([str 'trial_1_25ml.mat']);
twentyFive.data_trial_2= importdata([str 'trial_2_25ml.mat']);
twentyFive.data_trial_3= importdata([str 'trial_3_25ml.mat']);

%30ml
thirty.data_trial_1= importdata([str 'trial_1_30ml.mat']);
thirty.data_trial_2= importdata([str 'trial_2_30ml.mat']);
thirty.data_trial_3= importdata([str 'trial_3_30ml.mat']);

%35ml
thirtyFive.data_trial_1= importdata([str 'trial_1_35ml.mat']);
thirtyFive.data_trial_2= importdata([str 'trial_2_35ml.mat']);
thirtyFive.data_trial_3= importdata([str 'trial_3_35ml.mat']);


%% extract data for A in different concentration

A.mean_vs_time_15=mean([fifteen.data_trial_1.A; fifteen.data_trial_2.A; fifteen.data_trial_3.A ]);
A.mean_vs_time_20=mean([twenty.data_trial_1.A; twenty.data_trial_2.A; twenty.data_trial_3.A ]);
A.mean_vs_time_25=mean([twentyFive.data_trial_1.A; twentyFive.data_trial_2.A; twentyFive.data_trial_3.A ]);
A.mean_vs_time_30=mean([thirty.data_trial_1.A; thirty.data_trial_2.A; thirty.data_trial_3.A ]);
A.mean_vs_time_35=mean([thirtyFive.data_trial_1.A; thirtyFive.data_trial_2.A; thirtyFive.data_trial_3.A ]);

B.mean_vs_time_15=mean([fifteen.data_trial_1.B; fifteen.data_trial_2.B; fifteen.data_trial_3.B ]);
B.mean_vs_time_20=mean([twenty.data_trial_1.B; twenty.data_trial_2.B; twenty.data_trial_3.B ]);
B.mean_vs_time_25=mean([twentyFive.data_trial_1.B; twentyFive.data_trial_2.B; twentyFive.data_trial_3.B ]);
B.mean_vs_time_30=mean([thirty.data_trial_1.B; thirty.data_trial_2.B; thirty.data_trial_3.B ]);
B.mean_vs_time_35=mean([thirtyFive.data_trial_1.B; thirtyFive.data_trial_2.B; thirtyFive.data_trial_3.B ]);

C.mean_vs_time_15=mean([fifteen.data_trial_1.C; fifteen.data_trial_2.C; fifteen.data_trial_3.C ]);
C.mean_vs_time_20=mean([twenty.data_trial_1.C; twenty.data_trial_2.C; twenty.data_trial_3.C ]);
C.mean_vs_time_25=mean([twentyFive.data_trial_1.C; twentyFive.data_trial_2.C; twentyFive.data_trial_3.C ]);
C.mean_vs_time_30=mean([thirty.data_trial_1.C; thirty.data_trial_2.C; thirty.data_trial_3.C ]);
C.mean_vs_time_35=mean([thirtyFive.data_trial_1.C; thirtyFive.data_trial_2.C; thirtyFive.data_trial_3.C ]);

D.mean_vs_time_15=mean([fifteen.data_trial_1.D; fifteen.data_trial_2.D; fifteen.data_trial_3.D ]);
D.mean_vs_time_20=mean([twenty.data_trial_1.D; twenty.data_trial_2.D; twenty.data_trial_3.D ]);
D.mean_vs_time_25=mean([twentyFive.data_trial_1.D; twentyFive.data_trial_2.D; twentyFive.data_trial_3.D ]);
D.mean_vs_time_30=mean([thirty.data_trial_1.D; thirty.data_trial_2.D; thirty.data_trial_3.D ]);
D.mean_vs_time_35=mean([thirtyFive.data_trial_1.D; thirtyFive.data_trial_2.D; thirtyFive.data_trial_3.D ]);

E.mean_vs_time_15=mean([fifteen.data_trial_1.E; fifteen.data_trial_2.E; fifteen.data_trial_3.E ]);
E.mean_vs_time_20=mean([twenty.data_trial_1.E; twenty.data_trial_2.E; twenty.data_trial_3.E ]);
E.mean_vs_time_25=mean([twentyFive.data_trial_1.E; twentyFive.data_trial_2.E; twentyFive.data_trial_3.E ]);
E.mean_vs_time_30=mean([thirty.data_trial_1.E; thirty.data_trial_2.E; thirty.data_trial_3.E ]);
E.mean_vs_time_35=mean([thirtyFive.data_trial_1.E; thirtyFive.data_trial_2.E; thirtyFive.data_trial_3.E ]);
%%
figure(1)
clf
time_stamp=[24 48 72];
% errorbar(time_stamp, A_mean_vs_time, A_std_vs_time,'r.-'), hold on
% errorbar(time_stamp, B_mean_vs_time, B_std_vs_time,'b.-'), hold on
% errorbar(time_stamp, C_mean_vs_time, C_std_vs_time,'g.-'), hold on
% errorbar(time_stamp, D_mean_vs_time, D_std_vs_time,'m.-'), hold on
% errorbar(time_stamp, E_mean_vs_time, E_std_vs_time,'k.-'), hold off

plot(time_stamp, A.mean_vs_time_20,'ro-','Linewidth',3), hold on
plot(time_stamp, A.mean_vs_time_25,'bo-','Linewidth',3), hold on
plot(time_stamp, A.mean_vs_time_30,'go-','Linewidth',3), hold on
plot(time_stamp, A.mean_vs_time_35,'mo-','Linewidth',3), hold off

legend('20 ml', '25 ml', '30 ml', '35 ml')
xticks(time_stamp)
xticklabels(time_stamp)
title('Bioassay of A bacterial suspension')
xlabel('Time(hours)')
ylabel('Average deaths')
ylim([0 26])
%% for A

A.p15= polyfit([0 time_stamp],[0 A.mean_vs_time_15],2);
A.p20= polyfit([0 time_stamp],[0 A.mean_vs_time_20],2);
A.p25= polyfit([0 time_stamp],[0 A.mean_vs_time_25],2);
A.p30= polyfit([0 time_stamp],[0 A.mean_vs_time_30],2);
A.p35= polyfit([0 time_stamp],[0 A.mean_vs_time_35],2);

B.p15= polyfit([0 time_stamp],[0 B.mean_vs_time_15],2);
B.p20= polyfit([0 time_stamp],[0 B.mean_vs_time_20],2);
B.p25= polyfit([0 time_stamp],[0 B.mean_vs_time_25],2);
B.p30= polyfit([0 time_stamp],[0 B.mean_vs_time_30],2);
B.p35= polyfit([0 time_stamp],[0 B.mean_vs_time_35],2);

C.p15= polyfit([0 time_stamp],[0 C.mean_vs_time_15],2);
C.p20= polyfit([0 time_stamp],[0 C.mean_vs_time_20],2);
C.p25= polyfit([0 time_stamp],[0 C.mean_vs_time_25],2);
C.p30= polyfit([0 time_stamp],[0 C.mean_vs_time_30],2);
C.p35= polyfit([0 time_stamp],[0 C.mean_vs_time_35],2);

D.p15= polyfit([0 time_stamp],[0 D.mean_vs_time_15],2);
D.p20= polyfit([0 time_stamp],[0 D.mean_vs_time_20],2);
D.p25= polyfit([0 time_stamp],[0 D.mean_vs_time_25],2);
D.p30= polyfit([0 time_stamp],[0 D.mean_vs_time_30],2);
D.p35= polyfit([0 time_stamp],[0 D.mean_vs_time_35],2);

E.p15= polyfit([0 time_stamp],[0 E.mean_vs_time_15],2);
E.p20= polyfit([0 time_stamp],[0 E.mean_vs_time_20],2);
E.p25= polyfit([0 time_stamp],[0 E.mean_vs_time_25],2);
E.p30= polyfit([0 time_stamp],[0 E.mean_vs_time_30],2);
E.p35= polyfit([0 time_stamp],[0 E.mean_vs_time_35],2);
%%

doses={'p15', 'p20', 'p25', 'p30', 'p35'};
mean_vs_time={'mean_vs_time_15',...
    'mean_vs_time_20',...
    'mean_vs_time_25',...
    'mean_vs_time_30',...
    'mean_vs_time_35'};
clr_string={'ro', 'bo', 'go', 'mo', 'ko'};
style_string={'r--', 'b--', 'g--', 'm--', 'k--'};

for i=1:length(mean_vs_time)
   figure(2) 
   plot(time_stamp, A.(mean_vs_time{i}), clr_string{i}, 'linewidth', 3), hold on
   
    figure(3) 
   plot(time_stamp, B.(mean_vs_time{i}), clr_string{i}, 'linewidth', 3), hold on
   
   figure(4) 
   plot(time_stamp, C.(mean_vs_time{i}), clr_string{i}, 'linewidth', 3), hold on
   
   figure(5) 
   plot(time_stamp, D.(mean_vs_time{i}), clr_string{i}, 'linewidth', 3), hold on
   
   figure(6) 
   plot(time_stamp, E.(mean_vs_time{i}), clr_string{i}, 'linewidth', 3), hold on
end
% p_new1=p; p_new1(end)=p_new1(end)-12.5

x=0:0.01:72;
for i=1:length(doses)
    %A
    p=A.(doses{i});
    y_fit_A(i,:)= polyval(p,x);
    p_new1=p; p_new1(end)=p_new1(end)-12.5;
    temp=roots(p_new1);
    A.([doses{i} '_LT50'])=temp(2);
    figure(2)
    hold on
    plot(x, y_fit_A(i,:),style_string{i})
    line([0 80], [12.5 12.5])
    line([A.([doses{i} '_LT50']) A.([doses{i} '_LT50'])],[0 12.5])
    ylim([0 30])
    title('LT_{50} for A')
    xlabel('Time (hours)')
    ylabel('Number of death')
    
    %B
    p=B.(doses{i});
    y_fit_B(i,:)= polyval(p,x);
    p_new1=p; p_new1(end)=p_new1(end)-12.5;
    temp=roots(p_new1);
    B.([doses{i} '_LT50'])=temp(2);   
    figure(3)
    hold on
    plot(x, y_fit_B(i,:), style_string{i})
    line([0 80], [12.5 12.5])
    line([B.([doses{i} '_LT50']) B.([doses{i} '_LT50'])],[0 12.5])
    ylim([0 30])
    title('LT_{50} for B')
    xlabel('Time (hours)')
    ylabel('Number of death')
    %C
    p=C.(doses{i});
    y_fit_C(i,:)= polyval(p,x);
    p_new1=p; p_new1(end)=p_new1(end)-12.5;
    temp=roots(p_new1);
    C.([doses{i} '_LT50'])=temp(2);
    figure(4)
    hold on
    plot(x, y_fit_C(i,:), style_string{i})
    line([0 80], [12.5 12.5])
    line([C.([doses{i} '_LT50']) C.([doses{i} '_LT50'])],[0 12.5])
    ylim([0 30])
    title('LT_{50} for C')
    xlabel('Time (hours)')
    ylabel('Number of death');
    %D
    p=D.(doses{i});
    y_fit_D(i,:)= polyval(p,x);
    figure(5)
    p_new1=p; p_new1(end)=p_new1(end)-12.5;
    temp=roots(p_new1);
    D.([doses{i} '_LT50'])=temp(2);
    hold on
    plot(x, y_fit_D(i,:), style_string{i})
    line([0 80], [12.5 12.5])
    line([D.([doses{i} '_LT50']) D.([doses{i} '_LT50'])],[0 12.5])
    ylim([0 30])
    title('LT_{50} for D')
    xlabel('Time (hours)')
    ylabel('Number of death');
    
    %E
    p=E.(doses{i});
    y_fit_E(i,:)= polyval(p,x);
    p_new1=p; p_new1(end)=p_new1(end)-12.5;
    temp=roots(p_new1);
    E.([doses{i} '_LT50'])=temp(2); 
    figure(6)
    hold on
    plot(x, y_fit_E(i,:), style_string{i})
    line([0 80], [12.5 12.5])
    line([E.([doses{i} '_LT50']) E.([doses{i} '_LT50'])],[0 12.5])
    ylim([0 30])
    title('LT_{50} for E')
    xlabel('Time (hours)')
    ylabel('Number of death')
end
%%
legend_string={'15 ml(raw)',...
    '20 ml(raw)',...
    '25 ml(raw)',...
    '30 ml(raw)',...
    '35 ml(raw)',...
    '15 ml(fitted)',...
    '20 ml(fitted)',...
    '25 ml(fitted)',...
    '30 ml(fitted)',...
    '35 ml(fitted)'};
figure(2)
legend(legend_string)
figure(3)
legend(legend_string)
figure(4)
legend(legend_string)
figure(5)
legend(legend_string)
figure(6)
legend(legend_string)

disp('To visualize LT50 value,Please look inside each of the struct variables, A, B, C; D E at the workspace')

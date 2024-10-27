clc
close all
clear;
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


AllDataA=[0 0 mean([fifteen.data_trial_1.A(end) fifteen.data_trial_2.A(end) fifteen.data_trial_3.A(end)]) ...
    mean([twenty.data_trial_1.A(end) twenty.data_trial_2.A(end) twenty.data_trial_3.A(end)]) ...
    mean([twentyFive.data_trial_1.A(end) twentyFive.data_trial_2.A(end) twentyFive.data_trial_3.A(end)]) ...
    mean([thirty.data_trial_1.A(end) thirty.data_trial_2.A(end) thirty.data_trial_3.A(end)]) ...
    mean([thirtyFive.data_trial_1.A(end) thirtyFive.data_trial_2.A(end) thirtyFive.data_trial_3.A(end)])];

AllDataB=[0 0 mean([fifteen.data_trial_1.B(end) fifteen.data_trial_2.B(end) fifteen.data_trial_3.B(end)]) ...
    mean([twenty.data_trial_1.B(end) twenty.data_trial_2.B(end) twenty.data_trial_3.B(end)]) ...
    mean([twentyFive.data_trial_1.B(end) twentyFive.data_trial_2.B(end) twentyFive.data_trial_3.B(end)]) ...
    mean([thirty.data_trial_1.B(end) thirty.data_trial_2.B(end) thirty.data_trial_3.B(end)]) ...
    mean([thirtyFive.data_trial_1.B(end) thirtyFive.data_trial_2.B(end) thirtyFive.data_trial_3.B(end)])];


AllDataC=[0 0 mean([fifteen.data_trial_1.C(end) fifteen.data_trial_2.C(end) fifteen.data_trial_3.C(end)]) ...
    mean([twenty.data_trial_1.C(end) twenty.data_trial_2.C(end) twenty.data_trial_3.C(end)]) ...
    mean([twentyFive.data_trial_1.C(end) twentyFive.data_trial_2.C(end) twentyFive.data_trial_3.C(end)]) ...
    mean([thirty.data_trial_1.C(end) thirty.data_trial_2.C(end) thirty.data_trial_3.C(end)]) ...
    mean([thirtyFive.data_trial_1.C(end) thirtyFive.data_trial_2.C(end) thirtyFive.data_trial_3.C(end)])];

AllDataD=[0 0 mean([fifteen.data_trial_1.D(end) fifteen.data_trial_2.D(end) fifteen.data_trial_3.D(end)]) ...
    mean([twenty.data_trial_1.D(end) twenty.data_trial_2.D(end) twenty.data_trial_3.D(end)]) ...
    mean([twentyFive.data_trial_1.D(end) twentyFive.data_trial_2.D(end) twentyFive.data_trial_3.D(end)]) ...
    mean([thirty.data_trial_1.D(end) thirty.data_trial_2.D(end) thirty.data_trial_3.D(end)]) ...
    mean([thirtyFive.data_trial_1.D(end) thirtyFive.data_trial_2.D(end) thirtyFive.data_trial_3.D(end)])];


AllDataE=[0 0 mean([fifteen.data_trial_1.E(end) fifteen.data_trial_2.E(end) fifteen.data_trial_3.E(end)]) ...
    mean([twenty.data_trial_1.E(end) twenty.data_trial_2.E(end) twenty.data_trial_3.E(end)]) ...
    mean([twentyFive.data_trial_1.E(end) twentyFive.data_trial_2.E(end) twentyFive.data_trial_3.E(end)]) ...
    mean([thirty.data_trial_1.E(end) thirty.data_trial_2.E(end) thirty.data_trial_3.E(end)]) ...
    mean([thirtyFive.data_trial_1.E(end) thirtyFive.data_trial_2.E(end) thirtyFive.data_trial_3.E(end)])];




FINAL_data=[AllDataA;  AllDataB; AllDataC; AllDataD; AllDataE];
FINAL_data(:,1)=FINAL_data(:,1)+0.1;
FINAL_data(:,2)=FINAL_data(:,2)+0.1;

figure(1)
clf
bar(FINAL_data)
legend('C1', 'C2' ,'15ml', '20ml', '25ml', '30ml', '35ml')
xticks(1:5)
xticklabels({'A','B','C','D','E'})
ylabel('Average number of death')
xlabel('{\it Bacillus subtilis} Isolates')




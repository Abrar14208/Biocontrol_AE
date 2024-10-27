clc
close all
clear;
%%
str=[pwd '\new data' ];
allfiles=dir(fullfile(str,'*.mat'));

% initializing counter for cumulative sum for each of isolates and
% corresponding dose

A_15=0;
A_20=0;
A_25=0;
A_30=0;
A_35=0;

B_15=0;
B_20=0;
B_25=0;
B_30=0;
B_35=0;

C_15=0;
C_20=0;
C_25=0;
C_30=0;
C_35=0;


D_15=0;
D_20=0;
D_25=0;
D_30=0;
D_35=0;

E_15=0;
E_20=0;
E_25=0;
E_30=0;
E_35=0;



%% For loop for extracting data
for i=1:length(allfiles)

    if strcmp(allfiles(i).name(end-7:end-4),'15ml')
        temp=load([str '\' allfiles(i).name]);
        A_15=A_15+temp.Data.A(3);
        B_15=B_15+temp.Data.B(3);
        C_15=C_15+temp.Data.C(3);
        D_15=D_15+temp.Data.D(3);
        E_15=E_15+temp.Data.E(3);
        
    elseif strcmp(allfiles(i).name(end-7:end-4),'20ml')
        temp=load([str '\' allfiles(i).name]);
        A_20=A_20+temp.Data.A(3);
        B_20=B_20+temp.Data.B(3);
        C_20=C_20+temp.Data.C(3);
        D_20=D_20+temp.Data.D(3);
        E_20=E_20+temp.Data.E(3);
        
    elseif strcmp(allfiles(i).name(end-7:end-4),'25ml')
        temp=load([str '\' allfiles(i).name]);
        A_25=A_25+temp.Data.A(3);
        B_25=B_25+temp.Data.B(3);
        C_25=C_25+temp.Data.C(3);
        D_25=D_25+temp.Data.D(3);
        E_25=E_25+temp.Data.E(3);
        
    elseif strcmp(allfiles(i).name(end-7:end-4),'30ml')
        temp=load([str '\' allfiles(i).name]);
        A_30=A_30+temp.Data.A(3);
        B_30=B_30+temp.Data.B(3);
        C_30=C_30+temp.Data.C(3);
        D_30=D_30+temp.Data.D(3);
        E_30=E_30+temp.Data.E(3);
        
    elseif strcmp(allfiles(i).name(end-7:end-4),'35ml')
        temp=load([str '\' allfiles(i).name]);
        A_35=A_35+temp.Data.A(3);
        B_35=B_35+temp.Data.B(3);
        C_35=C_35+temp.Data.C(3);
        D_35=D_35+temp.Data.D(3);
        E_35=E_35+temp.Data.E(3);
    end    
end
%% individual probit
clear x y p
conc=[15 20 25 30 35];

% in order to select different isolates, we need to activate the desired
% line 95-99. Each line corresponds to the specific isolate and the
% corresponding dosage ranging from 0% to 100% mortality.

death= [A_15 A_20 A_25 A_30 A_35-0.01]; current_isolate = 'A';
% death= [B_15 B_20 B_25 B_30 B_35-0.01]; current_isolate = 'B';
% death= [D_15 D_20 D_25 D_30 D_35-0.01]; current_isolate = 'D';
% death= [C_15 C_20 C_25-0.01]; current_isolate = 'C';
% death= [E_15 E_20 E_25 E_30 E_35-0.01]; current_isolate = 'E';

if strcmp(current_isolate, 'C')
   conc = conc(1:3);
end

prob=death./75;
x= log(conc);
for i=1:length(prob)
    y(i)= log(prob(i)/(1-prob(i)))+5;
    
end




%% regressio line cinc vs probit
%regression line
figure(1)
clf
scatter(y,x,'ro'), hold on;
% here y = probit x = concentration
[p,S]= polyfit(y,x,1);
ynew=0.1:.001:100;
[x_fit, delta]= polyval(p,ynew,S);
plot(y,x,'o',ynew,x_fit,'-')
plot(ynew,x_fit+2*delta,'m--',ynew,x_fit-2*delta,'m--'),hold on

% for calculating LC50
x1=5;
y1 = p(1)*x1+p(2);
exp(y1);
% LC90
x2= 7.197;
y2 = p(1)*x2+p(2);
exp(y2);


% upper limit
[a50,b50] =min(abs(x_fit-y1));
[a90,b90] =min(abs(x_fit-y2));

ul_lc50 = y1+2*delta(b50);
ll_lc50 = y1-2*delta(b50);

ul_lc90 = y1+2*delta(b90);
ll_lc90 = y1-2*delta(b90);

y_exact=y;
[data_fit, delta]= polyval(p,y_exact,S);
Rsquared = my_Rsquared_coeff(x,data_fit);


line([x1 x1],[0 y1]), hold on
line([0 x1],[y1 y1])
line([x2 x2],[0 y2]), hold on
line([0 x2],[y2 y2])

ylim([0 4.5])
xlim([0 15])
xlabel('Probit')
ylabel('Log(conc)')
title(['Probit analysis of ' current_isolate ' after 72 hours'])

disp(['LC50 for ' current_isolate ' : ' num2str(exp(y1)) ' ml'])
disp([ ' Upper limit of LC50 for ' current_isolate ' : ' num2str(exp(ul_lc50)) ' ml'])
disp([ ' Lower limit of LC50 for ' current_isolate ' : ' num2str(exp(ll_lc50)) ' ml'])

disp(['LC90 for ' current_isolate ' : ' num2str(exp(y2)) 'ml'])
disp([ ' Upper limit of LC90 for ' current_isolate ' : ' num2str(exp(ul_lc90)) ' ml'])
disp([ ' Lower limit of LC90 for ' current_isolate ' : ' num2str(exp(ll_lc90)) ' ml'])

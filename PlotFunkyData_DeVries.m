clear all

%% load in data
[~, headers]=xlsread('Psych315W18survey.xlsx', 'A1:AP1');
[~, ~, data]=xlsread('Psych315W18survey.xlsx', 'A2:AP153');

% headers=headers(1,:);
% 
% data=data(2:153,:);

%% breakdown of computers by gender

gender_header=find(strcmp(headers,'gender'));

pc_header=find(strcmp(headers,'computer'));

female_ind=find(strcmp(data(:, gender_header), 'Female'));

male_ind=find(strcmp(data(:, gender_header), 'Male'));

gender=NaN(size(data,1), 1);

gender(female_ind)=1; % set Females to 1

gender(male_ind)=2; % set Females to 1

n_women=length(female_ind);

n_men=length(male_ind);

computer=NaN(size(data,1), 1);

pc_ind=find(strcmp(data(:, pc_header), 'PC'));

computer(pc_ind)=1;

apple_ind=find(strcmp(data(:, pc_header), 'Apple'));

computer(apple_ind)=2;

women_computer=computer(female_ind);

women_pc=length(find(women_computer==1))./n_women;

women_apple=length(find(women_computer==2))./n_women;

men_computer=computer(male_ind);

men_pc=length(find(men_computer==1))./n_men;

men_apple=length(find(men_computer==2))./n_men;

% plot stuff

f=figure(1);

set(f, 'Name','computer by gender');

% bar graph

a1=subplot(2,2,1); % axis!

set(a1, 'FontName', 'Geneva');

t=title('simple bar', 'FontAngle', 'italic');

p1=bar([women_pc women_apple men_pc men_apple]);

set(p1, 'FaceColor', [1 .5 .5])

labels={'women pc' 'women apple' 'men pc' 'men apple'};

set(gca,'XTick', [1:4]);

set(gca,'XTickLabel', labels);

% for binary options the absolute std err is sqrt(npq) where n is the number of

% trials, p is the probability of option a and q is the probability of

% option b

% because we are plotting data after dividing by the number of women and

% the number of men, we need to do that to the stderr as well

sterr=sqrt([[n_women * women_pc * women_apple]./n_women ...
    
[n_women * women_pc * women_apple]./n_women ; ...

[n_men * men_pc * men_apple]./n_men ...

[n_men * men_pc * men_apple]./n_men]);

a2 = subplot(2,2,2); title('bar plot with errorbars');

bar([women_pc women_apple; men_pc men_apple], 'stacked'); %% I had to take out some of the other stuff 
%% because my computer kept throwing a barweb error I couldn't figure out, so I went back to bar. 

set(a2, 'YLim', [0 1.2])
% ================================%
% QUESTION 1. Add a stacked bar plot in this subplot.
% use >doc bar for help or try this code as an example

ax1 = subplot(2,2,3);
bar([women_pc women_apple; men_pc men_apple],'stacked')
% ================================%

a4=subplot(2,4,7); title('women');
l4 = legend({'pc', 'apple'}, 'Position', [0.6917 0.0607 0.1536 0.0905]);
p4 = pie([women_pc women_apple]); hold on

a5=subplot(2,4,8); title('men')
p5 = pie([ men_pc men_apple]); hold on


%% do computers rot your brain

facebook_header=find(strcmp(headers,'friends'));
grade_header=find(strcmp(headers,'Exam1'));

figure(2);
set(gcf,'Name', 'Do computers rot your brain?');
subplot(1,3,1)
plot([data{:,facebook_header}], [data{:, grade_header}], 'ko');
xlabel('Facebook friends')
ylabel('grade')

% ================================%
% QUESTION 2.add a subplot that is the same as the one above but
% replaces facebook friends with the number of gaming hours

hours_header=find(strcmp(headers,'games_hours'));

subplot(1,3,2)
plot([data{:,hours_header}], [data{:, grade_header}], 'ko');
xlabel('# of Gaming Hours')
ylabel('grade')

% ================================%
% ================================%
% QUESTION 3.add a subplot that is the same as the one above but
% plots  the number of gaming hours on the x-axis, and the number of hours
% of sleep on the y-axis

sleep_header=find(strcmp(headers,'sleep'));

subplot(1,3,3)
plot([data{:,grade_header}], [data{:, sleep_header}], 'ko');
ylabel('# of hours of sleep')
xlabel('grade')

% ================================%
% ================================%
% QUESTION 4. In figure 3. use plot3d to do a 3d plot comparing sleep, gaming and
% facebookfriends

figure(3); 

plot3([data{:,sleep_header}], [data{:,hours_header}], [data{:,facebook_header}], 'o'); 

% ================================%
% ================================%
% QUESTION 5. Choose anything to plot and plot it

% wanted to do something fun....i've never heard of ezplot! %

figure(4); 

ezplot3('sin(t)', 'cos(t*2)', 't', [0, pi/2]); 



% ================================%




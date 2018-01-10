
% BreakfastCereal
%
% Provides examples of fun things you can do with cereal boxes.
%Inspired by my cats
%
%written LD 1/3/2018 for Matlab 2018

frosted ='FROSTED FLAKES';
cherrios = 'CHEERIOS'; 

frosted(9);   

frosted_scrambled = frosted; 

frosted_scrambled(9) = 'E'; 
disp(frosted_scrambled); 

cheerios = 'CHEERIOS'; 
cheerios_scrambled = cheerios; 

cheerios_scrambled(1) = 'O'; 
cheerios_scrambled(5) = 'P'; 
disp(cheerios_scrambled); 

% chemistry = 'CHEMISTRY';
% chem_scrambled = chemistry;
% 
% chem_scrambled(1) = 'O'; 
% chem_scrambled(8) = 'B'; 
% disp(chem_scrambled); 


%%%% 1/8/2018 Chapter 2 %%%

frosted_scrambled([6 13]) = ['F' 'F'];
disp(frosted_scrambled); 
ff=find('FROSTED FLAKES' == 'F'); 
ff2=find(frosted == 'F'); 

% Exercises in book %%

% Q 2.2 %

str = 'MACARONI AND CHEESE'; 
id1= [1 2 7 13:19];
a = str(id1); 
disp(a); 

id2=[15 16 5 9 1 8 7 12 9 8 18 13 14 15 8 7 16 18 19];

b = str(id2); 
disp(b);

% Q 2.3 %

vectlin = linspace(1,10,10); 
vect = 1:10;

vectlin2 = linspace(10, 18, 5); 
vect2 = 10:2:18; 

vectlin3 = linspace(19, 15, 5); 
vect3 = 19:-1:15; 

vectlin4 = linspace(10, -4, 8); 
vect4 = 10:-2:-4; 

vectlin5 = linspace(0, 15.7080, 6); 
vect5 = 0:3.1416:15.7080; 

vectlin6 = linspace(0, 5*pi, 6); 
vect6 = 0:pi:5*pi; 

% Q 2.4 %

str = 'aaaaaaaaaaaaaaaaaaaa';

str(3:3:end)='c'; 

str(2:3:end)='b'; 

disp(str(3:3:end));

str(4:6) = 'def'; 

str([4:6 10:12 16:18])='defdefdef'; 
 
str([6 12 18]);

% Q 2.5 % 

exp = 12:1.23:100; 

exp = exp(1:40); 

exp(5); 

disp(exp(end)); 

% Q 2.6 %

resp='rerekererererererererererererererererere';

resp(5);

resp(5) = 'r'; 

disp(resp(2:2:end)); 

% Q 2.7 %

vect = 12:-1:1; 

%% Went through letters a-g in the prompt. Doesn't seem I need to put anything else here from what I can tell. %% 














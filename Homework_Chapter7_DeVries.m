%% Q7.1 Structures

% create a structure, mystruct that contains 3 fields.
% mystring : which contains your name
% mychange: a double (default for any number) containing the amount of loose change in your wallet or puse
% mygender: a logical, with 1 for female and 0 for male

name= 'Lindsay'; 
pock_change = 1:5; 
female = true;

mystruct.name = name; 
mystruct.female = female; 

for i=1:length(pock_change)
    mystruct(i).pock_change = pock_change(i);
end

% now make a second element in that structure (mystruct(2).fieldname) with
% the same information for someone else (imaginary is fine).

name= 'Gertrude'; 
pock_change = 15; 
male = false;
female = true;

mystruct(2).name = name; 
mystruct(2).female = female; 
mystruct(2).pock_change = pock_change;

%% Q 7.2 Cell arrays

% Make a 3 (fields) x 2 (individuals) cell array that contains all the
% information of the structure above

cell{1} = mystruct.name; 
cell{2} = mystruct.pock_change; 
cell{3} = mystruct.female;
cell{4} = mystruct(2).name; 
cell{5} = mystruct(2).pock_change; 
cell{6} = mystruct(2).female; %% this doesn't seem as elegant as you meant it to be

% pull out the name of the second individual.

cell{4}; 

% pull out the amount of change that you had and add it to amount of change
% the other individual had.

allchange = cell{2} + cell{5}; 


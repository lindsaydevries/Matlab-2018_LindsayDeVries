
%%Q 4.1: Making matrices

%Create the following matrices without typing in the numbers by hand:
A = [1     1     1     1     1
     1     1     1     1     1
     2     2     2     2     2
     2     2     2     2     2
     2     2     2     2     2];

B = [1     1     0     0     1
     1     1     0     0     1
     1     1     0     0     1
     1     1     0     0     1];

C = [1     1     1     1     1
     1     0     0     1     1
     1     0     0     1     1
     1     0     0     1     1
     1     1     1     1     1
     1     1     1     1     1];

D = [1     1     1     1     1
     2     2     2     2     2
     3     3     3     3     3
     4     4     4     4     4
     5     5     5     5     5];

E = [2     2     2     2     2     2
     1     2     2     2     2     2
     1     1     2     2     2     2
     1     1     1     2     2     2
     1     1     1     1     2     2
     1     1     1     1     1     2];
% (This one has a Hint if you get stuck, see Hints section)

F = [0     5    10    15    20
     0     5    10    15    20
     0     5    10    15    20
     0     5    10    15    20
     0     5    10    15    20];
%(This one has a Hint too.)

G = [1     6    11    16    21
     2     7    12    17    22
     3     8    13    18    23
     4     9    14    19    24
     5    10    15    20    25];

H = [1     0     1     0     1     0     1     0
     1     0     1     0     1     0     1     0
     1     0     1     0     1     0     1     0
     1     0     1     0     1     0     1     0
     1     0     1     0     1     0     1     0
     1     0     1     0     1     0     1     0
     1     0     1     0     1     0     1     0
     1     0     1     0     1     0     1     0];

I = [1     0     0     0     0     0     0     0
     0     0     0     0     0     0     0     0
     0     0     1     0     0     0     0     0
     0     0     0     0     0     0     0     0
     0     0     0     0     1     0     0     0
     0     0     0     0     0     0     0     0
     0     0     0     0     0     0     1     0
     0     0     0     0     0     0     0     0];

J = [0     1     2     3     4
     1     2     3     4     5
     2     3     4     5     6
     3     4     5     6     7
     4     5     6     7     8];

K = [1     2     3     4     5
     2     4     6     8    10
     3     6     9    12    15
     4     8    12    16    20
     5    10    15    20    25];

L = [1     2     3     4     5
     6     7     8     9    10
    11    12    13    14    15
    16    17    18    19    20
    21    22    23    24    25];

A=ones(5); 
A(3:5,:) = 2; % this took me an embarrassing amount of time to think through. I have a terrible time thinking spatially :-| 

B=ones(4,5); 
B(:, 3:4) = 0; 

C=ones(6,5); 
C(2:4, 2:3) = 0;

D=ones(5); 
for i = 1:5
    D(:,i) = [1 2 3 4 5]; % love me a for loop
end

%% or D=repmat([1:5]',1,5]); 
%% [1:5]'*ones(1,5); 

E=ones(6); 
for i=1:6
    for j=1:6
        if i <=j
            E(i,j)=2; 
        end
    end
end %% i had to cheat and look at the exercise answers for this, but I think I get the logic here (using debug and stepping through).

% for i = 1:6
%     E(i, i:end) = 2;
% end

F=ones(5);
for i=1:5
    F(:,i)= (i-1)*5;  % ooo I got this one all by my lonesome. 
end

G=ones(5); 
for i=1:5
    G(:,i)=[1 2 3 4 5]+((i-1)*5);
end

%% G=reshape(1:25, 5, 5); reshapes a vector into a matrix

H=zeros(8); % took me a long time to figure out zeros instead of ones here :) 
H(:,1:2:end)=1; 

I=zeros(8); 
for i = 1:2:8
    for j = 1:2:8
        if i == j
            I(i,j) = 1; % I understood how to code this but then looking at it, I am confused as to how I got it right..
        end
    end
end

J=ones(5); 
for i = 1:5
    J(:,i)=[0 1 2 3 4]+(i-1); 
end

% for i=1:2:8
% J(i,1)=1;
% end

K=ones(5);
for i = 1:5
    K(i,:)=i:i:5*i; %had to look up this part after playing with it for awhile. didn't think of using i that way!
end

L=ones(5);
for i = 1:5
    L(i,:)=[1:5]+((i-1)*5); %% harder than it looked
end

%% L = reshape(1:25,5,5)';

%% Q 4.2: 3d matrices

% a) Create a 3x3x3 matrix of zeros and set the very middle of the 3-d matrix to be a value of 1. 

mat3=zeros(3,3,3); 
mat3(2,2,2)=1; 

% b) Create a 5x5x5 matrix of zeros and set the middle 3x3x3 cube to 1.

mat5=zeros(5,5,5);
mat5(2:4,2:4,2:4)=1; 

%% Q 4.3: sub2ind and ind2sub

% a)  Suppose you have a 4x3 matrix (4 rows and 3 columns).  What is the index into the element that is in the 3rd row and 2nd column?

mat4x3=ones(4,3); 
sub2ind([4,3],3,2); % i was able to work it out but the [4,3] was kind of a guess--is it just the size of the matrix? 


% b) For the same size matrix, what is the row and column for the element with an index of 7?

matind([4,3],7); 

%% Q 4.4: logical operations

% a) Write a script so that if a variable 'x' is positive it prints the string 
% 'x is positive'


% And if x is negative the script prints the string
% 'x is negative'

x = 0;
y= 2; 
z=0;

if x < 0
    disp('x is negative')
elseif x > 0
    disp('x is positive')
else
end


% b) Write a statement that is true if the variable 'x' is either less than 2 or greater than pi.

x<2 || x>pi 

% c) Write a statement that is true if either x is greater than 2 and y is less than 4, or if z is equal to zero.

x>2 && y<4 || z==0

%% Q 4.5 While loops

%Write a script that repeatedly rolls two dice using this command:

% roll = ceil(rand(1,2));

% and counts the number of rolls until [1,1] (‘snake eyes’) comes up.

count=0;
roll = ceil(rand(1,2)*6);

while sum(roll) > 2
    count = count + 1;
    roll = ceil(rand(1,2)*6);
end
disp(['Snake eyes after ',num2str(count),' rolls.']);


%% Chapter 6 Homework %%
%% Created by Lindsay DeVries on 2/14/18 %%

%% 6.1

%% I worked a long time on this trying to figure out how to get the circle koffka like, and I just
%% couldn't get it to work. I played with some code I found online to make a circle, but was unsure
%% how to use it with the imagesc command. I can get the two gray sections but can't get the circle. Ugh.

close all
clear all

n_X = 100;% size of the nxn image of a Gaussian
n_Y = 100;

[rows, columns] = meshgrid(1:n_X, 1:n_Y); 

x = columns/2;
y = rows/2;

centx = x / 2;
centy = y / 2;

r_inner = 5;
r_outer = 10; 
array = (rows - centy).^2 + (columns - centx).^2; %% I got a little help with this line

% theta = 0 : (2 * pi / 10000) : (2 * pi);
% 
% pline_x = r * cos(theta) + centx;
% pline_y = r * sin(theta) + centy;
% plot(pline_x, pline_y, 'r-', 'LineWidth', 3);

cmap=[.37 .37 .37; .75 .75 .75];
% imagesc(array);
imagesc(rows);
hold on;
axis off
colormap(cmap);


%% 6.2

%% Also struggling here. It seems like it should be easy to manipulate to 'hold' the circle image and 
%% also use it as a background. I think I'm used to using 'hold on' and I'm struggling with how to layer
%% images using these commands. 

FLIP=1;

% create mesh
n = 701;

% size of the nxn image of a Gaussian
nseg=6;

% number of segments'
radius=.7;

% radius of the aperture
[X,Y] = meshgrid(linspace(-1,1,n));

% create segment pattern
theta = atan2(Y,X)./pi;
theta=mod(theta*nseg, 1);

if FLIP
    theta=max(theta(:))-theta; % TO FLIP THE DIRECTION
else
end

% create aperture
radiusimage = sqrt(X.^2+Y.^2);

aperture=NaN(size(radiusimage));
aperture(radiusimage>radius)=0;
aperture(radiusimage<=radius)=1;

illusion=theta.*aperture;

imagesc(illusion);
axis square
axis off
colormap(gray(256))
% saveas(gcf,'peripheraldrift1.jpg');


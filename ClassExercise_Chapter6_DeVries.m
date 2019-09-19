%% Chapter 6 Exercises
%% Craated by Lindsay DeVries on 2/14/2018

%%% 6.1 %%%

n = 101; % size of the nxn image of a Gaussian 
[X,Y] = meshgrid(linspace(-1,1,n)); 
X(30:40, 10:90)=.1; 
X(60:70, 10:90)=.8; 

imagesc(X); 
axis off 
colormap(gray(256)) 
% saveas(gcf,'Illusion_ColorConstancy_1.jpg');

%%% 6.2 %%%

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
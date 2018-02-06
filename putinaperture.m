function [ mat ] = putinaperture( mat, rad, backLum, type )
% Takes matrix and windows it with a circular aperture

[X,Y]=meshgrid(linspace(-pi, pi, size(mat,1)));
if strcmp(type, 'circular');
    mat(find(X.^2 + Y.^2 > rad^2))=0;
elseif strcmp(type, 'gaussian')
    mat=mat.*exp(-(X.^2+Y.^2)/rad.^2);
else
    errordlg('aperture type not recognized')
end
end


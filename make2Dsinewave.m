function [ sw2D ] = make2Dsinewave ( amp, orientation, size_ap, sf, type )
% Creates a two dimensional sinewave of size size_ap
%  [ sw2D ] = make2Dsinewave ( amp, freq, size_ap, sf )

% Returns a sinewave scaled between -1-1
[X,Y]=meshgrid(linspace(-pi, pi, size_ap));
if strcomp(type, 'grating')
    R=(cos(orientation)* X)+(sin(orientation)*Y);
    sw2D=amp*sin(R.*sf);
elseif strcmp(type, 'radial')
    Rsin=sin(R*5); imagesc(Rsin); colormap(gray(256));
elseif strcmp(type, 'spokes')
    T=atan2(Y,X); imagesc(T);  colormap(gray(256));
elseif strcmp(type, 'spiral')
    spiral=sin(2*pi*T+R)
    
end


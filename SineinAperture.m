%SineInAperture

clear all;
close all;

amp = .5;
backLum=128;
size_ap=100;
sf=6;
rad=pi/4;

[X,Y]=meshgrid(linspace(-pi, pi, size_ap));

R=sqrt(X.^2+Y.^2); imagesc(R); colormap(gray(256)); %% gives us the radius 
Rsin=sin(R*5); imagesc(Rsin); colormap(gray(256));

T=atan2(Y,X); imagesc(T);  colormap(gray(256));
Tradial=sin(5*T); imagesc(Tradial); colormap(gray(256));

spiral=sin(2*pi*T+R); imagesc(spiral); colormap(gray(256));

%% build the array %%

naps=2; sep=50;
bigMatSize=[(naps+1)*sep]+[size_ap*naps];
bigMat=backLum*ones(bigMatSize);
stpt=[sep (sep*2)+size_ap];

for i=1:naps
    for j=1:naps
        rad=(i*j)/2; sf = 3+mod(i+j,2)*3;
        [ sw2D ] = make2Dsinewave ( amp, 45, size_ap, sf );
        [ sw2D ] = putinaperture( sw2D, rad, backLum ,'gaussian');
        sw2D=((sw2D+1)*backLum+1);
        bigMat(stpt(i):stpt(i)+size_ap-1,stpt(j):stpt(j)+size_ap-1) = sw2D;
    end
end

imagesc(bigMat); colormap(gray(256));

return

for r=1:size_ap
    for c=1:size_ap
        if x(r).^2+x(c).^2>rad.^2
            sw2D(r,c)=128.5; %% mean grey number
        end
    end
end

image(sw2D);
colormap(gray(256));

% %%%% example for kid reading speeds %%%%
% figure();
% 
% for k = 1:10
%     kid10(k,:)=[2:7]+randn(1,6);
%     kid5(k,:)=[2:7]+randn(1,6)+3;
% end
% 
% subplot(1,2,1)
% image(kid5+1); colormap(gray(14))
% 
% subplot(1,2,2)
% imagesc(kid10+1); colormap(gray(14))

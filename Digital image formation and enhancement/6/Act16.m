clc;  % Clear command window.
clear;  % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
workspace;  % Make sure the workspace panel is showing.

I = imread('C:\Users\Faye\Documents\B1\1.6\faded2.jpg');
%I = imrotate(I,-180);
subplot(1,4,1);imshow(I);

R=double(I(:,:,1));
G=double(I(:,:,2));
B=double(I(:,:,3));

%Contrast Stretching
Rmin = min(R,[],'all');
Gmin = min(G,[],'all');
Bmin = min(B,[],'all');

Rmax = max(R,[],'all');
Gmax = max(G,[],'all');
Bma = max(B,[],'all');

R_stretched = (R - Rmin)/(Rmax - Rmin);
G_stretched = (G - Gmin)/(Gmax - Gmin);
B_stretched = (B - Bmin)/(Bma - Bmin);

I_CSrestored = cat(3,R_stretched,G_stretched,B_stretched);
subplot(1,4,2);imshow(I_CSrestored);

%Grey World 
Rn = R/255;
Gn = G/255;
Bn = B/255;

Rave = mean(Rn,'all');
Gave = mean(Gn,'all');
Bave = mean(Bn,'all');
Kave = (Rave + Gave + Bave)/3;

Rwb = (Kave/Rave)*Rn;
Gwb = (Kave/Gave)*Gn;
Bwb = (Kave/Bave)*Bn;

I_GWrestored = cat(3, Rwb, Gwb, Bwb);
subplot(1,4,3);imshow(I_GWrestored);

%white patch
wp = imread('C:\Users\Faye\Documents\APPHY157\B\whitepatch.jpg');

Rwpi = double(wp(:,:,1));
Gwpi = double(wp(:,:,2));
Bwpi = double(wp(:,:,3));

Rw = mean(Rwpi,'all');
Gw = mean(Gwpi,'all');
Bw = mean(Bwpi,'all');

Rwp = R/Rw;
Gwp = G/Rw;
Bwp = B/Rw;

I_WPrestored=cat(3,Rwp,Gwp,Bwp);
subplot(1,4,4);imshow(I_WPrestored);






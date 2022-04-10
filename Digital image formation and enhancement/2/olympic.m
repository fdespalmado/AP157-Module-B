clear all ; close all;
N = 500;
x = linspace(-20,20,N);
y = x;
[X,Y] = meshgrid(x,y);
Rd = ones(N,N);
Gn=Rd;Bl=Rd;

% draw colored circles
Rt = 4; r1 = 4; r2=3.5; deg = 5;
xt = 0.25+Rt*cosd(deg); yt = Rt*sind(deg);

%black ring
R = sqrt((X.^2) + (Y+Rt).^2);
Rd(R<r1 & R>r2) =0;
Gn(R<r1 & R>r2) =0;
Bl(R<r1 & R>r2) =0;

%green ring
R =sqrt((X-xt).^2 + (Y-yt).^2);
Rd(R<r1 & R>r2) = 0;
Bl(R<r1 & R>r2) = 0;

%yellow ring
R = sqrt((X+xt).^2 + (Y-yt).^2);
Bl(R<r1 & R>r2) = 0;

%red ring
R = sqrt((X-2*xt).^2 + (Y+Rt).^2);
Gn(R<r1 & R>r2) = 0;
Bl(R<r1 & R>r2) = 0;

%blue ring
R = sqrt((X+2*xt).^2 + (Y+Rt).^2);
Rd(R<r1 & R>r2) = 0;
Gn(R<r1 & R>r2) = 0;


I(:,:,1) = Rd;
I(:,:,2) = Gn;
I(:,:,3) = Bl;

subplot(1,4,1);imshow(I);
subplot(1,4,2);imshow(I(:,:,1));
subplot(1,4,3);imshow(I(:,:,2));
subplot(1,4,4);imshow(I(:,:,3));

I_img = uint8(I*255);
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.2\olympic.jpg");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.2\olympic.png");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.2\olympic.bmp");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.2\olympic.tiff");

red = uint8(Rd*255);
imwrite(red, "C:\Users\Faye\Documents\B1\1.2\red.png");
green = uint8(Gn*255);
imwrite(green, "C:\Users\Faye\Documents\B1\1.2\green.png");
blue = uint8(Bl*255);
imwrite(blue, "C:\Users\Faye\Documents\B1\1.2\blue.png");

axis equal;
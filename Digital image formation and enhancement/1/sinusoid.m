%sinusoid along the x-direction
N = 200;
x = linspace(-2,2,N);
y = linspace(-2,2,N);
[X,Y] = meshgrid(x,y);

f = 4;%frequency
A = 1;%amplitude
k = A*sin(2*pi*f*X);%wave equation 

%display image
figure (1);
imshow (k);
figure (2);
mesh(x,y,k,'edgecolor', 'k');
 
%save image files
I_img = uint8(k*255);
imwrite(I_img, "C:\Users\Faye\Documents\APPHY157\B\Module 1\sinusoid.jpg");
imwrite(I_img, "C:\Users\Faye\Documents\APPHY157\B\Module 1\sinusoid.png");
imwrite(I_img, "C:\Users\Faye\Documents\APPHY157\B\Module 1\sinusoid.bmp");
imwrite(I_img, "C:\Users\Faye\Documents\APPHY157\B\Module 1\sinusoid.tiff");


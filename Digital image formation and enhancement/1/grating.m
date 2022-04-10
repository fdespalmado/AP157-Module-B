%grating
N = 200;
x = linspace(-1,1,N);
y = linspace(-1,1,N);
[X,Y] = meshgrid(x,y);
A=zeros(N,N);

f = 5;%frequency
k = sin(2*pi*f*X);%wave equation 
A(find(k>0))=1;
A(find(k<0))=0; 

figure (1);
imshow (A);

I_img = uint8(A*255);
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\grating.jpg");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\grating.png");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\grating.bmp");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\grating.tiff");
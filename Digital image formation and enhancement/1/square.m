%square aperture
N = 200;
x = linspace(-2,2,N);
y = x;
[X,Y] = meshgrid(x,y);

R=0.5;
A=zeros(N,N);
A(find(abs(X)<R & abs(Y)<R))=1;

figure (1);
imshow (A);

I_img = uint8(A*255);
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\square.jpg");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\square.png");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\square.bmp");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\square.tiff");
%annulus
N = 200;
x = linspace(-2,2,N);
y = x;
[X,Y] = meshgrid(x,y);

r1=2;
r2=1.75;
R= sqrt(X.^2 +Y.^2);
A=zeros(N,N);
A(find(R<r1 & R>r2))=1;

figure (1);
imshow (A);

I_img = uint8(A*255);
imwrite(I_img, "C:\Users\Faye\Documents\APPHY157\B\Module 1\annulus.jpg");
imwrite(I_img, "C:\Users\Faye\Documents\APPHY157\B\Module 1\annulus.png");
imwrite(I_img, "C:\Users\Faye\Documents\APPHY157\B\Module 1\annulus.bmp");
imwrite(I_img, "C:\Users\Faye\Documents\APPHY157\B\Module 1\annulus.tiff");
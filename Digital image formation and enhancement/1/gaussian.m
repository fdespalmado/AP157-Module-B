%circular aperture with graded transmittance
N = 200;
x = linspace(-2,2,N);
y = x;
[X,Y] = meshgrid(x,y);

R= sqrt(X.^2 +Y.^2);
A=zeros(N,N);
A(find(R<1.75))=1;%aperture
a=1/(sqrt(2*pi));sigma=1;%c = sigma
z=a*exp(-(R).^2/(2*sigma^2));%gaussian function
z=z.*A;%apply gaussian transparency to aperture

figure (1);
imshow (z);
figure (2);
mesh(x,y,z);

I_img = uint8(z*255);
imwrite(I_img, "C:\Users\Faye\Documents\APPHY157\B\Module 1\gaussian.jpg");
imwrite(I_img, "C:\Users\Faye\Documents\APPHY157\B\Module 1\gaussian.png");
imwrite(I_img, "C:\Users\Faye\Documents\APPHY157\B\Module 1\gaussian.bmp");
imwrite(I_img, "C:\Users\Faye\Documents\APPHY157\B\Module 1\gaussian.tiff");
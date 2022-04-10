%sinusoid along the x-direction
N = 200;
x = linspace(-2,2,N);
y = linspace(-2,2,N);
[X,Y] = meshgrid(x,y);
A=zeros(N,N);

a = 0.5;
b = 0.8;
R = sqrt((X.^2)*(a^2) +(Y.^2)*(b^2));
A(find(R<(a*b))) = 1; 

%display image
figure (1);
imshow (A);

 
%save image files
I_img = uint8(A*255);
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\ellipse.jpg");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\ellipse.png");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\ellipse.bmp");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\ellipse.tiff");


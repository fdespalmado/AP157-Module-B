%sinusoid along the x-direction
N = 200;
x = linspace(-2,2,N);
y = linspace(-2,2,N);
[X,Y] = meshgrid(x,y);
A=zeros(N,N);

r1 = 0.5
r2 = 0.8
A(find(abs(X)<r1)) = 1; 
A(find(abs(Y)<r1)) = 1; 
A(find(abs(X)>r2)) = 0; 
A(find(abs(Y)>r2)) = 0; 

%display image
figure (1);
imshow (A);

 
%save image files
I_img = uint8(A*255);
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\cross.jpg");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\cross.png");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\cross.bmp");
imwrite(I_img, "C:\Users\Faye\Documents\B1\1.1\cross.tiff");


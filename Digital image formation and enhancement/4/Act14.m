dark_im = imread("C:\Users\Faye\Documents\B1\1.4\d.JPG");
dark = imrotate(dark_im, -90);
Igray = rgb2gray(dark);


PDF = hist(Igray(:), [0:255])/numel(Igray);
CDF = cumsum(PDF);

%plotting
subplot(3,5,1);imshow(Igray);
subplot(3,5,6);bar(PDF,'b');
subplot(3,5,11);plot(CDF,'b');

%linear CDF
x = [0:255];
desiredlinearCDF = (1/255) * x;
linearGS = interp1(desiredlinearCDF, x, CDF(Igray(:)+1));
linearIgray = reshape(linearGS, size(Igray));
linearPDF = hist(linearIgray(:), [0:255])/numel(linearIgray);
linearCDF = cumsum(linearPDF);

%plotting
subplot(3,5,2); imshow(uint8(linearIgray));

subplot(3,5,7);bar(PDF,'b');hold on
bar(linearPDF,'r');
legend({'Original','Histogram Manipulated'})

subplot(3,5,12);plot(CDF,'b');
hold on
plot(desiredlinearCDF,'g');
plot(linearCDF,'r');

%quadratic CDF
desiredquadCDF = x.^2/(255.0^2);
quadGS = interp1(desiredquadCDF, x, CDF(Igray(:)+1));
quadIgray = reshape(quadGS, size(Igray));
quadPDF = hist(quadIgray(:), [0:255])/numel(quadIgray);
quadCDF = cumsum(quadPDF);

%plotting
subplot(3,5,3); imshow(uint8(quadIgray));

subplot(3,5,8);bar(PDF,'b');hold on
bar(quadPDF,'r');

subplot(3,5,13);plot(CDF,'b');
hold on
plot(desiredquadCDF,'g');
plot(quadCDF,'r');

%cubic CDF
desiredcubicCDF = x.^3/(255.0^3);
cubicGS = interp1(desiredcubicCDF, x, CDF(Igray(:)+1));
cubicIgray = reshape(cubicGS, size(Igray));
subplot(3,5,4); imshow(uint8(cubicIgray));
cubicPDF = hist(cubicIgray(:), [0:255])/numel(cubicIgray);
cubicCDF = cumsum(cubicPDF);

%plotting
subplot(3,5,9);bar(PDF,'b');hold on
bar(cubicPDF,'r');

subplot(3,5,14);plot(CDF,'b');
hold on
plot(desiredcubicCDF,'g');
plot(cubicCDF,'r');

%sigmoid/erf CDF
range1 = linspace(-3,3,256)
desirederfCDF = 0.5*(erf(range1)+1);
erfGS = interp1(desirederfCDF, x, CDF(Igray(:)+1));
erfIgray = reshape(erfGS, size(Igray));
subplot(3,5,5); imshow(uint8(erfIgray));
erfPDF = hist(erfIgray(:), [0:255])/numel(erfIgray);
erfCDF = cumsum(erfPDF);

%plotting
subplot(3,5,10);bar(PDF,'b');hold on
bar(erfPDF,'r');
subplot(3,5,15);plot(CDF,'b');
hold on
plot(desirederfCDF,'g');
plot(erfCDF,'r');


imwrite(uint8(Igray),"C:\Users\Faye\Documents\B1\1.4\grayscale.JPG");
imwrite(uint8(linearIgray),"C:\Users\Faye\Documents\B1\1.4\linear.JPG");
imwrite(uint8(quadIgray),"C:\Users\Faye\Documents\B1\1.4\quad.JPG");
imwrite(uint8(cubicIgray),"C:\Users\Faye\Documents\B1\1.4\cubic.JPG");
imwrite(uint8(erfIgray),"C:\Users\Faye\Documents\B1\1.4\erf.JPG");



dark_im = imread("C:\Users\Faye\Documents\B1\1.5\d.JPG");
dark = imrotate(dark_im, -90);
Igray = rgb2gray(dark);

% Get histogram.
[counts, grayLevels] = imhist(Igray);

% Get cdf.
CDF = cumsum(counts);
CDF = CDF / numel(Igray);

index1 = find(CDF > 0.05, 1, 'first');
lo = grayLevels(index1);
index2 = find(CDF > 0.95, 1, 'first');
hi = grayLevels(index2);

Istretched=Igray;
R = hi-lo;
scale = 255/R;
Istretched = round(Igray-lo.*scale);
Istretched = uint8(Istretched);

PDF = hist(Igray(:), [0:255])/numel(Igray);
contrastPDF = hist(Istretched(:), [0:255])/numel(Istretched);
CDF = cumsum(PDF);
contrastCDF = cumsum(contrastPDF);

%plotting

subplot(2,2,1);imshow(Igray);
subplot(2,2,2);imshow(Istretched);
subplot(2,2,3);bar(PDF);
subplot(2,2,4);bar(PDF);hold on 
bar(contrastPDF,'r')
legend({'Original','Contrast stretched'})
xlabel('pixel values');
ylabel('Intensity')

%imwrite(uint8(Igray),"C:\Users\Faye\Documents\B1\1.5\grayscale.JPG");
%imwrite(uint8(Istretched),"C:\Users\Faye\Documents\B1\1.5\stretch2575.JPG");






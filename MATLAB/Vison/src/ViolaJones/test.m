
%Get training data
imc = double(imread('../data/g20.jpg'))/255;
imc = mean(imc, 3);
intImage = GetIntegralImage(imc);

feature = CreateFeature(5, 12, 6, 1);
feature7 = filter2(feature, intImage, 'same');


feature7(feature7 < 5) = 0;
feature7(feature7 > 10) = 0;


figure; imshow(feature7);
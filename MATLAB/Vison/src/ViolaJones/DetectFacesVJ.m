function [ resultsArray ] = DetectFacesVJ( image )
    intImage = GetIntegralImage(image);
    resultsArray = zeros(size(image, 1), size(image, 2));

    feature = CreateFeature(1, 8, 15, 1);
    feature1 = filter2(feature, intImage, 'same');
    feature1(feature1 < 5) = 0;
    feature1(feature1 >= 15) = 0;
    feature1(feature1 >= 5) = 1;


    feature = CreateFeature(2, 10, 5, 1);
    feature2 = filter2(feature, intImage, 'same');
    feature2(feature2 < 18) = 0;
    feature2(feature2 >= 25) = 0;
    feature2(feature2 >= 18) = 1;

    feature = CreateFeature(1, 6, 3, 1);
    feature3 = filter2(feature, intImage, 'same');
    feature3(feature3 < 1) = 0;
    feature3(feature3 >= 1) = 1;

    feature = CreateFeature(3, 5, 5, 1);
    feature4 = filter2(feature, intImage, 'same');
    feature4(feature4 < 2) = 0;
    feature4(feature4 >= 2) = 1;


    feature = CreateFeature(1, 8, 15, -1);
    feature5 = filter2(feature, intImage, 'same');
    feature5(feature5 < 5) = 0;
    feature5(feature5 >= 5) = 1;

    feature = CreateFeature(4, 3, 3, 1);
    feature6 = filter2(feature, intImage, 'same');

    feature6(feature6 < 30) = 0;
    feature6(feature6 >= 40) = 0;
    feature6(feature6 >= 30) = 1;
    
    feature = CreateFeature(5, 12, 6, 1);
    feature7 = filter2(feature, intImage, 'same');
    feature7(feature7 < 5) = 0;
    feature7(feature7 > 7) = 0;
    feature7(feature7 > 5) = 1;

    resultsArray = feature1 + feature2 + feature3 + feature4 + feature5 + feature6 + feature7;
    features = 7;

    resultsArray = resultsArray / features;

    figure; imshow(resultsArray);
    template = repmat(1/33, 33, 33);
    
    resultsArray = filter2(template, resultsArray, 'same');
    
end


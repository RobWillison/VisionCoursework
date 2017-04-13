function probability = FaceClassifier( image )

    imageGrey = mean(image, 3);
    %HaarFeature1
    leftCheak = sum(sum(imageGrey(11:23, 1:11, :)));
    noseBridge = sum(sum(imageGrey(11:23, 11:24, :)));
    rightCheak = sum(sum(imageGrey(11:23, 23:33, :)));
    feature1 = (leftCheak + rightCheak) / noseBridge;
    
    %HaarFeature2
    eyes = sum(sum(imageGrey(6:16, :, :)));
    checks = sum(sum(imageGrey(16:26, :, :)));
    feature2 = checks / eyes;
    %HaarFeature3
    leftSide = sum(sum(imageGrey(:, 1:16, :)));
    rightSide = sum(sum(imageGrey(:, 16:33, :)));
    feature3 = leftSide / rightSide;
    %HaarFeature4
    leftDiag = sum(sum(imageGrey(1:16, 1:16, :))) + sum(sum(imageGrey(16:33, 16:33, :)));
    rightDiag = sum(sum(imageGrey(1:16, 16:33, :))) + sum(sum(imageGrey(16:33, 1:16, :)));
    feature4 = leftDiag / rightDiag;
    probability = 1;
    %well basic shit thresholds chosen from looking at histogram
    if feature1 < 1 || feature1 > 2
        probability = 0;
    elseif feature2 < 0.6 || feature2 > 1
        probability = 0;
    elseif feature3 < 0.2 || feature3 > 1.4
        probability = 0;
    elseif feature4 < 0.7 || feature4 > 1.2
        probability = 0;
    end;
    
    feature = [feature1, feature2, feature3, feature4];
    
    

end


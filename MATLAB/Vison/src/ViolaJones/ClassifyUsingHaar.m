function [ result ] = ClassifyUsingHaar( image, feature, x, y )

    subImage = image(x:x+size(feature, 1)-1, y:y+size(feature,2)-1);

    int = subImage.*feature;
    value = sum(sum(int));
    value = value / size(feature, 1) * size(feature, 2);
    result = 0;
    if value > 0.8
        result = 1;
    end;
    

end


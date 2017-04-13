function [ intergralImage ] = GetIntegralImage( image )
    intergralImage = zeros(size(image));
    
    for i = 1:size(image,1)
        for j = 1:size(image,2)
            above = 0;
            left = 0;
            topLeft = 0;
            
            if (i > 1)
                above = intergralImage(i - 1, j);
            end;
            
            if (j > 1)
                left = intergralImage(i, j - 1);
            end;
            
            if (j > 1 & i > 1)
                topLeft = intergralImage(i - 1, j - 1);
            end;
            
            intergralImage(i, j) = image(i, j) + above + left - topLeft;
        end;
    end;

end


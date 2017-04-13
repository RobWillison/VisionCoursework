function edgeImage = EdgeDetection(image)
    %image = ImageColorFilter(image);
    imSize = size(image);
    guassianFilter = [0.003 0.013 0.022 0.013 0.002; 0.013 0.06 0.098 0.06 0.013; 0.022 0.098 0.162 0.098 0.022; 0.013 0.06 0.098 0.06 0.013; 0.003 0.013 0.022 0.013 0.002];
    image = mean(image, 3);
    edgeImage = filter2(guassianFilter, image(:, :), 'same');
    %Use sobel kernel
    horzontalConvolution = filter2([-1 0 1 ; -2 0 2 ; -1 0 1], edgeImage(:, :, 1), 'same');
    verticalConvolution = filter2([1 2 1 ; 0 0 0 ; -1 -2 -1], image(:, :, 1), 'same');
    
    horzontalConvolution = horzontalConvolution(1:imSize(1), 1:imSize(2));
    verticalConvolution = verticalConvolution(1:imSize(1), 1:imSize(2));
    
    edgeGrad = zeros(imSize(1), imSize(2));
    angle = zeros(imSize(1), imSize(2));
    
    for x = 1:imSize(1)
        for y = 1:imSize(2)
            edgeGrad(x, y) = sqrt(horzontalConvolution(x, y) ^ 2 + verticalConvolution(x, y) ^ 2);
            angle(x, y) = atan(verticalConvolution(x, y) / horzontalConvolution(x, y));
            angle(x, y) = round(angle(x, y) / (pi / 8) / 2);
        end;
    end;
    
    for y = 2:imSize(1)-1
        for x = 2:imSize(2)-1
            if angle(y, x) == 0
                if edgeGrad(y, x) < edgeGrad(y, x + 1) || edgeGrad(y, x) <= edgeGrad(y, x - 1)
                    edgeGrad(y, x) = 0;
                end;
            end;
            if angle(y, x) == 1
                if edgeGrad(y, x) < edgeGrad(y - 1, x + 1) || edgeGrad(y, x) <= edgeGrad(y + 1, x - 1)
                    edgeGrad(y, x) = 0;
                end;
            end;
            if angle(y, x) == -1
                if edgeGrad(y, x) < edgeGrad(y + 1, x + 1) || edgeGrad(y, x) <= edgeGrad(y - 1, x - 1)
                    edgeGrad(y, x) = 0;
                end;
            end;
            if abs(angle(y, x)) == 2
                if edgeGrad(y, x) < edgeGrad(y + 1, x) || edgeGrad(y, x) <= edgeGrad(y - 1, x)
                    edgeGrad(y, x) = 0;
                end;
            end;
        end;
    end;
    
    minThresh = 0.25;
    maxThresh = 0.5;
    
    for y = 2:imSize(1)-1
        for x = 2:imSize(2)-1
            if edgeGrad(y, x) < maxThresh
                edgeGrad(y, x) = 0;
            else
                edgeGrad(y, x) = 1;
            end;
        end;
    end;
    
    edgeImage = edgeGrad;
    
end


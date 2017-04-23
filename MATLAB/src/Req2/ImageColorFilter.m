function image = ImageColorFilter( image )
imsize = size(image);
% Set all values not in threshold to 0
for x = 1:imsize(1)
    for y = 1:imsize(2)
        if image(x, y, 1) < 0.6
            image(x, y, 1) = 0;
            image(x, y, 2) = 0;
            image(x, y, 3) = 0;
        end;
        if image(x, y, 2) < 0.4
            image(x, y, 1) = 0;
            image(x, y, 2) = 0;
            image(x, y, 3) = 0;
        end;
        if image(x, y, 3) < 0.2
            image(x, y, 1) = 0;
            image(x, y, 2) = 0;
            image(x, y, 3) = 0;
        end;
    end;
end;
                
end


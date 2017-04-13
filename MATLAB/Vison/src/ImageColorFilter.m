function image = ImageColorFilter( image )
%     overallRed = [];
%     overallBlue = [];
%     overallGreen = [];
%     for x = 1:xlen
%         for y = 1:ylen
%             image = images{x, y};
%             red = reshape(image(:, :, 1), 1, []);
%             green = reshape(image(:, :, 2), 1, []);
%             blue = reshape(image(:, :, 3), 1, []);
%             overallRed = [overallRed ; red];
%             overallBlue = [overallBlue ; green];
%             overallGreen = [overallGreen ; blue];
%         end;
%     end;
    
%     
%     b = histogram(overallGreen);

    
    %Red 0.6 > < 0.9
    %blue 0.4 > < 1.0
    %green 0.2 > < 0.55
    
    imsize = size(image);
    
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


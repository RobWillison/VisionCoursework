function [ result ] = IsFace( intImage )
    
    %image is 33x33
    result = 0;
    
    %center feature at 16, 11

    %TopSection = intImage(16-5, 11-6) + intImage(16+5, 11-2) - intImage(16-5, 11-2) - intImage(16+5, 11-6)
    MiddleSection = intImage(16-5, 11-2) + intImage(16+5, 11+2) - intImage(16-5, 11+2) - intImage(16+5, 11-2);
    BottomSection = intImage(16-5, 11+2) + intImage(16+5, 11+6) - intImage(16-5, 11+6) - intImage(16+5, 11+2);
    value = MiddleSection - BottomSection;
    
    if value < -3
        result = 1;
    end;
    
end


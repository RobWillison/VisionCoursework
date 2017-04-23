function [ resultMatrix ] = CreateFeature(feature, SizeX, SizeY, flip )
%     1111
%     0000
    if feature == 1
        resultMatrix = zeros(SizeX * 2, SizeY);
        resultMatrix(1, 1) = 1 * flip;
        resultMatrix(1, SizeY) = -1 * flip;
        resultMatrix(SizeX, 1) = -1 * flip;
        resultMatrix(SizeX, SizeY) = 1 * flip;

        resultMatrix(SizeX + 1, 1) = -1 * flip;
        resultMatrix(SizeX + 1, SizeY) = 1 * flip;
        resultMatrix(SizeX*2, 1) = 1 * flip;
        resultMatrix(SizeX*2, SizeY) = -1 * flip;
    end;
%     110011
%     110011
    if feature == 2
        resultMatrix = zeros(SizeX, SizeY*3);
        resultMatrix(1, 1) = 1 * flip;
        resultMatrix(1, SizeY) = -1 * flip;
        resultMatrix(SizeX, 1) = -1 * flip;
        resultMatrix(SizeX, SizeY) = 1 * flip;

        resultMatrix(1, SizeY + 1) = -1 * flip;
        resultMatrix(SizeX, SizeY + 1) = 1 * flip;
        resultMatrix(1, SizeY * 2) = 1 * flip;
        resultMatrix(SizeX, SizeY * 2) = -1 * flip;
        
        resultMatrix(1, SizeY * 2 + 1) = 1 * flip;
        resultMatrix(SizeX, SizeY * 2 + 1) = -1 * flip;
        resultMatrix(1, SizeY * 3) = -1 * flip;
        resultMatrix(SizeX, SizeY * 3) = 1 * flip;
    end;
%     1100
%     0011
    if feature == 3
        resultMatrix = zeros(SizeX*2, SizeY*2);
        resultMatrix(1, 1) = 1 * flip;
        resultMatrix(1, SizeY) = -1 * flip;
        resultMatrix(SizeX, 1) = -1 * flip;
        resultMatrix(SizeX, SizeY) = 1 * flip;

        resultMatrix(SizeX + 1, 1) = -1 * flip;
        resultMatrix(SizeX + 1, SizeY) = 1 * flip;
        resultMatrix(SizeX * 2 + 1, 1) = 1 * flip;
        resultMatrix(SizeX * 2 + 1, SizeY) = -1 * flip;
        
        resultMatrix(1, SizeY + 1) = -1 * flip;
        resultMatrix(1, SizeY * 2 + 1) = 1 * flip;
        resultMatrix(SizeX, SizeY + 1) = 1 * flip;
        resultMatrix(SizeX, SizeY * 2 + 1) = -1 * flip;
        
        resultMatrix(SizeX + 1, SizeY + 1) = 1 * flip;
        resultMatrix(SizeX + 1, SizeY * 2 + 1) = -1 * flip;
        resultMatrix(SizeX * 2 + 1, SizeY + 1) = -1 * flip;
        resultMatrix(SizeX * 2 + 1, SizeY * 2 + 1) = 1 * flip;
    end;
%     1111
%     1001
%     1111
    if feature == 4
        resultMatrix = zeros(SizeX*3, SizeY*3);
        resultMatrix(1, 1) = 1 * flip;
        resultMatrix(1, SizeY*3) = -1 * flip;
        resultMatrix(SizeX*3, SizeY*3) = 1 * flip;
        resultMatrix(SizeX*3, 1) = -1 * flip;

        resultMatrix(SizeX, SizeY) = -1 * flip;
        resultMatrix(SizeX*2, SizeY*2) = -1 * flip;
        resultMatrix(SizeX*2, SizeY) = 1 * flip;
        resultMatrix(SizeX, SizeY*2) = 1 * flip;
    end;
%     1100
%     1100
    if feature == 5
        resultMatrix = zeros(SizeX, SizeY * 2);
        resultMatrix(1, 1) = 1 * flip;
        resultMatrix(SizeX, 1) = -1 * flip;
        resultMatrix(1, SizeY) = -1 * flip;
        resultMatrix(SizeX, SizeY) = 1 * flip;

        resultMatrix(1, SizeY + 1) = -1 * flip;
        resultMatrix(SizeX, SizeY + 1) = 1 * flip;
        resultMatrix(1, SizeY*2) = 1 * flip;
        resultMatrix(SizeX, SizeY*2) = -1 * flip;
    end;
   
end


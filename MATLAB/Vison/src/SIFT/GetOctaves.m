function [ octaves ] = GetOctaves( image, numOfOctaves, blurLevels )
    octaves = [];
    for i = 1:numOfOctaves
        octaves{i} = GetOctave(image, blurLevels);
        image = imresize(image, 0.5);
    end;

end


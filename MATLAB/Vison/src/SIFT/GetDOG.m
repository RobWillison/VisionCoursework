function [ Dog ] = GetDOG( octave )
    numDogs = size(octave, 2) - 1;
    octSize = size(octave{1})
    
    Dog = zeros(numDogs, octSize(1), octSize(2));
    for i = 1:numDogs
        Dog(1, :, :) = mean(octave{i + 1} - octave{i}, 3);
    end;

end


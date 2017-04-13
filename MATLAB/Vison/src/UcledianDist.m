function [ output_args ] = UcledianDist( input_args )
%UCLEDIANDIST Summary of this function goes here
%   Detailed explanation goes here
for i = 1:nRects
    % Random classification for now
    maxPerson = 0;
    minDistance = 100000;
    for person = 1:20
        for faces = 1:32
            %uclidean distance
            distance = sqrt(sum((test_data(:, i) - facesArray{person, faces}) .^ 2));
            if distance < minDistance
                minDistance = distance;
                maxPerson = person;
            end;
        end;
    end;
    
    test_pred(i) = maxPerson;
end;

end


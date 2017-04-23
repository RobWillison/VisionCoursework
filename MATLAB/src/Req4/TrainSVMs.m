function [ svms ] = TrainSVMs( faceFeatures, classes, people )
    svms = cell(people, 1);

    for i=1:people
        y = classes;
        y(y ~= i) = 0;
        y(y ~= 0) = 1;

        svms{i} = fitcsvm(faceFeatures, y(:));
    end;
end


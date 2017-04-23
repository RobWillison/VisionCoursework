function [ nb ] = TrainNB( faceFeatures, classes, people )
    nb = fitcnb(faceFeatures, classes);


end


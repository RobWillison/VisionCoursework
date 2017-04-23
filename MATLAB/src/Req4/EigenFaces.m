function [ eigenFaces, averageFace ] = EigenFaces()
%Get training data
imc = double(imread('../../data/facedata.png'))/255;

facesArray = zeros(20 * 32, 1024);
class = [];
trainingNum = 1;
% Read in the training data
for person = 0:19
    for face = 0:31
        rect = floor([face * 64 + 1 person * 64 + 1 64 64]);
        faceimg = imc(rect(2):(rect(2)+rect(4)-1), rect(1):(rect(1)+rect(3)-1), :);
        faceimg = mean(faceimg, 3);
        faceimg = imresize(faceimg, [32 32]);
        faceimg = faceimg - mean(faceimg(:)); % subtract mean and divide standard deviation
        faceimg = faceimg / std(faceimg(:));

        facesArray(trainingNum, :) = faceimg(:);
        trainingNum = trainingNum + 1;
    end;
end;
% Calculate the average face
averageFace = sum(facesArray) / trainingNum;
%build face matrix of training face minus average face
trainingNum = 1;
for person = 1:20
    for face = 1:32
        facesArray(trainingNum, :) = facesArray(trainingNum, :) - averageFace;
        trainingNum = trainingNum + 1;
    end;
end;
% Calculate covarinace
covariance = facesArray' * facesArray;
% Get eigenVectors
[eigVecs, Diag] = eig(covariance);
% Order EigenVectors
eigVecs = fliplr(eigVecs);

eigenFaces = zeros(50, 1024);
% For the top 50 eigen faces
for face = 1:50
    eigFace = eigVecs(:, face);
    % Normalise between 0 and 1
    eigFace = eigFace - min(eigFace(:));
    eigFace = eigFace ./ max(eigFace(:));
    
    
    eigenFaces(face, :) = eigFace;
end;

end


%Get training data
% https://jeremykun.com/2011/07/27/eigenfaces/
imc = double(imread('../data/facedata.png'))/255;

facesArray = zeros(20 * 32, 1024);
class = []
trainingNum = 1;
for person = 0:19
    for face = 0:31
        rect = floor([face * 64 + 1 person * 64 + 1 64 64]);
        faceimg = imc(rect(2):(rect(2)+rect(4)-1), rect(1):(rect(1)+rect(3)-1), :);
        faceimg = mean(faceimg, 3);
        faceimg = faceimg - mean(faceimg(:)); % subtract mean and divide standard deviation
        faceimg = faceimg / std(faceimg(:));
        faceimg = imresize(faceimg, [32 32]);
        facesArray(trainingNum, :) = faceimg(:);
        trainingNum = trainingNum + 1;
        class = [class person + 1];
    end;
end;

averageFace = sum(facesArray);

trainingNum = 1;
for person = 1:20
    for face = 1:32
        facesArray(trainingNum, :) = facesArray(trainingNum, :) - averageFace;
        trainingNum = trainingNum + 1;
    end;
end;

covariance = facesArray' * facesArray;
[eigVecs, Diag] = eig(covariance);

eigenValues = eig(covariance);

eigenValues = eigenValues(end:-1:1);
eigVecs = fliplr(eigVecs);

%values between 0 and 1
eigenFaces = cell(10, 32, 32);
for face = 1:10
    eigFace = eigVecs(:, face);
    eigFace = eigFace - min(eigFace(:));
    eigFace = eigFace ./ max(eigFace(:));


    eigenFaces{face} = reshape(eigFace, 32, 32);
     
    imwrite(eigenFaces{face}, strcat('../data/eigenFace', int2str(face), '.png'));
end;
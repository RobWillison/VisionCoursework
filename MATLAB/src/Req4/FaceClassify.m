% FaceClassify.m

% Load test and training images
im = double(imread('../../data/g20.jpg'))/255;
dataIm = double(imread('../../data/facedata.png'))/255;
names={'barroso','calderon','cameron','erdogan','gillard','harper','hollande','jintao','kirchner','merkel'...
    ,'monti','myungbak','noda','obama','putin','rompuy','rousseff','singh','yudhoyono','zuma'};
nPeople=20;   % number of people (rows of dataIm)
nExamples=32; % number of examples per person (columns of dataIm)
imsz=64;      % size of face images in dataIm (square)

% Load Viola-Jones detection rectangles and set ground truth
load('../../data/vjrects', 'rects');
test_true = {'kirchner', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'monti', 'harper', 'barroso', 'hollande', 'rousseff', 'x', 'cameron', ...
    'x', 'noda', 'yudhoyono', 'calderon', 'putin', 'x', 'rompuy', 'merkel', 'x', 'x', 'obama', 'singh', 'jintao', 'zuma','myungbak'};

% Get test data
nRects = size(rects, 1);
test_data = [];
for i = 1:nRects
    imi = im(rects(i, 1):rects(i, 3), rects(i, 2):rects(i, 4), :);
    %imi the face from the g20 image
    imf = mean(imi, 3);
    %greyscale
    imf = imresize(imf, [32 32]);
    %resize
    imf = imf - mean(imf(:)); % subtract mean and divide standard deviation
    imf = imf / std(imf(:));
    
    test_data(:, i) = imf(:);
end;

%Get training data
imc = double(imread('../../data/facedata.png'))/255;

facesArray = zeros(20 * 32, 1024);
weightsArray = zeros(20 * 32, 50);
class = [];
trainingNum = 1;
[eigenFaces, averageFace] = EigenFaces();
for person = 0:19
    for face = 0:31
        rect = floor([face * 64 + 1 person * 64 + 1 64 64]);
        faceimg = imc(rect(2):(rect(2)+rect(4)-1), rect(1):(rect(1)+rect(3)-1), :);
        faceimg = mean(faceimg, 3);
        faceimg = faceimg - mean(faceimg(:)); % subtract mean and divide standard deviation
        faceimg = faceimg / std(faceimg(:));
        faceimg = imresize(faceimg, [32 32]);
        %         Calculate the weights for the image
        weights = GetEigenFaceWeights(eigenFaces, averageFace, faceimg); 
        facesArray(trainingNum, :) = faceimg(:);
        weightsArray(trainingNum, :) = weights;
        trainingNum = trainingNum + 1;
        %         Recorc Class
        class = [class person + 1];
    end;
end;

% Classify test data
test_pred = zeros(nRects, 1);
% svms = TrainSVMs(facesArray, class, 20);
%         Train Naive Bayes on training data and classes
nb = TrainNB(weightsArray, class, 20);
%         For each extracte image
for i = 1:nRects
    %         Calculate the weights for the image
    weights = GetEigenFaceWeights(eigenFaces, averageFace, test_data(:, i)');
    %         Get the Classified Class
    test_pred(i) = predict(nb, weights');
end;

% Evaluate the classification and plot results
EvaluateClassification(test_pred, test_true, names, rects, im);

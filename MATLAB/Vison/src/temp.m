% FaceClassify.m

% Load test and training images
im = double(imread('../data/g20.jpg'))/255;
dataIm = double(imread('../data/facedata.png'))/255;
names={'barroso','calderon','cameron','erdogan','gillard','harper','hollande','jintao','kirchner','merkel'...
    ,'monti','myungbak','noda','obama','putin','rompuy','rousseff','singh','yudhoyono','zuma'};
nPeople=20;   % number of people (rows of dataIm)
nExamples=32; % number of examples per person (columns of dataIm)
imsz=64;      % size of face images in dataIm (square)

% Load Viola-Jones detection rectangles and set ground truth
load('../data/vjrects', 'rects');
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
imc = double(imread('../data/facedata.png'))/255;

facesArray = zeros(20 * 32, 1024);
class = []
trainingNum = 1;
for person = 10:10
    for face = 15:15
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


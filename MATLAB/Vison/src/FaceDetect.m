% FaceDetect.m
addpath('ViolaJones');
% Read source image 
disp('[ Reading source image ]');
imc = double(imread('../data/g20.jpg'))/255;

% Extract features from image
disp('[ Extracting features ]');
% imc = mean(imf, 3); % greyscale image for now
getrect = [1 1 300 300];
% Select a region for template matching
selectRegion = 0;
disp('[ Selecting template region ]');
if (selectRegion)
    fh = figure; imshow(imc);
    rect = floor(getrect);
    template = imf(rect(2):(rect(2)+rect(4)-1), rect(1):(rect(1)+rect(3)-1), :);
    template = mean(template, 3);
    close(fh);
else
% use fixed image
    imt = double(imread('../data/obama.png'))/255;  
    imt = imresize(imt, [33 33]);
    template = imt;
    template = ImageColorFilter(template);
    template = mean(template, 3);
end;

% Compute normalised correlation of template with image
disp('[ Filtering with template ]');

imc = ImageColorFilter(imc);
imc = mean(imc, 3);
% imcEdge = EdgeDetection(imc);
% templateEdge = EdgeDetection(template);

% TODO: implement the following function

%try blurring the template and image
% template = imgaussfilt(template, 2);

% imc = imgaussfilt(imc, 2);
%figure; imshow(im)

resp = NormalisedCorrelation(imc, template);

%resp = DetectFacesVJ(imc);

% Find local maxima with non-max suppression 
disp('[ Find local maxima ]');
suppDst = 10;
[maxVal, maxPos] = FindLocalMaxima(resp, suppDst);

% Display and evaluate detections
disp('[ Evaluate detections ]');
numDetections = 50;
EvaluateDetections(imc, template, maxPos, numDetections);

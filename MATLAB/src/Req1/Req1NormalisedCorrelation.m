% FaceDetect.m
addpath('ViolaJones');
% Read source image 
disp('[ Reading source image ]');
imc = double(imread('../../data/g20.jpg'))/255;

% Extract features from image
disp('[ Extracting features ]');
imc = mean(imc, 3); % greyscale image for now
getrect = [1 1 300 300];

% use fixed image
imt = double(imread('../../data/obama.png'))/255;  
imt = imresize(imt, [33 33]);
template = imt;
template = mean(template, 3);


% Compute normalised correlation of template with image
disp('[ Filtering with template ]');

resp = NormalisedCorrelation(imc, template);


% Find local maxima with non-max suppression 
disp('[ Find local maxima ]');
suppDst = 10;
[maxVal, maxPos] = FindLocalMaxima(resp, suppDst);

% Display and evaluate detections
disp('[ Evaluate detections ]');
numDetections = 50;
EvaluateDetections(imc, template, maxPos, numDetections);

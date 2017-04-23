% Read source image 
disp('[ Reading source image ]');
imc = double(imread('../../data/g20.jpg'))/255;

% Extract features from image
disp('[ Extracting features ]');
getrect = [1 1 300 300];


imt = double(imread('../../data/obama.png'))/255;  
imt = imresize(imt, [33 33]);
template = imt;


% Compute normalised correlation of template with image
disp('[ Filtering with template ]');

% Uncomment For Colour Filter
% template = mean(template, 3);
% imc = ImageColorFilter(imc);
% imc = mean(imc, 3);
% resp = NormalisedCorrelation(imc, template);

% Uncomment For Edge Detection
% imc = EdgeDetection(imc);
% resp = NormalisedCorrelation(imc, template);


% Uncomment for Blur
% imc = mean(imc, 3);
% template = mean(template, 3);
% template = imgaussfilt(template, 2);
% imc = imgaussfilt(imc, 2);
% resp = NormalisedCorrelation(imc, template);



% Uncomment for Harr Features
% imc = mean(imc, 3);
% resp = DetectFacesVJ(imc);

% Find local maxima with non-max suppression 
disp('[ Find local maxima ]');
suppDst = 10;
[maxVal, maxPos] = FindLocalMaxima(resp, suppDst);

% Display and evaluate detections
disp('[ Evaluate detections ]');
numDetections = 50;
EvaluateDetections(imc, template, maxPos, numDetections);

function dotProd = NormalisedCorrelation(im, template)

%calculate the means of the vectorised images
templateMean = mean(template(:));

templateSize = size(template, 1) * size(template, 2);

im = im(:,:,1);
template = template(:,:,1);
size(template);
imMean = filter2(repmat(1/templateSize, size(template, 1), size(template, 2)), im, 'same');

MxY = filter2(templateMean, im);
XMy = filter2(template, imMean);
MxMy = filter2(templateMean, imMean);
XY = filter2(template, im);

dotProd = XY +  MxMy - XMy - MxY;

% calculateAbsoluteDeviation
% http://matlabtricks.com/post-19/calculating-standard-deviation-using-minimal-memory

n = filter2(ones(size(template, 1), size(template, 2)), ones(size(im, 1), size(im, 2)), 'same');

imSquared = im .^2;
q = filter2(ones(size(template, 1), size(template, 2)), imSquared, 'same');

s = filter2(ones(size(template, 1), size(template, 2)), im, 'same');

imStdDev = (q - ((s .^ 2) ./ n) ./ (n - 1));

imStdDev = sqrt(imStdDev);

dotProd = dotProd ./ (imStdDev .* std(template(:)));

end
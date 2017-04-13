function y = RobFaceDetection(im)

%calculate the means of the vectorised images
imMean = mean(im(:));
%calculate the top of r (x - mx1)'(y - my1)
im = im - imMean;
imVec = im(:,:,1);
imVecNorm = imVec / norm(imVec);



dotProd1 = filter2(HaarFeature1, imVecNorm, 'same');
dotProd2 = filter2(HaarFeature2, imVecNorm, 'same');

y = dotProd1 + dotProd2;

end
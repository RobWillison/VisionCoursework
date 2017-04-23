function [ weights ] = GetEigenFaceWeights( eigenFaces, averageFace, face )
% Take away average face
meanFace = face(:) - averageFace(:);
% Calculate dot prouct for each eigen face
for i = 1:size(eigenFaces)
    eigenFace = eigenFaces(i, :);
    weights(i) = dot(eigenFace(:), meanFace);
end;
weights = weights(:);

end


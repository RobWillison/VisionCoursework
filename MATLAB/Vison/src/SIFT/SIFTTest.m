imc = double(imread('../../data/obama.png'))/255;

octaves = GetOctaves(imc, 4, 5);

imcSize = size(imc);

for i = 3:3
    
    dog = GetDOG(octaves{i});
    maximum = imregionalmax(dog, 26);
    maximum = sum(maximum);

end;
% Throw away less than threshold
for i = 2:size(maximum, 2)-1
    for j = 2:size(maximum, 3)-1
        if maximum(1, i, j) == 1
            imc = insertShape(imc,'circle',[i j 3],'LineWidth',5);
        end;
    end;
end;

figure; imshow(imc);
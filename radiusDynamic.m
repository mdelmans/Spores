function r = radiusDynamic(imDir,pos,k)

imF = dir( fullfile(imDir, strcat('Mannitol1h_Pos', sprintf('%0.3d',pos), '*') ) );

nF = length(imF);

ind = 1:k:nF;

fName = fullfile(imDir, imF(1).name);

I = imread(fName);
I = imresize(I, 0.3);

h = figure(1);
[I2 rect] = imcrop(I);
close(h);

r = zeros(1, length(ind));

for i=1:length(ind)
    display(i);
    fName = fullfile(imDir, imF(ind(i)).name);
    I = imread(fName);
    I = imresize(I, 0.3);
    I = imcrop(I, rect);
    rC = fitRadius(I);
    ok = input('is it ok?');
    if length(ok) == 0 
        r(i) = rC;
    else
        if ok == 99
            break
        end
    end
end

end


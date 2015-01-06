%{
function r = fitRadius(I)

I = mean(I,3) / 255;

rMax = -1;

for i=0.1:0.1:0.9
    BW = edge(I,'canny',i);
    [zC rC] = findR(BW);
    if rC > rMax
        rMax = rC;
        zMax = zC;
    end
end

r = rMax;

figure(2);
    
imshow(I);
hold on;

t = linspace(0, 2*pi, 100);
plot(zMax(1)  + rMax  * cos(t), zMax(2)  + rMax * sin(t), 'r--', 'LineWidth', 1.5);


end
%}

function r = fitRadius(I)
    
    figure(2);
    
    Ic = mean(I,3) / 255;
    level = graythresh(Ic);
    
    bw = im2bw(Ic, level);
    bw = imopen(bw, strel('disk',5) );

    L = bwlabel(bw,8);
    S = regionprops(L, 'Area');
    bw = ismember(L, find([S.Area] == max([S.Area])));
    
    subplot(1,3,1);
    imshow(bw);
    
    e = edge(bw, 'canny',0.1);
    L = bwlabel(e,8);
    S = regionprops(L, 'Area');
    e = ismember(L, find([S.Area] == max([S.Area])));

    subplot(1,3,2);
    imshow(e);

    [zC rC] = findR(e);

    subplot(1,3,3);
    imshow(Ic);
    hold on;

    t = linspace(0, 2*pi, 100);
    plot(zC(1)  + rC  * cos(t), zC(2)  + rC * sin(t), 'r--', 'LineWidth', 0.5);
    
    r=rC;
    hold off;
end
function [z,r] = findR(I)

    [y,x] = find(I);

    X = [x, y];
    
    try
    [z, r] = fitcircle(X);
    catch err
        z = [0,0];
        r = 0;
    end
end
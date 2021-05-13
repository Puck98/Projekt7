load('Bakad_Data.mat')

[cov1,cov2,cov3] = kovarians(D1,D1c);
[my1,my2,my3] = vantevarde(D1, D1c);

pdf = @(x)(1/((2*pi)^(n/2)*sqrt(det(COV))))*exp((-1/2)*transpose(x-VANTE)*(COV)^(-1)*(x-VANTE));

function [D1,D1c,D2,D2c] = select(features, class)

    vect = randsample(150, 75);
    D1 = [];
    D1c = [];
    D2 = [];
    D2c = [];
    for i = 1: 150
        if(ismember(i, vect))
            D1(end + 1, :) = features(i, :);
            D1c(end + 1, :) = [class(i) i];
        else
            D2(end + 1, :) = features(i, :);
            D2c(end + 1, :) = [class(i) i];
        end
    end
end
load('Bakad_Data.mat')

[cov1,cov2,cov3] = kovarians(D1,D1c);
[my1,my2,my3] = vantevarde(D1, D1c);

pdf1 = pdf([0.2, 0.1, 0.4, 0.5], cov1, my1)

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

function a = pdf(x, covm, my)
    a = (1/((2*pi)^(2)*sqrt(det(covm))))*exp((-1/2)*(x-my)'*(covm)^(-1)*(x-my));
end
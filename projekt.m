load('Bakad_Data.mat')

[cov1,cov2,cov3] = kovarians(D1,D1c);
[my1,my2,my3] = vantevarde(D1, D1c);
[p1,p2,p3] = pvarden(D1,D1c);

K = klassa(D2,cov1,cov2,cov3,my1,my2,my3,p1,p2,p3);
for i = 1: 75
    if(K(i) ~= D2c(i,1))
        disp(K(i))
        disp(D2c(i,:))
    end
end

function klassifiering = klassa(data,cov1,cov2,cov3,my1,my2,my3,p1,p2,p3)
    klassifiering = zeros(size(data, 1),1)
    for i = 1: size(data, 1)
        sann1 = pdf(data(i,:)', cov1, my1)*p1;
        sann2 = pdf(data(i,:)', cov2, my2)*p2;
        sann3 = pdf(data(i,:)', cov3, my3)*p3;
        if sann1 >= sann2 & sann1 >= sann3
            klassifiering(i) = 1;
        end
        if sann2 >= sann1 & sann2 >= sann3
            klassifiering(i) = 2;
        end
        if sann3 >= sann2 & sann3 >= sann1
            klassifiering(i) = 3;
        end
    end
end
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

function [p1,p2,p3] = pvarden(data, dataClass)
    p1=0;p2=0;p3=0;
    for i = 1: size(data,1)
        if dataClass(i,1) == 1
            p1 = p1+1;
        end
        if dataClass(i,1) == 2
            p2 = p2 +1;
        end
        if dataClass(i,1) == 3
            p3 = p3 +1;
        end
    end
    p1 = p1/size(data,1);
    p2 = p2/size(data,1);
    p3 = p3/size(data,1);
end

function a = pdf(x, covm, my)
    a = (1/((2*pi)^(2)*sqrt(det(covm))))*exp((-1/2)*(x-my)'*inv(covm)*(x-my));
end
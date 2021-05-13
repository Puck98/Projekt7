% Kovarians
function [cov1,cov2,cov3] = kovarians(data, dataClass)
    C1 = [];
    C2 = [];
    C3 = [];
    for i = 1: size(data,1)
        if dataClass(i,1) == 1
            C1(end+1,:) = data(i,:);
        end
        if dataClass(i,1) == 2
            C2(end+1,:) = data(i,:);
        end
        if dataClass(i,1) == 3
            C3(end+1,:) = data(i,:);
        end
    end
    cov1 = cov(C1)';
    cov2 = cov(C2)';
    cov3 = cov(C3)';
end

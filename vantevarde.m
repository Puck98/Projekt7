% Väntevärde
function [my1,my2,my3] = vantevarde(data, dataClass)
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
    my1 = mean(C1)';
    my2 = mean(C2)';
    my3 = mean(C3)';
end
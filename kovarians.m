R1 = [];
R2 = [];
R3 = [];
for n = 1:75
    if D1c(n,1) == 1
       R1(end + 1,:) = D1c(n,:);  
    end 
    if D1c(n,1) == 2
       R2(end + 1,:) = D1c(n,:);
    end
    if D1c(n,1) == 3
       R3(end + 1,:) = D1c(n,:);
    end
end

D1_1 = [];
D1_2 = [];
D1_3 = [];
for j = 1:size(R1,1)
    D1_1(end + 1,:) = D1(j,:);
end
for j = (size(R1,1)+1):(size(R1,1)+size(R2,1))
    D1_2(end + 1,:) = D1(j,:);
end
for j = (size(R1,1)+size(R2,1)+1):75
    D1_3(end + 1,:) = D1(j,:);
end
cov1 = cov(D1_1)
cov2 = cov(D1_2)
cov3 = cov(D1_3)

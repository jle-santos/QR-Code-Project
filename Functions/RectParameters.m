function Parameters = RectParameters(X, Y)

Parameters = zeros(3,1);
distance = zeros(12,1);
count = 0;

for i = 1:4
    X(1, i);
    
    for j = 1:4
        
        
        
        Z = (sqrt((X(1, i) - X(1, j))^2 + (Y(1, i) - Y(1,j))^2));
        
        if Z > 1
            count = count + 1;
            distance(count) = Z;
        end   
    end

end

DU = unique(round(distance));

Parameters(1,1) = max(DU);
Parameters(2,1) = median(DU);
Parameters(3,1) = min(DU);


end


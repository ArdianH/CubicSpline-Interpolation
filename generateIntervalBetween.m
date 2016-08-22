function IB = generateIntervalBetween(X)

    intervalSize = size(X,1);
    intervalBetween = zeros(1, intervalSize-1);
   
    for i=1:intervalSize-1
        %take middle point from each pair interval point
        intervalBetween(i) = (X(i,1) + X(i+1, 1)) / 2;
    end
    
    IB = intervalBetween;
    
    
%Copyright Kelompok B12 Anum B
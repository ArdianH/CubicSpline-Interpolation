function b = generateBVector(M)
    m = size(M,1);
    n = 2;
    
    b = zeros(m,1); 
    
    % fill element to vector column b with formula (3*(yi+1 - yi-1))/(xi+1-xi)
    for i=1:m
        if ((i == 1) || (i == m))
            b(i) = 0;
        else
            b(i) = (3 * (M(i+1,n) - M(i-1,n))) / (M(i+1,1) - M(i,1));
        end
    end

    
%Copyright Kelompok B12 Anum B
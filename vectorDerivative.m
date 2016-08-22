function S = vectorDerivative(M)

    %matrix M berdimensi m x 2 (kolom 1 berisi x dan kolom 2 berisi f(x)).
    m = size(M,1);
    n = 2;
    
    %generate vector b by function call generateBVector(M).
    b = generateBVector(M);
    
    A = zeros(m);
    middle = zeros(m, 1);
    side   = zeros(m-1, 2);
    
    %create matrix A component (side1 or lower diag, middle or middle diag, side2 or upper diag)
    for i = 1:m
        if (i == 1)
            middle(i) = 1;
            side(i,1) = 1;
            side(i,2) = 0;
        elseif (i == (m-1))
            middle(i) = 4;
            side(i,1) = 0;
            side(i,2) = 1;
        elseif (i == m)
            middle(i) = 1;
        else
            middle(i) = 4;
            side(i,1) = 1;
            side(i,2) = 1;
        end
    end
    
    
    %Agregate Matrix A component
    A = A + diag(side(:,1), -1) + diag(middle(:)) + diag(side(:,2), 1);

    %solve Ax = b, in order to create x vector which is vector contains S'
    S = A\b;
    
    

%Copyright Kelompok B12 Anum B
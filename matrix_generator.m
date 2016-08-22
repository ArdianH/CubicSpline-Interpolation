function M = matrix_generator(ikir, ikan, h, functionType)

    m = abs(ikan-ikir)/h;
    n = 2;

    M = zeros(m,n);

    for i = 1:m+1
        M(i,1) = ikir;
        ikir = ikir + h;
    end

    if (functionType == 1)
        for i = 1:m+1
            a = M(i,1);
            M(i,2) = fungsi_satu(a);
        end
    elseif (functionType == 2)
        for i = 1:m+1
            a = M(i,1);
            M(i,2) = fungsi_dua(a);
        end
    else
        error('Choosed function on fourth parameter undefined. Please provide value 1 or 2');
    end
    
%Copyright Kelompok B12 Anum B
function y = fungsi_satu(x)

    if (x == 0)
        %exceptional condition
        y = 10;
    else
        %default condition
        y = 5 * sin(2*x)/x;
    end
    
%Copyright Kelompok B12 Anum B
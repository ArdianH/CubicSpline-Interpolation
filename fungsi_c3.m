function [C3] = fungsi_c3(X, Y, S)

    m  = size(S,1);
    C3 = zeros(m-1,1);
    
    for i = 1:m-1
        C3(i,1) = (2*((Y(i,1)-(Y(i+1,1))))/((X(i+1,1)-X(i,1))^3)) + ((S(i,1)+S(i+1,1)))/((X(i+1,1)- X(i,1))^2);
    end

%Copyright Kelompok B12 Anum B
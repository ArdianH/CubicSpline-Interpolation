function [C2] = fungsi_c2(X, Y, S)

    m  = size(S,1);
    C2 = zeros(m-1,1);
    
    for i = 1:m-1
        C2(i,1) = (((3*((Y(i+1,1)) - (Y(i,1)))) / (((X(i+1,1)) - (X(i,1)))^2)) - (((2*(S(i,1))) + (S(i+1,1)))  / ((X(i+1,1)) - (X(i,1)))));
    end
    
%Copyright Kelompok B12 Anum B
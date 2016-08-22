function Main(ikir, ikan, h, endCondition, functionType, nomor)
    %Main function untuk menjalankan program
    
    if (nomor == 1)
        M = matrix_generator(ikir, ikan, h, functionType);
        IntervalUji = generateIntervalBetween(M(:,1));
        Summary = cubicSpline(M, IntervalUji, endCondition, functionType);   
    elseif (nomor == 2)
        M = matrix_generator(ikir, ikan, h, functionType);
        M2 = matrix_generator(1, 5, 1, functionType);
        [M2, C] = newtonMatrix_generator(M2(:,1), M2(:,2));
        IntervalUji = generateIntervalBetween(M(:,1));
        Summary = newtonInterpolation(M, M2, C, IntervalUji, endCondition, functionType);
    else
        %do nothing
    end
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Copyright Kelompok B12 Anum B                                            %
%Ardian Hosen, Muhammad Arvin Samuar, Muhammad Fachrul, Wildan Anky Putra %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
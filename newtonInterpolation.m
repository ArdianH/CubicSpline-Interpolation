function Summary = newtonInterpolation(M, M2, C, IntervalUji, endCondition, functionType)

    %function calls, generate miscellanous variables.
    X  = M(:,1);
    Y  = M(:,2);
    S  = vectorDerivative(M);
    
    m  = size(X,1);
    %Modify x which is S' appropriate to endCondition choosed
    if (endCondition == 1)
        %naturalSpline
    elseif (endCondition == 2 && functionType == 1)
        S(1,1) = fungsi_clampedBatas(M(1,1));
        S(m,1) = fungsi_clampedBatas(M(m,1));
    elseif (endCondition == 2 && functionType == 2)
        S(1,1) = fungsi_clampedBatas2(M(1,1));
        S(m,1) = fungsi_clampedBatas2(M(m,1));
    elseif (endCondition == 3)
        endValueY = (Y(1,1) + Y(m,1))/2;
        S(1,1) = endValueY;
        S(m,1) = endValueY;
    else
        %lain-lain
    end
    C2 = fungsi_c2(X, Y, S);
    C3 = fungsi_c3(X, Y, S);

    ikir = X(1,1);
    ikan = X(size(X,1),1);
    %%%IntervalUji = -4:0.25:4;
    %IntervalUji harus berada di antara ikir dan ikan yang sama dengan ketika mengenerate matrix M, 
    %terserah berapa banyak titik yang mau diuji pada interval ikir s/d ikan tersebut.
    
    
    nSize  = size(IntervalUji,2);
    %generate temporary vector to store value
    points = [];
    newton = [];
    cubic = [];
    real   = [];
    absCubicErrors = [];
    relCubicErrors = [];
    Summary = [];
    
    maxErrCubic = 0;
    maxErrCubicPoint = 0;
    maxErrNewton = 0;
    maxErrNewtonPoint = 0;
    %operating on functions, and store results to appropriate temporary vector.
    for i=1:nSize
        t  = IntervalUji(i);
        points(i,1) = t;
        newton(i,1) = fungsi_p4(M2,C,t);
        cubic(i,1)  = fungsi_cubicSpline(t,X,Y,S,C2,C3);
        if (functionType == 1)
            real(i,1)   = fungsi_satu(t);
        elseif (functionType == 2)
            real(i,1)   = fungsi_dua(t);    %ganti fungsi builtin gamma
        else
            %no function defined
        end
        absCubicErrors(i,1)   = abs(cubic(i,1) - real(i,1));
        relCubicErrors(i,1)   = abs(cubic(i,1) - real(i,1))/abs(real(i,1));
        absNewtonErrors(i,1)  = abs(newton(i,1) - real(i,1));
        relNewtonErrors(i,1)  = abs(newton(i,1) - real(i,1))/abs(real(i,1));
        
        %errorMax
        if (relCubicErrors(i,1) > maxErrCubic)
            maxErrCubic = relCubicErrors(i,1);
            maxErrCubicPoint = t;
        end
        if (relNewtonErrors(i,1) > maxErrNewton)
            maxErrNewton = relNewtonErrors(i,1);
            maxErrNewtonPoint = t;
        end
    end
    
    
    %generate summary matrix
    Status = horzcat(points(:,1), newton(:,1), cubic(:,1), real(:,1), absNewtonErrors(:,1), absCubicErrors(:,1), relNewtonErrors(:,1), relCubicErrors(:,1));
    text = {'point' 'newton' 'cubic' 'real' 'absNewtonError' 'absCubicError' 'relNewtonError' 'relCubicError'};
    Summary = dataset({Status,text{:}});
    
    %print summary and plot
    Summary
    plot(IntervalUji,newton,':r', IntervalUji,cubic,'--g', IntervalUji,real,'b')
    legend('newton','cubic','real')
    message1 = sprintf('Error cubic spline maksimum sebesar %d terjadi di titik %d pada interval %d s/d %d', maxErrCubic, maxErrCubicPoint, ikir, ikan)
    message2 = sprintf('Error polinomial newton maksimum sebesar %d terjadi di titik %d pada interval %d s/d %d', maxErrNewton, maxErrNewtonPoint, ikir, ikan)
    
    
%Copyright Kelompok B12 Anum B
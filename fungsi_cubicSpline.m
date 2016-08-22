function y = fungsi_cubicSpline(t,X,Y,S,C2,C3)

    m = size(X,1);
    in = 0;
    for i=1:m
        if (i <= m-1)
            %jika titik uji t berada pada titik subinterval atau berada di
            %bawah titik subinterval, maka gunakan fungsi cubicspline subinterval i tersebut
            if (t >= X(i,1) && t < X(i+1,1))
                in = i;
            end
        else
            %jika titik uji t berada pada titik interval akhir, maka
            %gunakan fungsi cubicspline subinterval sebelumnya.
            if (t == X(i,1))
                in = i-1;
            else
                %node can't be interpolate in any interval
            end
        end
    end

    %run spline function based on interval
    if (in == 0)
        error('Titik berada di luar interval, tidak dapat diinterpolasi');
    else
        y = Y(in,1)+ (S(in,1) * (t - X(in,1))) + (C2(in,1) * ((t - X(in,1))^2)) + (C3(in,1) * ((t - X(in,1))^3));
    end
    
    
%Copyright Kelompok B12 Anum B
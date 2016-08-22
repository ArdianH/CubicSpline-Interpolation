function p4 = fungsi_p4(M,C,x)

    p4 = C(1,1) + (C(2,1) * (x - M(1,1))) + (C(3,1) * ((x - M(1,1)) * (x - M(2,1)))) + (C(4,1) * ((x - M(1,1)) * (x - M(2,1)) * (x - M(3,1)))) + (C(5,1) * ((x - M(1,1)) * (x - M(2,1)) * (x - M(3,1)) * (x - M(4,1))));
end

%Copyright Kelompok B12 Anum B
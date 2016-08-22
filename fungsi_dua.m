function y = fungsi_dua(x)

    syms t;
    y = eval(int(t^(x-1)*exp(1)^(-t),0,Inf));
    
%Copyright Kelompok B12 Anum B
function [M,C] = newtonMatrix_generator(X, Y)
M = zeros(5,6);
for i=1:5
    M(i,1)=X(i);
    M(i,2)=Y(i);
end
for i=2:5
    for j=3
      if i>=j-1
         M(i,j) = (M(i,j-1)-M(i-1,j-1)) / (M(i,1)-M(i-1,1));
      end
    end
    for j=4
      if i>=j-1
         M(i,j) = (M(i,j-1)-M(i-1,j-1)) / (M(i,1)-M(i-2,1));
      end
    end
    for j=5
      if i>=j-1
         M(i,j) = (M(i,j-1)-M(i-1,j-1)) / (M(i,1)-M(i-3,1));
      end
    end
    for j=6
      if i>=j-1
         M(i,j) = (M(i,j-1)-M(i-1,j-1)) / (M(i,1)-M(i-4,1));
      end
    end
end

for i=1:5
    C(i,1) = M(i, i+1);
end

%Copyright Kelompok B12 Anum B
function [Zx,Zy] = shrink_mctv2_1(lamda, Tx,Ty)

    [m, n] = size(Tx);
    it_num = 0;
    numItr = 100; % maximum times of iteration
    rectol = 0.001; % stopping tolerance
    b = 0.05 / lamda; % nonconvexity parameter
    Zx = zeros(m,n);
    Zy = zeros(m,n);
    Ux = ones(m,n);
    Uy = ones(m,n);
    
    while it_num < numItr && norm(Ux+Uy - Zx-Zy) > rectol
        [Px, Py] = shrink_tv2_1(1/b, Zx, Zy);
        Wx = Tx + lamda * b * (Zx - Px);
        Wy = Ty + lamda * b * (Zy - Py);
        Ux = Zx;
        Uy = Zy;
        [Zx,Zy] = shrink_tv2_1(lamda, Wx, Wy);
        
        it_num = it_num + 1;
    end
    
end
function X = shrink_mctv(lamda, Y)

    [m, n] = size(Y);
    it_num = 0;
    numItr = 100; % maximum times of iteration
    rectol = 0.001; % stopping tolerance
    b = 0.05 / lamda; % nonconvexity parameter
    X = zeros(m,n);
    U = ones(m,n);
    
    while it_num < numItr && norm(U - X) > rectol
        W = Y + lamda * b * (X - shrink_tv(1 / b, X));
        U = X;
        X = shrink_tv(lamda, W);
        it_num = it_num + 1;
    end
    
end
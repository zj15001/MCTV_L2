function X = rec_tv(R, Y, lamda, rho, numItr, rectol)
% An effcient ADMM algorithm for MR image reconstruction

% rec_tv solves the TVL1-L2 model:
% min lamda * TV(X) + 0.5 * |RF * X - Y|_2^2

% Inputs:

% R       -- sampling matrix
% Y       -- k-space data
% lamda   -- total variation penalty parameter
% rho     -- augmented Lagrangian parameter
% numItr  -- maximum times of iteration
% rectol  -- stopping tolerance

% Outputs: 
% X       -- reconstructed image

% Yilin Liu, Aug 7, 2018

    [m, n] = size(Y);
    scale = sqrt(m * n);
    X  = zeros(m, n);
    Zx = zeros(m, n);
    Zy = zeros(m, n);
    Ux = zeros(m, n);
    Uy = zeros(m, n);
    X0 = ones(m, n);

    prd = 1;
    uker = R + lamda * rho * (abs(psf2otf([prd, -prd], [m, n])).^2 + abs(psf2otf([prd; -prd], [m, n])).^2);
    it_num = 0;
    
    while it_num < numItr && norm(X - X0) > rectol
       %% update X0
        X0 = X;
        
       %% update X
       %RHS = ifft2(R.*Y) * scale + rho * lamda * (Dxt(Zx - Ux) + Dyt(Zy - Uy));
       RHS = ifft2(R.*Y) * scale + rho * lamda * (Dxt(Zx) + Dyt(Zy) - (Dxt(Ux) + Dyt(Uy)));
        % RHS = ifft2(R.*Y) * scale + rho * lamda * (Dxt(Zx) + Dyt(Zy)) - rho*lamda * (Dxt(Ux) + Dyt(Uy));
        X = abs(ifft2(fft2(RHS)./uker));
        
       %% update Z
        Tx = (Ux + Dx(X));
        Ty = (Uy + Dy(X));
        Zx = shrink_tv(1/rho, Tx);
        Zy = shrink_tv(1/rho, Ty);
        
       %% update U
        Ux = Ux + (Dx(X) - Zx);
        Uy = Uy + (Dy(X) - Zy);
        
        it_num = it_num + 1;
    end
end
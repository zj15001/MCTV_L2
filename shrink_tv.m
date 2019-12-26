function X = shrink_tv(lamda, Y)
    X = max(abs(Y) - lamda, 0).*sign(Y);
end


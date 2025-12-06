function runA = my_trap(x, y)
    runA = 0.0;
    top = size(x,2);
    for i = 2:top
        dx = x(i) - x(i-1);
        avy = (y(i) + y(i-1) )/2;
        runA = runA + dx*avy;
    end
end



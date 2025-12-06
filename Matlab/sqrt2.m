function gus = sqrt2(n)
    real = sqrt(2);
    gus = 0;
    fprintf("Iteration         Estimate         Difference\n");
    for i = 1:n
        gus = 1 + 1/(1+gus);
        fprintf("    %.16f    %.16f    %.16f\n",i,gus,abs(real-gus));
    end
end

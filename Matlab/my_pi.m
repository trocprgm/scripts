function vec = my_pi(n)
    gus = 0;
    vec = [];
    for i = 0:1:n
        gus = gus + 4/(1+2*i) * (-1)^i;
        v = [i gus]';
        vec(:,end + 1) = v;
    end
end



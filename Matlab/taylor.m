function taylor()
    % Establishing x as a symbolic variable allows us to use matlab's symbolic toolkit like diff()
    syms x;
    % The function in question
    f = sin(x)
    a = 0
    % p is the point we are solving for
    p = 5*pi/2
    f1 = subs(f,x,a);
    tf = f1;
    rfr = double(subs(f,x,p));
    for i = 1:20
        d(i) = subs(diff(f,x,i), x, a);
        tf = tf + (d(i)*(x-a)^i)/factorial(i);
        tfr = double(subs(tf,x,p));
        errr = double(tfr - rfr);
        fprintf("iteration: %d, estimate: %.2f, error:%f,x = %d \n",i,tfr,errr,p);
    end


%    disp(sin(p))
%    disp(tfr)
%    disp(tf)
end


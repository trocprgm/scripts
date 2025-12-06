function ftime()
    %Time flight for 35 degree
    V_i = [10 15 20 25 30];
    T_f = [1.20 1.71 2.26 3.15 3.42];
    plot(V_i,T_f, 'o')
    xlabel("Initial Velocity (m/s)")
    ylabel("Flight Time (s)")
end


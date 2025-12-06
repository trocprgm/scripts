function projmap(VO, tflight, theta)
    %describes the model for the data
    map = linfit(VO, tflight)
    %axis labels
    ylabel("flight time (s)");
    xlabel("Initial Velocity (m/s)");
    %experimental value of g
    g = 2/map(1) * sind(theta)
    %theoretically b is zero, so the difference between theoretical and experimental b is map(2)
    map(2)
end



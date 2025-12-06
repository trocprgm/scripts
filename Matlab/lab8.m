function lab8()
    clear;
    clf;
    load('flightdata.mat');
    theta = 30;
    V0 = velo(1,:);
    xmax = velo(2,:);
    plot(V0,xmax,'x');
    title("Initial Velocity and max height");
    xlabel("V_0 (m/s)");
    ylabel("X_m (m)");
    % REGRESSION ANALYSIS
    % perform 2nd order polyfit on V0,xmax data; assign output to Coeffs
    coefs = polyfit(V0,xmax,2)
    % use fprintf to display best-fit values of a2, a1, a0
    fprintf('%.4fx^2 + %.4fx + %.4f\n',coefs);
    % use polyval with Coeffs and V0 to create xmaxModel vector
    V0Model = linspace(V0(1),max(V0),100);
    xmaxmod = polyval(coefs,V0Model);
    % hold previous plot to prevent overwriting it
    hold on;
    % add V0,xmaxModel values to plot as a solid curve
    plot(V0Model,xmaxmod);
    % turn plot hold off
    hold off;
    % calculate experimental value of g from a2 (see mapping above)
    g = (2*sind(theta)*cosd(theta))/coefs(1);
    % use fprintf to display value of g
    fprintf('g = %.4f m/s^2\n',g);
    
end

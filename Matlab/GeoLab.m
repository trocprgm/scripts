function GeoLab(Area, Feret)
    GeoLabF1(Area, Feret)
end

function GeoLabF1(area, x)
    x = sort(x);
    x = (area.*x)./(area)
    % fmean = 
    fmean = mean(x)
    fstd = std(x)
    fcdf = 100 * normcdf(x, fmean, fstd);
    f90 = norminv(0.9, fmean, fstd)
    f50 = norminv(0.5, fmean, fstd)
    f10 = norminv(0.1, fmean, fstd)
    
    % fp = norminv(x, fmean, fstd)
    % x = log(x)
    plot(x, fcdf)
    xlabel("Feret Diameter");
    ylabel("Percent Finer by Feret Diameter");
    title("Cumulative Area Percent Finer Versus Feret Diameter");
    hold on;
    scatter(x, fcdf,'b', 'filled')
    scatter(f90, 90, 'r', 'filled');
    scatter(f50, 50, 'g', 'filled');
    scatter(f10, 10, 'y', 'filled');
    line("xdata", [10^-2 f90],"ydata", [90 90], "linestyle", "--", "color", "black")
    line("xdata", [f90 f90],"ydata", [0 90], "linestyle", "--", "color", "black")
    line("xdata", [10^-2 f50],"ydata", [50 50], "linestyle", "--", "color", "black")
    line("xdata", [f50 f50],"ydata", [0 50], "linestyle", "--", "color", "black")
    line("xdata", [10^-2 f10],"ydata", [10 10], "linestyle", "--", "color", "black")
    line("xdata", [f10 f10],"ydata", [0 10], "linestyle", "--", "color", "black")
    set(gca, 'xscale', 'log')
    grid on;
    hold off;
end



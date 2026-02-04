function examplefigure()

    x = linspace(0,10,50);
    y1 = sin(x);
    y2 = sin(x/2);
    y3 = 2*sin(x);
    grid on

    % tiledlayout(2,1)
    % nexttile
    subplot (2, 1, 1)

    plot(x,y1)
    title('Combine Plots')

    hold on

    plot(x,y2)

    scatter(x,y3) 
    grid on

    hold off

    % Octave
    subplot(2,1,2)

    % Matlab
    % nexttile

    scatter(x,y2)
    
    title('Plot 2')
end

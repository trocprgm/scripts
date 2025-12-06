function Projectile(v_o,theta)
    g = 9.81;
    v_ox = cosd(theta) * v_o;
    v_oy = sind(theta) * v_o;
    t_f = 2*v_oy/g;
    t = linspace(0,t_f,100);
    x = t* v_ox;
    y = (-g/2)*t.^2 + v_oy*t; 
    v_y = -g * t + v_oy;
    ymax = max(y)
    t_p = t(find(y==ymax))
    assignin('base','t',t);
    assignin('base','x',x);
    assignin('base','y',y);
    figure
    nexttile
    plot(t,x);
    title("x pos vs time");
    xlabel("time(s)");
    grid on;
    nexttile
    hold on;
    plot(t,y);
    scatter(t_p, ymax,'filled');
    title("y pos vs time");
    grid on;
    xlabel("time(s)");
    nexttile
    plot(t,v_y);
    title("velocity vs time");
    grid on;
    xlabel("time(s)");
end

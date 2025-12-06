function lab9()
    close all;
    clear;
    load('RLdata.txt');
    t = RLdata(:,1)';
    I = RLdata(:,2)';
    lnI = log(I);
    figure;
    subplot(1,2,2);
    parm = linfit(t,lnI);
    m = parm(1);
    b = parm(2);
    tau = -1/m;
    I0 = exp(b);
    xlabel("t (s)");
    ylabel("ln(I)");
    title("Linearized RL plot");
    subplot(1,2,1);
    tmod = linspace(min(t),max(t),100);
    Imod = I0 * exp(-tmod./tau);
    plot(tmod,Imod);
    hold on;
    scatter(t,I,'filled');
    title("Inductor Current Decay");
    xlabel("Time (s)");
    ylabel("Current (Amps)");
    hold off;
    fprintf("I(t) = %.4f * e^(-t/%.4f)\n",I0,tau);
    my_trap(t,I)
    fmod = @(t) I0 * exp(-t/tau)
    integral(fmod,0,max(t))
    I0 * tau
    fprintf("\nTotal charge estimated from measured data by trapezoidal rule is %.4f Coulombs.\n",my_trap(t,I));
    fprintf("\nTotal charge estimated from measured data by integral rule is %.4f Coulombs.\n",integral(fmod,0,max(t)))
    fprintf("\nTotal charge estimated from measured data by exact integral rule is %.4f Coulombs.\n",I0 * tau);
    L = input("Gibs L\n");
    figure(3);
    subplot(1,3,1);
    plot(t(2:end) - diff(t)/2,diff(I));
    title("diff applied to measured current");
    xlabel("Time (s)");
    ylabel("Current (A)");
    subplot(1,3,2);
    plot(t(2:end)-diff(t)/2,diff(fmod(t)));
    xlabel("Time (s)");
    ylabel("Current (A)");
    title("diff applied to model"); 
    diff(fmod(t))
    subplot(1,3,3);
    fdmod = @(t) I0 * (-1/tau) * exp(-t/tau);
    plot(t,fdmod(t));
    xlabel("Time (s)");
    ylabel("Current (A)");
    title("Exact Derivative");

end
    

function cheat(arg)
    if strcmpi(arg,'color')
        fprintf("\nMatlab Colors\n")
        pa = [["Blue" "Orange" "Yellow" "Purple" "Green" "Baby Blue" "Burgundy"]'  [ "#0072BD"	"#D95319"	"#EDB120"	"#7E2F8E"	"#77AC30"	"#4DBEEE"	"#A2142F"]'];
        tripc = ["[0 0.4470 0.7410]"; "[0.8500 0.3250 0.0980]";	"[0.9290 0.6940 0.1250]";	"[0.4940 0.1840 0.5560]";	"[0.4660 0.6740 0.1880]";	"[0.3010 0.7450 0.9330]";	"[0.6350 0.0780 0.1840]"];
        disp([pa tripc])
    end
    if strcmpi(arg,'plot')
        fprintf("\n plot(x, y1, 'r--o', 'LineWidth', 2, 'MarkerSize', 6); % Red dashed line with circles \n\n");
        disp(newline)
    end
end

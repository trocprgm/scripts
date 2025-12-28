function params = Re ( Renold )
    if 4000 < Renold
        params = "Turbulent";
    else if Renold < 2300
            params = "Laminar";
    else
            params = "Transitional";
    end
end

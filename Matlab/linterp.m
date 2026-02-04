function [params] = linterp ( Mat, index )
Top = Mat(1, :);
Bot = Mat(2, :);
fg = Top-Bot;
params = (index - Top(1))/fg(1) * fg + Top;
end

function [params] = linterp ( ind , sec, index )
Mat = [ind sec]
Top = Mat(1, :);
Bot = Mat(2, :);
fg = Top-Bot;
params = (index - Top(1))/fg(1) * fg + Top;
end

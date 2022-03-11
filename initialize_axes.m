function ax = initialize_axes(ax)
%INITIALIZE_AXES Summary of this function goes here
%   Detailed explanation goes here
ax.XLim = [0 1]; ax.YLim = [0 1]; ax.ZLim = [0 1];
ax.XGrid = 'on'; ax.YGrid = 'on'; ax.ZGrid = 'on';
ax.XLabel.String = 'x'; ax.XLabel.FontSize = 12;
ax.YLabel.String = 'y'; ax.YLabel.FontSize = 12;
ax.ZLabel.String = 'z'; ax.ZLabel.FontSize = 12;
ax.View = [-45 30];
ax.Box = 'on';
ax.Projection = 'perspective';
end


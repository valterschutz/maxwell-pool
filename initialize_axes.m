function ax = initialize_axes(ax)
%INITIALIZE_AXES Default properties for axes ax
ax.XLim = [0 1]; ax.YLim = [0 1]; ax.ZLim = [0 1];
ax.XGrid = 'on'; ax.YGrid = 'on'; ax.ZGrid = 'on';
ax.XLabel.String = 'x [m]'; ax.XLabel.FontSize = 12;
ax.YLabel.String = 'y [m]'; ax.YLabel.FontSize = 12;
ax.ZLabel.String = 'z [m]'; ax.ZLabel.FontSize = 12;
ax.View = [-45 30];
ax.Box = 'on';
ax.Projection = 'perspective';
end


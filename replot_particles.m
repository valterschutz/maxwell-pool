function replot_particles(ax,particles,trajectory)
%PLOT_PARTICLES replots particles in particles in axes ax.
%   If trajectory is true, plot trajectory. Otherwise only plot current
%   position

% Update particle positions and shadows
for j=1:length(particles)
    x = particles(j).position(1);
    y = particles(j).position(2);
    z = particles(j).position(3);
    
    if trajectory
        hold(ax,'on')
        particles(j).plotobj = plot3(x, y, z, 'Marker','.', 'Color', particles(j).color, 'MarkerSize', particles(j).size);
        hold(ax,'off')
    else
        particles(j).plotobj.XData = x;
        particles(j).plotobj.YData = y;
        particles(j).plotobj.ZData = z;
    end

    % Update shadows if they exist
    if isfield(particles(j), 'xshadow_plotobj')
        particles(j).xshadow_plotobj.YData = y;
        particles(j).xshadow_plotobj.ZData = z;
    
        particles(j).yshadow_plotobj.XData = x;
        particles(j).yshadow_plotobj.ZData = z;
    
        particles(j).zshadow_plotobj.XData = x;
        particles(j).zshadow_plotobj.YData = y;
    end
end
end


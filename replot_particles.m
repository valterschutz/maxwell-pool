function replot_particles(ax,particles,trajectory)
%PLOT_PARTICLES replots particles in particles in axes ax.
%   If trajectory is true, plot trajectory. Otherwise only plot current
%   position

% Update particle positions and shadows
for j=1:length(particles)
    x = particles(j).x(1);
    y = particles(j).x(2);
    z = particles(j).x(3);
    
    if trajectory
        hold(ax,'on')
        particles(j).p = plot3(x, y, z, 'Marker','.', 'Color', particles(j).color, 'MarkerSize', particles(j).size);
        hold(ax,'off')
    else
        particles(j).p.XData = x;
        particles(j).p.YData = y;
        particles(j).p.ZData = z;
    end

    % Update shadows if they exist
    if isfield(particles(j), 'px')
        particles(j).px.YData = y;
        particles(j).px.ZData = z;
    
        particles(j).py.XData = x;
        particles(j).py.ZData = z;
    
        particles(j).pz.XData = x;
        particles(j).pz.YData = y;
    end
end
end


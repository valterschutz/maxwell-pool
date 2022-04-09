function replot_particles(particles,trajectory)
%PLOT_PARTICLES replots particles in particles in axes ax.
%   If trajectory is true, plot trajectory. Otherwise only plot current
%   position

% Update particle positions and shadows
for j=1:length(particles)
    x = particles(j).x(1);
    y = particles(j).x(2);
    z = particles(j).x(3);
    
    if trajectory
        hold on
        particles(j).p = plot3(x, y, z, 'Marker','.', 'Color', particles(j).color, 'MarkerSize', particles(j).size);
        hold off
    else
        particles(j).p.XData = x;
        particles(j).p.YData = y;
        particles(j).p.ZData = z;
    end
%     
%     particles(j).px.YData = y;
%     particles(j).px.ZData = z;
% 
%     particles(j).py.XData = x;
%     particles(j).py.ZData = z;
% 
%     particles(j).pz.XData = x;
%     particles(j).pz.YData = y;
end
end


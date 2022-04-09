function particles = plot_particles(ax,particles,shadows)
%PLOT_PARTICLES plots particles in axes ax
%   If shadows is true, plot shadows on the side of the box.
hold(ax,'on');
for j=1:length(particles)
    x = particles(j).x(1);
    y = particles(j).x(2);
    z = particles(j).x(3);
    
    particles(j).p = plot3(ax,x, y, z, 'Marker','.', 'Color', particles(j).color, 'MarkerSize', particles(j).size);
    if shadows
        particles(j).px = plot3(ax,1, y, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',particles(j).color);
        particles(j).py = plot3(ax,x, 1, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',particles(j).color);
        particles(j).pz = plot3(ax,x, y, 0, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',particles(j).color);
    end
end
hold(ax,'off');
end


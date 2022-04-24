function particles = plot_particles(ax,particles,shadows)
%PLOT_PARTICLES Plots particles in axes ax
%   If shadows is true, plot shadows on the side of the box.
hold(ax,'on');
for j=1:length(particles)
    x = particles(j).position(1);
    y = particles(j).position(2);
    z = particles(j).position(3);
    
    particles(j).plotobj = plot3(ax,x, y, z, 'Marker','.', 'Color', particles(j).color, 'MarkerSize', particles(j).size);
    if shadows
        particles(j).xshadow_plotobj = plot3(ax,1, y, z, 'Marker','o', 'MarkerSize', particles(j).size/4,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',particles(j).color);
        particles(j).yshadow_plotobj = plot3(ax,x, 1, z, 'Marker','o', 'MarkerSize', particles(j).size/4,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',particles(j).color);
        particles(j).zshadow_plotobj = plot3(ax,x, y, 0, 'Marker','o', 'MarkerSize', particles(j).size/4,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',particles(j).color);
    end
end
hold(ax,'off');
end


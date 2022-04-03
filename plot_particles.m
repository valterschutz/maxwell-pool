function particles = plot_particles(ax,particles)
%PLOT_PARTICLES plots particles in axes ax
%   Detailed explanation
hold(ax,'on');
for j=1:length(particles)
    particle = particles(j);
    x = particle.x(1);
    y = particle.x(2);
    z = particle.x(3);
    
    particles(j).p = plot3(ax,x, y, z, 'Marker','.', 'Color', particles(j).color, 'MarkerSize', particles(j).size);
%     particles(j).px = plot3(ax,1, y, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',particles(j).color);
%     particles(j).py = plot3(ax,x, 1, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',particles(j).color);
%     particles(j).pz = plot3(ax,x, y, 0, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',particles(j).color);
end
hold(ax,'off');
end


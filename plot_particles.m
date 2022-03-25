function particles = plot_particles(ax,particles)
%PLOT_PARTICLES plots particles in axes ax
%   Detailed explanation
hold(ax,'on');
for j=1:length(particles)
    particle = particles(j);
    color = particle.color;
    x = real(particle.x(1,2)+particle.x(2,1))/2;
    y = imag(particle.x(2,1)-particle.x(1,2))/2;
    z = real(particle.x(1,1)-particle.x(2,2))/2;
    
    particles(j).p = plot3(ax,x, y, z, 'Marker','.', 'Color', particles(j).color, 'MarkerSize', 50);
%     particles(j).px = plot3(ax,1, y, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',particles(j).color);
%     particles(j).py = plot3(ax,x, 1, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',particles(j).color);
%     particles(j).pz = plot3(ax,x, y, 0, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',particles(j).color);
end
hold(ax,'off');
end


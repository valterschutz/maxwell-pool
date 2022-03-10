function particles = plot_particles(ax,particles)
%PLOT_PARTICLES plots particles in axes ax
%   Detailed explanation
hold(ax,'on');
for j=1:length(particles)
    particle = particles(j);
    color = particle.color;
    p = plot3(ax,real(particle.x(1,2)+particle.x(2,1))/2, imag(particle.x(2,1)-particle.x(1,2))/2, real(particle.x(1,1)-particle.x(2,2))/2, '.', 'Color', color, 'markersize', 50);
    particles(j).p = p;
%     plot3(ax,real(test_ball.x(1,2)+test_ball.x(2,1))/2, imag(test_ball.x(2,1)-test_ball.x(1,2))/2, 0, 'o', 'markersize', 15, 'MarkerEdgeColor', color, 'MarkerFaceColor', [0.9 0.9 0.9])
%     plot3(ax,real(test_ball.x(1,2)+test_ball.x(2,1))/2, 1, real(test_ball.x(1,1)-test_ball.x(2,2))/2, 'o', 'markersize', 15, 'MarkerEdgeColor', color, 'MarkerFaceColor', [0.9 0.9 0.9])
%     plot3(ax,1, imag(test_ball.x(2,1)-test_ball.x(1,2))/2, real(test_ball.x(1,1)-test_ball.x(2,2))/2, 'o', 'markersize', 15, 'MarkerEdgeColor', color, 'MarkerFaceColor', [0.9 0.9 0.9])
end
hold(ax,'off');
end


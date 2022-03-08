function [] = plot_particles(ax,particle_list)
%PLOT_PARTICLES plots particles in particle_list in axes ax
%   Detailed explanation goes here

% Plot particles and shadows
for j=1:length(particle_list)
    test_ball = particle_list(j);
    color = particle_list(j).color;
    plot3(ax,real(test_ball.x(1,2)+test_ball.x(2,1))/2, imag(test_ball.x(2,1)-test_ball.x(1,2))/2, real(test_ball.x(1,1)-test_ball.x(2,2))/2, '.', 'Color', color, 'markersize', 50)
    hold on, grid on, axis equal, axis([0 1 0 1 0 1]), xlabel('x'), ylabel('y'), zlabel('z')
    plot3(ax,real(test_ball.x(1,2)+test_ball.x(2,1))/2, imag(test_ball.x(2,1)-test_ball.x(1,2))/2, 0, 'o', 'markersize', 15, 'MarkerEdgeColor', color, 'MarkerFaceColor', [0.9 0.9 0.9])
    plot3(ax,real(test_ball.x(1,2)+test_ball.x(2,1))/2, 1, real(test_ball.x(1,1)-test_ball.x(2,2))/2, 'o', 'markersize', 15, 'MarkerEdgeColor', color, 'MarkerFaceColor', [0.9 0.9 0.9])
    plot3(ax,1, imag(test_ball.x(2,1)-test_ball.x(1,2))/2, real(test_ball.x(1,1)-test_ball.x(2,2))/2, 'o', 'markersize', 15, 'MarkerEdgeColor', color, 'MarkerFaceColor', [0.9 0.9 0.9])
end
hold off
drawnow
end


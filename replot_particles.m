function [] = replot_particles(ax,particle_list)
%PLOT_PARTICLES replots particles in particle_list in axes ax
%   Detailed explanation goes here

% Plot particles and shadows
for j=1:length(particle_list)
    test_ball = particle_list(j);
    set(test_ball.p, 'XDataSource',real(test_ball.x(1,2)+test_ball.x(2,1))/2);
    set(test_ball.p, 'YDataSource',imag(test_ball.x(2,1)-test_ball.x(1,2))/2);
    set(test_ball.p, 'ZDataSource',real(test_ball.x(1,1)-test_ball.x(2,2))/2);
end
end


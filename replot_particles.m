function [] = replot_particles(particles)
%PLOT_PARTICLES replots particles in particles in axes ax
%   Detailed explanation goes here

% Update particle positions and shadows
for j=1:length(particles)
    x = real(particles(j).x(1,2)+particles(j).x(2,1))/2;
    y = imag(particles(j).x(2,1)-particles(j).x(1,2))/2;
    z = real(particles(j).x(1,1)-particles(j).x(2,2))/2;

    particles(j).p.XData = x;
    particles(j).p.YData = y;
    particles(j).p.ZData = z;

    particles(j).px.YData = y;
    particles(j).px.ZData = z;

    particles(j).py.XData = x;
    particles(j).py.ZData = z;

    particles(j).pz.XData = x;
    particles(j).pz.YData = y;
end
end


function [] = replot_particles(ax,field_obj,particles)
%PLOT_PARTICLES replots particles in particles in axes ax
%   Detailed explanation goes here

replot_field_obj(field_obj);

% Update particle positions and shadows
for j=1:length(particles)
    particle = particles(j);
    particle.p.XData = real(particle.x(1,2)+particle.x(2,1))/2;
    particle.p.YData = imag(particle.x(2,1)-particle.x(1,2))/2;
    particle.p.ZData = real(particle.x(1,1)-particle.x(2,2))/2;
end
end


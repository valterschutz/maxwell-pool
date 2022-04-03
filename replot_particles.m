function [] = replot_particles(particles)
%PLOT_PARTICLES replots particles in particles in axes ax
%   Detailed explanation goes here

% Update particle positions and shadows
for j=1:length(particles)
    x = particles(j).x(1);
    y = particles(j).x(2);
    z = particles(j).x(3);

    particles(j).p.XData = x;
    particles(j).p.YData = y;
    particles(j).p.ZData = z;

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


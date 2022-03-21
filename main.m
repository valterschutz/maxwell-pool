DT = 0.02;
T = 20;
N_particles = 1;  % Number of particles (does not include "cue ball"). Up to 6.
PARTICLE_COLORS = ['r','g','b','c','m','y'];
PARTICLE_MASS = 1;
PARTICLE_CHARGE = 5e-3;
TYPE = "charge";

field_obj = generate_field_obj(TYPE);


for k=1:N_particles
    particles(k).m = PARTICLE_MASS * eye(2);
    particles(k).q = PARTICLE_CHARGE * eye(2);
%     particles(k).x = vector_to_multivector(rand(3,1));
    particles(k).x = vector_to_multivector([0.7;0.7;0.7]);
    particles(k).v = vector_to_multivector([0;0;0]);
    particles(k).F = 0;  % No field in beginning
    particles(k).force = 0;
    particles(k).a = 0;
    particles(k).color = PARTICLE_COLORS(k);
    particles(k).p = 0;  % Reference to plot object
end



% Open file for writing animation
% myWriter = VideoWriter('videos/test','MPEG-4');
% myWriter.FrameRate = 30;
% open(myWriter);

% Create figure and axes
fig = figure(1);
clf(fig);
ax = gca;
ax = initialize_axes(ax);

% Plot particles and field object
field_obj = plot_field_obj(ax,field_obj);
particles = plot_particles(ax,particles);

% Allow user to control field object
field_obj = control_field_obj(ax,field_obj);

k = 1;
for t=0:DT:T
    % Update field object
    field_obj = update_field_obj(field_obj,DT);
        
    % Update particles
    for j=1:N_particles
        particles(j).F = F_from_field_obj(field_obj, particles(j));
        F = particles(j).F; v = particles(j).v; q = particles(j).q;
        particles(j).force = q/2*(F+F'+1/2*v*(F'-F)+1/2*(F-F')*v);
        particles(j).a = particles(j).force/particles(j).m;
        particles(j).v = particles(j).v + particles(j).a * DT;
        particles(j).v = vector_to_multivector(bounce_check(multivector_to_vector(particles(j).x), multivector_to_vector(particles(j).v)));
        particles(j).x = particles(j).x + particles(j).v * DT;
    end
    
    replot_particles(particles)  % Update particle positions
    replot_field_obj(field_obj)  % Update field object positioning
    drawnow
%     view([k 25])
%     set(ax,'nextplot','replacechildren');
%     set(ax,'DrawMode','fast') 
%     set(ax,'EraseMode','none');
%     frame = getframe(gcf);
%     writeVideo(myWriter,frame);
%     k = k+1;
    thing = multivector_to_vector(particles(1).x);
    fprintf("t = %.2f\n", t);
end

% close(myWriter);



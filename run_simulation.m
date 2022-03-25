function [] = run_simulation(field_obj,particles,T,dt)
%RUN_SIMULATION Summary of this function goes here
%   Detailed explanation goes here

epsilon_0 = 8.8541878128e-12;
mu_0 = 1.25663706212e-6;

for t=0:dt:T
    % Update field object
    field_obj = update_field_obj(field_obj,dt);
        
    % Update particles
    for j=1:length(particles)
        particles(j).F = F_from_field_obj(field_obj, particles(j));
        F = particles(j).F; v = particles(j).v; q = particles(j).q;
        particles(j).force = q/2*(1/sqrt(epsilon_0)*(F+F')+sqrt(mu_0)/2*v*(F'-F)+sqrt(mu_0)/2*(F-F')*v);
        F_v = multivector_to_vector(F);
        force_v = multivector_to_vector(particles(j).force);
        fprintf("F=%.5e, q=%.5e, force=%.5e\n",F_v(1,1),particles(j).q(1,1),force_v(1))
        particles(j).a = particles(j).force/particles(j).m;
        particles(j).v = particles(j).v + particles(j).a * dt;
        particles(j).v = vector_to_multivector(bounce_check(multivector_to_vector(particles(j).x), multivector_to_vector(particles(j).v)));
        particles(j).x = particles(j).x + particles(j).v * dt;
    end
    
    replot_particles(particles)  % Update particle positions
    replot_field_obj(field_obj)  % Update field object positioning
    drawnow
%     fprintf("T=%.2f\n",t)
%     view([k 25])
%     set(ax,'nextplot','replacechildren');
%     set(ax,'DrawMode','fast') 
%     set(ax,'EraseMode','none');
%     frame = getframe(gcf);
%     writeVideo(myWriter,frame);
end

% close(myWriter);



end


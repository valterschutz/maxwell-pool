function [] = run_simulation(field_obj,particles,T,dt,plot_E,plot_B,plot_F)

epsilon_0 = 8.8541878128e-12;
mu_0 = 1.25663706212e-6;
x = linspace(0,1,20); y = linspace(0,1,20); z = linspace(0,1,20);
[X,Y,Z] = meshgrid(x,y,z);

for t=0:dt:T
    % Update field object
    field_obj = update_field_obj(field_obj,dt);
        
    % Update particles
    for j=1:length(particles)
        particles(j).F = F_from_field_obj(field_obj, particles(j).x);
        F = particles(j).F; v = vector_to_multivector(particles(j).v); q = particles(j).q;

        particles(j).force = multivector_to_vector(q/2*((F+F')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F-F')*v-v*(F-F'))));
        particles(j).a = particles(j).force/particles(j).m;
        particles(j).v = particles(j).v + particles(j).a * dt;
        particles(j).v = bounce_check(particles(j).x, particles(j).v);
        particles(j).x = particles(j).x + particles(j).v * dt;

%         fprintf("|F| ~ %.2e, |force| ~ %.2e\n", norm(multivector_to_vector(F)), norm(multivector_to_vector(particles(j).force)))
    end
    
    replot_particles(particles)  % Update particle positions
    replot_field_obj(field_obj)  % Update field object positioning

    drawnow
    fprintf("T=%.2f\n",t)
%     view([k 25])
%     set(ax,'nextplot','replacechildren');
%     set(ax,'DrawMode','fast') 
%     set(ax,'EraseMode','none');
%     frame = getframe(gcf);
%     writeVideo(myWriter,frame);
end

% close(myWriter);



end


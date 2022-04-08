function frames = run_simulation(field_obj,particles,T,dt,save_frames)

epsilon_0 = 8.8541878128e-12;
mu_0 = 1.25663706212e-6;

frames = zeros(length(0:dt:T));
k = 1;
for t=0:dt:T
    % Update field object
    field_obj = update_field_obj(field_obj,dt);
        
    % Update particles
    for j=1:length(particles)
        particles(j).F = F_from_field_obj(field_obj, particles(j).x);
        F = particles(j).F; v = vector_to_multivector(particles(j).v); q = particles(j).q;

        particles(j).force = multivector_to_vector(q/2*((F+F')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F-F')*v-v*(F-F'))));
        particles(j).a = particles(j).force/particles(j).m;
        particles(j).v = bounce_check(particles(j).x,particles(j).v + particles(j).a * dt);
%         particles(j).v = bounce_check(particles(j).x, particles(j).v);
        particles(j).x = particles(j).x + particles(j).v * dt;

%         fprintf("|F| ~ %.2e, |force| ~ %.2e\n", norm(multivector_to_vector(F)), norm(particles(j).force));
    end
    
    replot_particles(particles)  % Update particle positions
    replot_field_obj(field_obj)  % Update field object positioning

    drawnow
    if save_frames
        frames(k) = getframe; k = k + 1;
    end
    fprintf("T=%.2f\n",t)
end

% close(myWriter);



end


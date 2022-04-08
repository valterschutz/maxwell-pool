function [] = run_simulation_RK(field_obj,particles,T,dt)

epsilon_0 = 8.8541878128e-12;
mu_0 = 1.25663706212e-6;

for t=0:dt:T
    % Update field object
    field_obj = update_field_obj(field_obj,dt);
        
    % Update particles
    for j=1:length(particles)
        F = particles(j).F; v_multi = vector_to_multivector(particles(j).v); q = particles(j).q;
        m = particles(j).m; x = particles(j).x; v = particles(j).v;

        F = F_from_field_obj(field_obj, x);
        force = multivector_to_vector(q/2*((F+F')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F-F')*v_multi-v_multi*(F-F'))));
        k1 = [v; force/m];

        F = F_from_field_obj(field_obj, x+dt/2*k1(1:3));
        force = multivector_to_vector(q/2*((F+F')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F-F')*v_multi-v_multi*(F-F'))));
        k2 = [v+dt/2*k1(4:6); force/m];

        F = F_from_field_obj(field_obj, x+dt/2*k2(1:3));
        force = multivector_to_vector(q/2*((F+F')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F-F')*v_multi-v_multi*(F-F'))));
        k3 = [v+dt/2*k2(4:6); force/m];

        F = F_from_field_obj(field_obj, x+dt*k3(1:3));
        force = multivector_to_vector(q/2*((F+F')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F-F')*v_multi-v_multi*(F-F'))));
        k4 = [v+dt*k3(4:6); force/m];

        S = [x; v] + dt/6*(k1+2*k2+2*k3+k4);
        particles(j).x = S(1:3); particles(j).v = S(4:6);
    

%         fprintf("|F| ~ %.2e, |force| ~ %.2e\n", norm(multivector_to_vector(F)), norm(particles(j).force));
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


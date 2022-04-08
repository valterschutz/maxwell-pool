function frames = run_simulation_RK(field_obj,particles,T,dt)

epsilon_0 = 8.8541878128e-12;
mu_0 = 1.25663706212e-6;

k = 1;
for t=0:dt:T
    % Update field object
    field_obj = update_field_obj(field_obj,dt);
        
    % Update particles
    for j=1:length(particles)
        q = particles(j).q;
        m = particles(j).m;
        x_init = particles(j).x;
        v_init = particles(j).v;
        v_init_multi = vector_to_multivector(v_init);

        F_init = F_from_field_obj(field_obj, x_init);
        force_init = multivector_to_vector(q/2*((F_init+F_init')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F_init-F_init')*v_init_multi-v_init_multi*(F_init-F_init'))));
        k1 = [v_init; force_init/m];

        F = F_from_field_obj(field_obj, x_init+dt/2*k1(1:3));
        v = v_init + dt/2*k1(4:6); v_multi = vector_to_multivector(v);
        force = multivector_to_vector(q/2*((F+F')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F-F')*v_multi-v_multi*(F-F'))));
        k2 = [v; force/m];

        F = F_from_field_obj(field_obj, x_init+dt/2*k2(1:3));
        v = v_init + dt/2*k2(4:6); v_multi = vector_to_multivector(v);
        force = multivector_to_vector(q/2*((F+F')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F-F')*v_multi-v_multi*(F-F'))));
        k3 = [v; force/m];

        F = F_from_field_obj(field_obj, x_init+dt*k3(1:3));
        v = v_init + dt*k3(4:6); v_multi = vector_to_multivector(v);
        force = multivector_to_vector(q/2*((F+F')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F-F')*v_multi-v_multi*(F-F'))));
        k4 = [v; force/m];

        S = [x_init; v_init] + dt/6*(k1+2*k2+2*k3+k4);
        particles(j).x = S(1:3); particles(j).v = S(4:6);
    

%         fprintf("|F| ~ %.2e, |force| ~ %.2e\n", norm(multivector_to_vector(F)), norm(particles(j).force));
    end
    
    replot_particles(particles);
    replot_field_obj(field_obj);

    drawnow
    frames(k) = getframe; k = k + 1;
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


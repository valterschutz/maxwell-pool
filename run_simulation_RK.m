function frames = run_simulation_RK(ax,field_obj,particles,T,dt,trajectory)
% If output is requested, save frames
epsilon_0 = 8.8541878128e-12;
mu_0 = 1.25663706212e-6;

k = 1;
for t=0:dt:T
    % Update field object
    field_obj = update_field_obj(field_obj,dt);
        
    % Update particles
    for j=1:length(particles)
        q = particles(j).charge;
        m = particles(j).mass;

        % Runge-Kutta method 
        S = [particles(j).position; particles(j).velocity];
        k1 = D(S);
        k2 = D(S + dt/2*k1);
        k3 = D(S+dt/2*k2);
        k4 = D(S+dt*k3);
        S = S + dt/6*(k1+2*k2+2*k3+k4);

        particles(j).position = S(1:3);
        particles(j).velocity = bounce_check(S(1:3),S(4:6));
    end
    
    replot_particles(ax,particles, trajectory);
    replot_field_obj(ax,field_obj);

    drawnow limitrate
    if nargout>0
        frames(k) = getframe; k = k + 1;
    end
    fprintf("T=%.2f\n",t)
end

function res = D(S)
    % D = dS/dt where S = [x,y,z,vx,vy,vz]
    pos = S(1:3);
    v = S(4:6);
    v_multi = vector_to_multivector(v);

    F = F_from_field_obj(field_obj, pos);
    force = multivector_to_vector(q/2*((F+F')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F-F')*v_multi-v_multi*(F-F'))));

    res = [S(4:6); force/m];
end

end




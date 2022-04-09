function frames = run_simulation_RK(field_obj,particles,T,dt,varargin)
% If output is requested, save frames
epsilon_0 = 8.8541878128e-12;
mu_0 = 1.25663706212e-6;

% No trajectory by default
trajectory = false;

% Process varargin
names = varargin(1:2:end);
values = varargin(2:2:end);
for k=1:numel(names)
    switch names{k}
        case 'Trajectory'
            trajectory = values{k};
    end
end

k = 1;
for t=0:dt:T
    % Update field object
    field_obj = update_field_obj(field_obj,dt);
        
    % Update particles
    for j=1:length(particles)
        q = particles(j).q;
        m = particles(j).m;

        % Runge-Kutta method 
        S = [particles(j).x; particles(j).v];
        k1 = D(S);
        k2 = D(S + dt/2*k1);
        k3 = D(S+dt/2*k2);
        k4 = D(S+dt*k3);
        S = S + dt/6*(k1+2*k2+2*k3+k4);

        particles(j).x = S(1:3);
        particles(j).v = S(4:6);
    end
    
    replot_particles(particles, trajectory);
    replot_field_obj(field_obj);

    drawnow limitrate
    if nargout>0
        frames(k) = getframe; k = k + 1;
    end
    fprintf("T=%.2f\n",t)
%     view([k 25])
%     set(ax,'nextplot','replacechildren');
%     set(ax,'DrawMode','fast') 
%     set(ax,'EraseMode','none');
%     frame = getframe(gcf);
%     writeVideo(myWriter,frame);
end
% close(myWriter);

function res = D(S)
    % D = dS/dt where S = [x,y,z,vx,vy,vz]
    x = S(1:3);
    v = S(4:6);
    v_multi = vector_to_multivector(v);

    F = F_from_field_obj(field_obj, x);
    force = multivector_to_vector(q/2*((F+F')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F-F')*v_multi-v_multi*(F-F'))));

    res = [S(4:6); force/m];
end

end




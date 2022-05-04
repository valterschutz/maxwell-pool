clf, clearvars, clc
DT = 0.1;  % Time step
T = 300;  % Total time for simulation, change between runs
PARTICLE_MASS = 1e-3;  % 1 g
PARTICLE_CHARGE = 1e-9;  % 1 nC

% Choose between "charge", "eDipole", "current" and "mDipole"
TYPE = "mDipole";

% Toggle this to see shadows for all particles on the sides of the box and
% shadows for field object.
PLOT_SHADOWS = false; 

% Plot trajectory of particles
PLOT_TRAJECTORY = true;

% Save each frame in simulation and finally create a movie. Affects
% performance drastically
SAVE_MOVIE = false;

% Initialize field object. This will either be a point like electric
% charge, electric dipole, magnetic dipole or current carrying wire
field_obj = generate_field_obj(TYPE);

% Position, velocity and color of particles depends on field object
% The position and velocity is choosen to exemplify each field object's
% characteristic behaviour
switch TYPE
    case "charge"
        % Place particles randomly on sphere surface
        radius = 0.2;
        for k=1:10
            theta = pi*rand; phi = 2*pi*rand;
            particles(k).position = field_obj.position + [radius*sin(theta)*cos(phi); radius*sin(theta)*sin(phi); radius*cos(theta)];
            particles(k).velocity = [0; 0; 0];
            cmap = hsv(100);
            particles(k).color = cmap(k,:);
        end
    case "eDipole"
        particles(1).position = [0.5;0.5;0.8];
        particles(1).color = "b";
        particles(1).velocity = [0;0;0];
        particles(2).position = [0.5;0.5;0.2];
        particles(2).color = "b";
        particles(2).velocity = [0;0;0];
        particles(3).position = [0.8;0.5;0.5];
        particles(3).color = "c";
        particles(3).velocity = [0;0;0];
        particles(4).position = [0.5;0.8;0.5];
        particles(4).color = "b";
        particles(4).velocity = [0;0;0];
        particles(5).position = [0.5;0.2;0.5];
        particles(5).color = "b";
        particles(5).velocity = [0;0;0];
    case "current"
        % Uncomment this to have wire move with v=0.01 m/s in x.
        % particles(1).position = [0.2;0.5;0.5];
        % particles(1).velocity = [0.01;0;0];
        % particles(1).color = "c";

        % Uncomment this to make wire stand still
        particles(1).position = [0.5;0.5;0.5];
        particles(1).velocity = [0;0;0.1];
        particles(1).color = "r";
        particles(2).position = [0.5;0.5;0.5];
        particles(2).velocity = [0;0;0.1];
        particles(2).color = "b";
        particles(2).isnegative = true;
        particles(3).position = [0.5;0.5;0.5];
        particles(3).velocity = [0;0;0];
        particles(3).color = "c";
    case "mDipole"
        particles(1).position = [0.5;0.5;0.25];
        particles(1).velocity = [0;0;0.01];
        particles(1).color = "c";
end

% All other properties have default values and are the same regardless of
% field object type
for k=1:length(particles)
    particles(k).mass = PARTICLE_MASS;

    % In some cases we want negative charge
    if isfield(particles(k), 'isnegative')
        if particles(k).isnegative
            particles(k).charge = -PARTICLE_CHARGE;
        else
            particles(k).charge = PARTICLE_CHARGE;
        end
    else
        particles(k).charge = PARTICLE_CHARGE;
    end
    
    particles(k).field = 0 * eye(2);  % No field before simulation starts
    particles(k).force = [0; 0; 0];
    particles(k).acceleration = [0;0;0];
    
    particles(k).size = 20;
    particles(k).plotobj = 0;  % Reference to plot object
end

% Create figure and axes
fig = figure(1);
clf(fig);
ax = gca;
ax = initialize_axes(ax);

% Uncomment for xz-plane view
% view(0,0)

% Uncomment for yz-plane view
% view(90,0)

% Plot particles and field object
field_obj = plot_field_obj(ax,field_obj,PLOT_SHADOWS);
particles = plot_particles(ax,particles,PLOT_SHADOWS);

% Allow user to control field object if field_obj.type is
% "charge" or "current"
field_obj = control_field_obj(ax,field_obj);

% Run the simulation, save frames if SAVE_MOVIE flag is enabled
if SAVE_MOVIE
    frames = run_simulation(ax,field_obj,particles,T,DT,PLOT_TRAJECTORY);
    filename = sprintf("videos/%s",TYPE);
    v = VideoWriter(filename);
    open(v);
    writeVideo(v,frames);
    close(v);
else
    run_simulation(ax,field_obj,particles,T,DT,PLOT_TRAJECTORY);
end

clf, clearvars, clc
DT = 0.1;
% DT = 0.1;
T = 20;
PARTICLE_MASS = 1e-3;  % 1 g
PARTICLE_CHARGE = 1e-9;  % 1 nC
TYPE = "charge";  % Choose between "charge", "eDipole", "current" and "mDipole"
PLOT_SHADOWS = false;
PLOT_TRAJECTORY = false;
SAVE_MOVIE = false;

% Initialize field object
field_obj = generate_field_obj(TYPE);

% Position, velocity and color of particles depends on field object
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
        particles(1).position = [0.2;0.5;0.5];
        particles(1).velocity = [0.01;0;0];
        particles(1).color = "c";
%         particles(2).position = [0.7;0.5;0.5];
%         particles(2).velocity = [-1;0;0];
%         particles(2).color = "r";
%         particles(3).position = [0.7;0.5;0.5];
%         particles(3).velocity = [-1;0;0];
%         particles(3).color = "b";
    case "mDipole"
        particles(1).position = [0.5;0.5;0.25];
        particles(1).velocity = [0;0;0.01];
        particles(1).color = "c";
end

% All other properties have default values
for k=1:length(particles)
    particles(k).mass = PARTICLE_MASS;
    particles(k).charge = PARTICLE_CHARGE;
    
    particles(k).field = 0 * eye(2);  % No field in beginning
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

% Plot stuff
% view(0,0)
% title(ax,['Euler forward, dt=' num2str(DT)])

% Plot particles and field object
field_obj = plot_field_obj(ax,field_obj);
particles = plot_particles(ax,particles,PLOT_SHADOWS);

% Allow user to control field object
field_obj = control_field_obj(ax,field_obj);

% Run the simulation
if SAVE_MOVIE
    frames = run_simulation_RK(ax,field_obj,particles,T,DT,PLOT_TRAJECTORY);
    v = VideoWriter("videos/movie");
    open(v);
    writeVideo(v,frames);
    close(v);
else
    run_simulation_RK(ax,field_obj,particles,T,DT,PLOT_TRAJECTORY);
end

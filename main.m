clf, clearvars, clc
DT = 0.2;
T = 120;
% N_particles = 6;  % Number of particles (does not include "cue ball"). Up to 6.
PARTICLE_MASS = 1e-3;  % 1 g
PARTICLE_CHARGE = 1e-10;  % 10 nC
TYPE = "current";  % Choose between "charge" and "eDipole", "current"
PLOT_F = false;
PLOT_E = false;
PLOT_B = false;

% Initialize field object
field_obj = generate_field_obj(TYPE);

% Initialize particles, except position
for k=1:field_obj.n_particles
    particles(k).m = PARTICLE_MASS;
    particles(k).q = PARTICLE_CHARGE;
    particles(k).v = [0;0;0];
    particles(k).F = 0 * eye(2);  % No field in beginning
    particles(k).force = [0; 0; 0];
    particles(k).a = [0;0;0];
    
    particles(k).size = 10;
    particles(k).p = 0;  % Reference to plot object
end

% Position of particles depends on type of field object
switch TYPE
    case "charge"
        for k=1:field_obj.n_particles
            cmap = hsv(field_obj.n_particles);
            particles(k).x = rand(3,1);
            particles(k).color = cmap(k,:);
        end
    case "eDipole"
        particles(1).x = [0.5;0.5;0.8];
        particles(1).color = "b";
        particles(2).x = [0.5;0.5;0.2];
        particles(2).color = "b";
        particles(3).x = [0.8;0.5;0.5];
        particles(3).color = "c";
        particles(4).x = [0.5;0.8;0.5];
        particles(4).color = "b";
        particles(5).x = [0.5;0.2;0.5];
        particles(5).color = "b";
    case "current"
        particles(1).x = [0.9;0.5;0.1];
        particles(1).v = [0;0;0.01];
        particles(1).color = "c";
%         particles(2).x = [0.7;0.5;0.5];
%         particles(2).v = [-1;0;0];
%         particles(2).color = "r";
%         particles(3).x = [0.7;0.5;0.5];
%         particles(3).v = [-1;0;0];
%         particles(3).q = -particles(3).q;
%         particles(3).color = "b";
end


% Create figure and axes
fig = figure(1);
clf(fig);
ax = gca;
ax = initialize_axes(ax);

% Plot stuff
view(0,0)
title(ax,"Efter")

% Plot particles and field object
field_obj = plot_field_obj(ax,field_obj);
particles = plot_particles(ax,particles);

% Allow user to control field object
field_obj = control_field_obj(ax,field_obj);



% Run the simulation
run_simulation_RK(field_obj,particles,T,DT)
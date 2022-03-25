DT = 0.02;
T = 20;
N_particles = 5;  % Number of particles (does not include "cue ball"). Up to 6.
PARTICLE_COLORS = ['r','g','b','c','m','y'];
PARTICLE_MASS = 1;
PARTICLE_CHARGE = 5e-3;
TYPE = "charge";

% Initialize field object
field_obj = generate_field_obj(TYPE);

% Initialize particles
for k=1:N_particles
    particles(k).m = PARTICLE_MASS * eye(2);
    particles(k).q = PARTICLE_CHARGE * eye(2);
    particles(k).x = vector_to_multivector(rand(3,1));
%     particles(k).x = vector_to_multivector([0.5;0.5;0.7]);
    particles(k).v = vector_to_multivector([0;0;0]);
    particles(k).F = 0;  % No field in beginning
    particles(k).force = 0;
    particles(k).a = 0;
    particles(k).color = PARTICLE_COLORS(k);
    particles(k).p = 0;  % Reference to plot object
end

% Create figure and axes
fig = figure(1);
clf(fig);
ax = gca;
ax = initialize_axes(ax);

% Plot particles and field object
field_obj = plot_field_obj(ax,field_obj);
particles = plot_particles(ax,particles);

% Allow user to control field object
field_obj = control_field_obj(ax,field_obj);

% Run the simulation
run_simulation(field_obj,particles,T,DT)
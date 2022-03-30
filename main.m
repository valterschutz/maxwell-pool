DT = 0.02;
T = 5;
N_particles = 6;  % Number of particles (does not include "cue ball"). Up to 6.
PARTICLE_MASS = 1;  % 1 kg
PARTICLE_CHARGE = 1e-10;  % 10 nC
TYPE = "charge";  % Choose between "charge" and "eDipole"

% Initialize field object
field_obj = generate_field_obj(TYPE);

% Initialize particles, except position
for k=1:field_obj.n_particles
    particles(k).m = PARTICLE_MASS * eye(2);
    particles(k).q = PARTICLE_CHARGE * eye(2);
    particles(k).v = vector_to_multivector([0;0;0]);
    particles(k).F = 0;  % No field in beginning
    particles(k).force = 0;
    particles(k).a = 0;
    
    particles(k).size = 50;
    particles(k).p = 0;  % Reference to plot object
end

% Position of particles depends on type of field object
switch TYPE
    case "charge"
        for k=1:field_obj.n_particles
%             PARTICLE_COLORS = ['r','g','b','c','m','y'];
            cmap = hsv(field_obj.n_particles);
            particles(k).x = vector_to_multivector(rand(3,1));
            particles(k).color = cmap(k,:);
        end
    case "eDipole"
        particles(1).x = vector_to_multivector([0.2,0.5,0.5]);
        particles(1).color = "r";
        particles(2).x = vector_to_multivector([0.5,0.5,0.8]);
        particles(2).color = "b";
        particles(3).x = vector_to_multivector([0.5,0.5,0.2]);
        particles(3).color = "b";
        particles(4).x = vector_to_multivector([0.8,0.5,0.5]);
        particles(4).color = "c";
        particles(5).x = vector_to_multivector([0.5,0.8,0.5]);
        particles(5).color = "b";
        particles(6).x = vector_to_multivector([0.5,0.2,0.5]);
        particles(6).color = "b";
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
% field_obj = control_field_obj(ax,field_obj);

% Run the simulation
run_simulation(field_obj,particles,T,DT)
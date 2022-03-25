DT = 0.01;
T = 5;
N_particles = 1;  % Number of particles
PARTICLE_COLORS = ['r','g','b','c','m','y'];
PARTICLE_ORBITAL_RADII = [0.3,0.5,0.5,0.5,0.5,0.5];
PARTICLE_ORBITAL_PERIODS = [1,1,1,1,1,1];
PARTICLE_MASSES = [1e-3,1e-3,1e-3,1e-3,1e-3,1e-3];
PARTICLE_CHARGES = [-1e-3,1,1,1,1,1];
epsilon_0 = 8.8541878128e-12;

% Initialize field object in the middle, "sun"
field_obj = generate_field_obj("charge");

% Initialize particles
for k=1:N_particles
    particles(k).m = PARTICLE_MASSES(k) * eye(2);
    vy = 2*pi*PARTICLE_ORBITAL_RADII(k)/PARTICLE_ORBITAL_PERIODS(k);
    particles(k).v = vector_to_multivector([0;vy;0]);
    particles(k).q = -particles(k).m*eye(2)*16*pi^3*epsilon_0*PARTICLE_ORBITAL_RADII(k)^3/(field_obj.q*PARTICLE_ORBITAL_PERIODS(k)^2);
    fprintf("k=%d, q_solar=%.5e\n",k,particles(k).q(1,1))
    particles(k).x = vector_to_multivector([0.5+PARTICLE_ORBITAL_RADII(k);0.5;0.5]);
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
% field_obj = control_field_obj(ax,field_obj);

% Run the simulation
run_simulation(field_obj,particles,T,DT)
DT = 0.01;
T = 10;
BOUNDS_EPS = 0.00;
N_particles = 8;  % Number of particles
particle_colors = ['r','g','b','c','m','r','g','c'];
MAX_RADII = 0.45;
SMALLEST_PERIOD = 0.1;
epsilon_0 = 8.8541878128e-12;

% Planets not including Pluto
% Orbital period in days
planet_orbital_periods = [88,224.7,365.2,687.0,4331,10747,30589,59800,90560];
particle_orbital_periods = SMALLEST_PERIOD*planet_orbital_periods/min(planet_orbital_periods);
% Masses of planets, in 10^24 kg
planet_masses = [0.330,4.87,5.97,0.642,1898,568,86.8,102];
planet_masses = ones(1,8);
particle_masses = planet_masses / max(planet_masses);
% Distances of planets in 10^6 km from the sun
planet_distances = [57.9, 108.2, 149.6, 228.0, 778.5, 1432.0, 2867.0, 4515.0];
% Normalization
particle_distances = MAX_RADII*planet_distances/max(planet_distances);

% Initialize field object in the middle, "sun"
field_obj = generate_field_obj("charge");

% Initialize particles
for k=1:N_particles
    particles(k).m = particle_masses(k) * eye(2);
    vy = 2*pi*particle_distances(k)/particle_orbital_periods(k);
    particles(k).v = vector_to_multivector([0;vy;0]);
    particles(k).q = -particles(k).m*16*pi^3*epsilon_0*particle_distances(k)^3/(field_obj.q*particle_orbital_periods(k)^2);
%     fprintf("k=%d, q_solar=%.5e\n",k,particles(k).q(1,1))
    particles(k).x = vector_to_multivector([0.5+particle_distances(k);0.5;0.5]);
    particles(k).F = 0;  % No field in beginning
    particles(k).force = 0;
    particles(k).a = 0;
    particles(k).color = particle_colors(k);
    particles(k).p = 0;  % Reference to plot object
    particles(k).size = 20;
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
run_simulation(field_obj,particles,T,DT, BOUNDS_EPS)
clf, clearvars, clc
DT = 0.1;
T = 50;
particle_colors = ['r','g','b','c','m','r','g','c'];
MAX_RADII = 0.45;
SMALLEST_PERIOD = 5;
epsilon_0 = 8.8541878128e-12;

% Toggle this to see shadows for all particles on the sides of the box and
% shadows for field object.
PLOT_SHADOWS = false; 

% Plot trajectory of particles
PLOT_TRAJECTORY = false;

% Save each frame in simulation and finally create a movie. Affects
% performance drastically
SAVE_MOVIE = false;

% Planets not including Pluto
% Orbital period in days
planet_orbital_periods = [88,224.7,365.2,687.0,4331,10747,30589,59800,90560];
particle_orbital_periods = SMALLEST_PERIOD*planet_orbital_periods/min(planet_orbital_periods);
% Masses of planets, in 10^24 kg
planet_masses = [0.330,4.87,5.97,0.642,1898,568,86.8,102];
particle_masses = planet_masses / max(planet_masses);
% Distances of planets in 10^6 km from the sun
planet_distances = [57.9, 108.2, 149.6, 228.0, 778.5, 1432.0, 2867.0, 4515.0];
% Normalization
particle_distances = MAX_RADII*planet_distances/max(planet_distances);

% Initialize field object in the middle, "sun"
field_obj = generate_field_obj("charge");

% Initialize particles
for k=1:length(planet_masses)
    particles(k).mass = particle_masses(k);
    vy = 2*pi*particle_distances(k)/particle_orbital_periods(k);
    particles(k).velocity = [0;vy;0];
    particles(k).charge = -particles(k).mass*16*pi^3*epsilon_0*particle_distances(k)^3/(field_obj.charge*particle_orbital_periods(k)^2);
    particles(k).position = [0.5+particle_distances(k);0.5;0.5];
    particles(k).field = 0 * eye(2);  % No field in beginning
    particles(k).force = 0;
    particles(k).acceleration = 0;
    particles(k).color = particle_colors(k);
    particles(k).plotobj = 0;  % Reference to plot object
    particles(k).size = 20;
end

% Create figure and axes
fig = figure(1);
clf(fig);
ax = gca;
ax = initialize_axes(ax);

% Zoom in on nearest 'planets'
view([0 90]), axis([0.45 0.55 0.45 0.55 0 1]), set(gca,'DataAspectRatio',[1 1 1])

% Plot particles and field object
field_obj = plot_field_obj(ax,field_obj,PLOT_SHADOWS);
particles = plot_particles(ax,particles,PLOT_SHADOWS);

% Run the simulation, save frames if SAVE_MOVIE flag is enabled
if SAVE_MOVIE
    frames = run_simulation(ax,field_obj,particles,T,DT,PLOT_TRAJECTORY);
    v = VideoWriter("videos/solar");
    open(v);
    writeVideo(v,frames);
    close(v);
else
    run_simulation(ax,field_obj,particles,T,DT,PLOT_TRAJECTORY);
end
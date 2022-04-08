clf, clearvars, clc
DT = 0.001;
T = 5;
N_particles = 1;  % Number of particles
epsilon_0 = 8.8541878128e-12;
save_frames = false;

orbital_period = 1;
mass = 1;
initial_distance = 0.2;

field_obj = generate_field_obj("charge");

% Initialize particles
for k=1:N_particles
    particles(k).m = mass;
    vy = 2*pi*initial_distance/orbital_period;
    particles(k).v = [0;vy;0];
    particles(k).q = -mass*16*pi^3*epsilon_0*initial_distance^3/(field_obj.q*orbital_period^2);
    particles(k).x = [0.5+initial_distance;0.5;0.5];
    particles(k).F = 0 * eye(2);  % No field in beginning
    particles(k).force = 0;
    particles(k).a = 0;
    particles(k).color = 'b';
    particles(k).p = 0;  % Reference to plot object
    particles(k).size = 20;
end

% Create figure and axes
fig = figure(1);
clf(fig);
ax = gca;
ax = initialize_axes(ax);

% Plot stuff
theta = linspace(0,2*pi);
plot3(ax,0.5+initial_distance*cos(theta),0.5+initial_distance*sin(theta),0.5*ones(size(theta)),'r-')
view([0 90]), grid on, axis([0 1 0 1 0 1]), axis equal
title(['Runge-Kutta, dt=' num2str(DT)])

% Plot particles and field object
field_obj = plot_field_obj(ax,field_obj);
particles = plot_particles(ax,particles);


% Run the simulation
frames = run_simulation_RK(field_obj,particles,T,DT,save_frames);
if save_frames
    writer = VideoWriter("videos/test_solar_RK_dt0punkt01.avi");
    open(writer);
    writeVideo(writer,frames);
    close(writer);
end

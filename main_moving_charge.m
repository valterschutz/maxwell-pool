DT = 0.1;
T = 20;
N_particles = 6;
colors = ['r','g','b','c','m','y'];
max_speed = 1;  % This corresponds to user entering 100% speed when aiming

que_ball.m = 1 * eye(2);  % 1 kg
que_ball.q = 0.1e-3 * eye(2);  % 0.1 mC
que_ball.x = vector_to_multivector([0; 0; 0]);
que_ball.v = vector_to_multivector([0.05; 0.05; 0.05]);
que_ball.color = 'k';
que_ball.F = 0;  % No interacting fields
que_ball.force = 0;  % No interacting forces
que_ball.a = 0;  % Does not accelerate

for k=1:N_particles
%     particles(k) = struct;
    particles(k).m = 1 * eye(2);
    particles(k).q = 1e-3 * eye(2);
    particles(k).x = vector_to_multivector(rand(3,1));
    particles(k).v = vector_to_multivector([0;0;0]);
    particles(k).color = colors(k);
end



% Open file for writing animation
% myWriter = VideoWriter('videos/test','MPEG-4');
% myWriter.FrameRate = 30;
% open(myWriter);

% Plot initial positions
fig = gcf;
ax = gca;
plot_particles([particles que_ball],ax)

% Allow user to aim


k = 1;
for t=0:DT:T
    
    for j=1:N_particles
        particles(j).F = F_moving_charge(particles(j).x, que_ball);
        F = particles(j).F; v = particles(j).v; q = particles(j).q;
        particles(j).force = q/2*(F+conj(F)+1/2*v*(conj(F)-F)+1/2*(F-conj(F))*v);
        particles(j).a = particles(j).force/particles(j).m;
        particles(j).v = particles(j).v + particles(j).a * DT;
        particles(j).v = vector_to_multivector(bounce_check(multivector_to_vector(particles(j).x), multivector_to_vector(particles(j).v)));
        particles(j).x = particles(j).x + particles(j).v * DT;
    end
    
    
    que_ball.v = vector_to_multivector(bounce_check(multivector_to_vector(que_ball.x), multivector_to_vector(que_ball.v)));
    que_ball.x = que_ball.x + que_ball.v*DT;
    
    plot_particles([particles que_ball],ax)
%     view([k 25])
%     set(gca,'nextplot','replacechildren');
%     frame = getframe(gcf);
%     writeVideo(myWriter,frame);
%     k = k+1;
    fprintf("t = %.2f\n", t);
end

% close(myWriter);



DT = 0.01;
T = 10;
N_particles = 6;
colors = ['r','g','b','c','m','y'];

que_ball.m = 1 * eye(2);  % 1 kg
que_ball.q = 1e-1 * eye(2);  % 100 mC
que_ball.x = vector_to_multivector([0; 0; 0]);
que_ball.v = vector_to_multivector([0.9; 0.4; 0.5]);

for k=1:N_particles
%     particles(k) = struct;
    particles(k).m = 1 * eye(2);
    particles(k).q = 1e-3 * eye(2);
    particles(k).x = vector_to_multivector(rand(3,1));
    particles(k).v = vector_to_multivector([0;0;0]);
    particles(k).color = colors(k);
end



% Open file for writing animation
myWriter = VideoWriter('videos/test');
myWriter.FrameRate = 30;
open(myWriter);

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
    
    
    % Plot cue ball and its shadows
    plot3(real(que_ball.x(1,2)+que_ball.x(2,1))/2, imag(que_ball.x(2,1)-que_ball.x(1,2))/2, real(que_ball.x(1,1)-que_ball.x(2,2))/2, 'k.', 'markersize', 50), axis([0 1 0 1 0 1]), grid on, hold on, xlabel('x'), ylabel('y'), zlabel('z'), box on, hold on
    plot3(real(que_ball.x(1,2)+que_ball.x(2,1))/2, imag(que_ball.x(2,1)-que_ball.x(1,2))/2, 0, 'o', 'markersize', 15, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', [0.9 0.9 0.9])
    plot3(real(que_ball.x(1,2)+que_ball.x(2,1))/2, 1, real(que_ball.x(1,1)-que_ball.x(2,2))/2, 'o', 'markersize', 15, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', [0.9 0.9 0.9])
    plot3(1, imag(que_ball.x(2,1)-que_ball.x(1,2))/2, real(que_ball.x(1,1)-que_ball.x(2,2))/2, 'o', 'markersize', 15, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', [0.9 0.9 0.9])
    
    % Plot test charges and shadows
    for j=1:N_particles
        test_ball = particles(j);
        color = particles(j).color;
        plot3(real(test_ball.x(1,2)+test_ball.x(2,1))/2, imag(test_ball.x(2,1)-test_ball.x(1,2))/2, real(test_ball.x(1,1)-test_ball.x(2,2))/2, '.', 'Color', color, 'markersize', 50)
        plot3(real(test_ball.x(1,2)+test_ball.x(2,1))/2, imag(test_ball.x(2,1)-test_ball.x(1,2))/2, 0, 'o', 'markersize', 15, 'MarkerEdgeColor', color, 'MarkerFaceColor', [0.9 0.9 0.9])
        plot3(real(test_ball.x(1,2)+test_ball.x(2,1))/2, 1, real(test_ball.x(1,1)-test_ball.x(2,2))/2, 'o', 'markersize', 15, 'MarkerEdgeColor', color, 'MarkerFaceColor', [0.9 0.9 0.9])
        plot3(1, imag(test_ball.x(2,1)-test_ball.x(1,2))/2, real(test_ball.x(1,1)-test_ball.x(2,2))/2, 'o', 'markersize', 15, 'MarkerEdgeColor', color, 'MarkerFaceColor', [0.9 0.9 0.9])
    end
    hold off
    
%     drawnow
%     view([k 25])
    set(gca,'nextplot','replacechildren');
    frame = getframe(gcf);
    writeVideo(myWriter,frame);
    k = k+1;
    fprintf("t = %.2f\n", t);
end

close(myWriter);



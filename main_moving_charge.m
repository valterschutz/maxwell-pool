DT = 0.01;
T = 10;

que_ball.m = 1 * eye(2);  % 1 kg
que_ball.q = 1e-1 * eye(2);  % 100 mC
que_ball.x = vector_to_multivector([0; 0; 0]);
que_ball.v = vector_to_multivector([0.9; 0.4; 0.5]);

test_ball1.m = 1 * eye(2);
test_ball1.q = 1e-3 * eye(2);
test_ball1.x = vector_to_multivector([0.4;0.5;0.2]);
test_ball1.v = vector_to_multivector([0.01;-0.01;0.02]);

% Open file for writing animation
myWriter = VideoWriter('test');
myWriter.FrameRate = 30;
open(myWriter);

k = 1;
for t=0:DT:T
    
    
    test_ball1.F = F_moving_charge(test_ball1.x, que_ball);
    F = test_ball1.F; v = test_ball1.v; q = test_ball1.q;
    test_ball1.force = q/2*(F+conj(F)+1/2*v*(conj(F)-F)+1/2*(F-conj(F))*v);
    test_ball1.a = test_ball1.force/test_ball1.m;
    test_ball1.v = test_ball1.v + test_ball1.a * DT;
    
    
    que_ball.v = vector_to_multivector(bounce_check(multivector_to_vector(que_ball.x), multivector_to_vector(que_ball.v)));
    test_ball1.v = vector_to_multivector(bounce_check(multivector_to_vector(test_ball1.x), multivector_to_vector(test_ball1.v)));
    
    que_ball.x = que_ball.x + que_ball.v*DT;
    test_ball1.x = test_ball1.x + test_ball1.v * DT;
    
    % Plot cue ball and its shadows
    plot3(real(que_ball.x(1,2)+que_ball.x(2,1))/2, imag(que_ball.x(2,1)-que_ball.x(1,2))/2, real(que_ball.x(1,1)-que_ball.x(2,2))/2, 'b.', 'markersize', 50), axis([0 1 0 1 0 1]), grid on, hold on, xlabel('x'), ylabel('y'), zlabel('z'), box on, hold on
    plot3(real(que_ball.x(1,2)+que_ball.x(2,1))/2, imag(que_ball.x(2,1)-que_ball.x(1,2))/2, 0, 'o', 'markersize', 15, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', [0.9 0.9 0.9])
    plot3(real(que_ball.x(1,2)+que_ball.x(2,1))/2, 1, real(que_ball.x(1,1)-que_ball.x(2,2))/2, 'o', 'markersize', 15, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', [0.9 0.9 0.9])
    plot3(1, imag(que_ball.x(2,1)-que_ball.x(1,2))/2, real(que_ball.x(1,1)-que_ball.x(2,2))/2, 'o', 'markersize', 15, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', [0.9 0.9 0.9])
    
    % Plot test charge and its shadows
    test_ball = test_ball1;
    plot3(real(test_ball.x(1,2)+test_ball.x(2,1))/2, imag(test_ball.x(2,1)-test_ball.x(1,2))/2, real(test_ball.x(1,1)-test_ball.x(2,2))/2, 'r.', 'markersize', 50)
    plot3(real(test_ball.x(1,2)+test_ball.x(2,1))/2, imag(test_ball.x(2,1)-test_ball.x(1,2))/2, 0, 'o', 'markersize', 15, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', [0.9 0.9 0.9])
    plot3(real(test_ball.x(1,2)+test_ball.x(2,1))/2, 1, real(test_ball.x(1,1)-test_ball.x(2,2))/2, 'o', 'markersize', 15, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', [0.9 0.9 0.9])
    plot3(1, imag(test_ball.x(2,1)-test_ball.x(1,2))/2, real(test_ball.x(1,1)-test_ball.x(2,2))/2, 'o', 'markersize', 15, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', [0.9 0.9 0.9]), hold off
    
%     drawnow
    set(gca,'nextplot','replacechildren');
    frame = getframe(gcf);
    writeVideo(myWriter,frame);
    k = k+1;
    fprintf("t = %.2f\n", t);
end

close(myWriter);



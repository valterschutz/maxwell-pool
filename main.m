que_ball.m = 0.1;  % 100 g
que_ball.q = 1e-3;  % 1 mC
que_ball.pos = [0; 0; 0];
que_ball.v = [0.5; 0.5; 0.5];

test_ball1.m = 0.1;
test_ball1.q = 1e-3;
test_ball1.pos = [0.4;0.5;0.2];
test_ball1.v = [0.01;-0.01;0.02];

test_ball2.m = 0.1;
test_ball2.q = 1e-3;
test_ball2.pos = [0.2;0.6;0.4];
test_ball2.v = [0.01;-0.01;0.02];

dt = 0.1;

for t=0:dt:2
    que_ball.pos = que_ball.pos + que_ball.v*dt;
%     test_ball1.E = E(test_ball1.pos, que_ball)*1e-7;
    test_ball1.B = B(test_ball1.pos, que_ball)*1e12;
    test_ball1.F = test_ball1.q*cross(test_ball1.v, test_ball1.B);
    test_ball1.a = test_ball1.F/test_ball1.m;
    test_ball1.v = test_ball1.v + test_ball1.a * dt;
    test_ball1.pos = test_ball1.pos + test_ball1.v * dt;
%     test_ball2.E = E(test_ball2.pos, que_ball)*1e-7;
    test_ball2.B = B(test_ball2.pos, que_ball)*1e12;
    test_ball2.F = test_ball2.q*cross(test_ball2.v, test_ball2.B);
    test_ball2.F = test_ball2.q*cross(test_ball2.v, test_ball2.B);
    test_ball2.a = test_ball2.F/test_ball2.m;
    test_ball2.v = test_ball2.v + test_ball2.a * dt;
    test_ball2.pos = test_ball2.pos + test_ball2.v * dt;
    
    plot3(que_ball.pos(1), que_ball.pos(2), que_ball.pos(3), '.', 'markersize', 50), axis([0 1 0 1 0 1]), grid on, hold on, xlabel('x'), ylabel('y'), zlabel('z'), hold on
    plot3(test_ball1.pos(1), test_ball1.pos(2), test_ball1.pos(3), '.', 'markersize', 50), axis([0 1 0 1 0 1]), grid on, hold on, xlabel('x'), ylabel('y'), zlabel('z')
    plot3(test_ball2.pos(1), test_ball2.pos(2), test_ball2.pos(3), '.', 'markersize', 50), axis([0 1 0 1 0 1]), grid on, hold on, xlabel('x'), ylabel('y'), zlabel('z'), hold off
    pause(0.001)
end




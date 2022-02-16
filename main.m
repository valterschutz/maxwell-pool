DT = 0.01;
T = 2;
PAUSE_TIME = 0.001;
E_SCALING = 1e-6;
B_SCALING = 1e12;

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



for t=0:DT:T
    que_ball.pos = que_ball.pos + que_ball.v*DT;
    
    test_ball1.E = E(test_ball1.pos, que_ball)*E_SCALING;
    test_ball1.B = B(test_ball1.pos, que_ball)*B_SCALING;
    test_ball1.F = test_ball1.q*(test_ball1.E+cross(test_ball1.v, test_ball1.B));
    test_ball1.a = test_ball1.F/test_ball1.m;
    test_ball1.v = test_ball1.v + test_ball1.a * DT;
    if is_out_of_bounds(test_ball1.pos)
        test_ball1.v = -test_ball1.v;
    end
    test_ball1.pos = test_ball1.pos + test_ball1.v * DT;
    
    test_ball2.E = E(test_ball2.pos, que_ball)*E_SCALING;
    test_ball2.B = B(test_ball2.pos, que_ball)*B_SCALING;
    test_ball2.F = test_ball2.q*(test_ball2.E+cross(test_ball2.v, test_ball2.B));
    test_ball2.F = test_ball2.q*cross(test_ball2.v, test_ball2.B);
    test_ball2.a = test_ball2.F/test_ball2.m;
    test_ball2.v = test_ball2.v + test_ball2.a * DT;
    if is_out_of_bounds(test_ball2.pos)
        test_ball2.v = -test_ball2.v;
    end
    test_ball2.pos = test_ball2.pos + test_ball2.v * DT;
    
    plot3(que_ball.pos(1), que_ball.pos(2), que_ball.pos(3), '.', 'markersize', 50), axis([0 1 0 1 0 1]), grid on, hold on, xlabel('x'), ylabel('y'), zlabel('z'), hold on
    plot3(test_ball1.pos(1), test_ball1.pos(2), test_ball1.pos(3), '.', 'markersize', 50), axis([0 1 0 1 0 1]), grid on, hold on, xlabel('x'), ylabel('y'), zlabel('z')
    plot3(test_ball2.pos(1), test_ball2.pos(2), test_ball2.pos(3), '.', 'markersize', 50), axis([0 1 0 1 0 1]), grid on, hold on, xlabel('x'), ylabel('y'), zlabel('z'), hold off
    pause(PAUSE_TIME)
end




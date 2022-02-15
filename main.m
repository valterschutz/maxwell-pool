que_ball.m = 0.1;  % 100 g
que_ball.q = 1e-3;  % 1 mC

x = linspace(0,1,10); y = linspace(0,1,10); z = linspace(0,1,10);
[X,Y,Z] = meshgrid(x,y,z);

que_ball.pos = [0.5; 0.5; 0.5];
que_ball.v = [0.1; 0.1; 0.1];
test_pos = [0.7;0.5;0.4];
test_charge = 1e-3;

dt = 0.01;

for t=0:dt:0.5
    que_ball.pos = que_ball.pos + que_ball.v*dt;
    plot3(que_ball.pos(1), que_ball.pos(2), que_ball.pos(3), '.', 'markersize', 50), axis([0 1 0 1 0 1]), grid on, hold on
    E_field = E(test_pos, que_ball);
    F = E_field*test_charge;
    quiver3(test_pos(1),test_pos(2),test_pos(3), F(1),F(2),F(3), 5e-7), hold off
    pause(0.01)
end




que_ball.m = 0.1;  % 100 g
que_ball.q = 1e-3;  % 1 mC

x = linspace(0,1,10); y = linspace(0,1,10); z = linspace(0,1,10);
[X,Y,Z] = meshgrid(x,y,z);

que_ball.pos = [0; 0; 0];
que_ball.v = [0.1; 0.1; 0.1];
test_pos1 = [0.7;0.5;0.4];
test_pos2 = [0.4;0.5;0.7];
test_pos = [reshape(X,[1, numel(X)]); reshape(Y, [1, numel(Y)]); reshape(Z, [1, numel(Z)])];
% test_pos is a matrix where each column is a position
test_charge = 1e-3;

dt = 0.01;

for t=0:dt:5
    que_ball.pos = que_ball.pos + que_ball.v*dt;
    plot3(que_ball.pos(1), que_ball.pos(2), que_ball.pos(3), '.', 'markersize', 50), axis([0 1 0 1 0 1]), grid on, hold on
    E_field = E(test_pos, que_ball);
    F = E_field*test_charge;
    quiver3(test_pos(1,:),test_pos(2,:),test_pos(3,:), F(1,:),F(2,:),F(3,:)), hold off
%     quiver3(test_pos(1,1),test_pos(2,1),test_pos(3,1), F(1,1),F(2,1),F(3,1), 5e-6)
%     quiver3(test_pos(1,2),test_pos(2,2),test_pos(3,2), F(1,2),F(2,2),F(3,2), 5e-6), hold off
    pause(0.01)
end




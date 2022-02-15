que_ball.m = 0.1;  % 100 g
que_ball.q = 1e-3;  % 1 mC

x = linspace(0,1,10); y = linspace(0,1,10); z = linspace(0,1,10);
[X,Y,Z] = meshgrid(x,y,z);

que_ball.pos = [0; 0; 0];
que_ball.v = [0.5; 0.5; 0.5];
test_pos1 = [0.7;0.5;0.4];
test_pos2 = [0.4;0.5;0.7];
test_pos = [reshape(X,[1, numel(X)]); reshape(Y, [1, numel(Y)]); reshape(Z, [1, numel(Z)])];
% test_pos is a matrix where each column is a position
test_charge = 1e-3;

dt = 0.1;

for t=0:dt:2
    que_ball.pos = que_ball.pos + que_ball.v*dt;
    plot3(que_ball.pos(1), que_ball.pos(2), que_ball.pos(3), '.', 'markersize', 50), axis([0 1 0 1 0 1]), grid on, hold on, xlabel('x'), ylabel('y'), zlabel('z')
    E_field = E(test_pos, que_ball);
    B_field = B(test_pos, que_ball);
%     F_E = E_field*test_charge;
%     F_B = B_field*test_charge;
    E_field = E_field*2e-5;  % Scaling
%     B_field = B_field*5e12;  % Scaling
    quiver3(test_pos(1,:),test_pos(2,:),test_pos(3,:), E_field(1,:),E_field(2,:),E_field(3,:), 'off'), hold off
%     quiver3(test_pos(1,:),test_pos(2,:),test_pos(3,:), B_field(1,:),B_field(2,:),B_field(3,:), 'off'), hold off
    pause(0.01)
end




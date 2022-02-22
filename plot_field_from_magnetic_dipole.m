PAUSE_TIME = 1;
DT = 0.1;
T = 2;  % How long to run simulation

que_ball.m = [0; 0; 1000];  % Magnetic dipole moment, unsure of units
que_ball.pos = [0; 0; 0];
que_ball.v = [0.5; 0.5; 0.5];

x = linspace(0,1,10); y = linspace(0,1,10); z = linspace(0,1,10);
[X,Y,Z] = meshgrid(x,y,z);


test_pos = [reshape(X,[1, numel(X)]); reshape(Y, [1, numel(Y)]); reshape(Z, [1, numel(Z)])];
% test_pos is a matrix where each column is a position



for t=0:DT:T
    que_ball.pos = que_ball.pos + que_ball.v*DT;
    plot3(que_ball.pos(1), que_ball.pos(2), que_ball.pos(3), '.', 'markersize', 50), axis([0 1 0 1 0 1]), hold on, grid on, xlabel('x'), ylabel('y'), zlabel('z')
    B_field = B_dipole(test_pos, que_ball);
    quiver3(test_pos(1,:),test_pos(2,:),test_pos(3,:), B_field(1,:),B_field(2,:),B_field(3,:), 'off'), hold off
    pause(PAUSE_TIME)
end




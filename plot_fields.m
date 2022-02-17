PLOT_E = false;
PLOT_B = true;
E_SCALING = 2e-5;
B_SCALING = 2e7;
PAUSE_TIME = 0.01;
DT = 0.1;
T = 2;  % How long to run simulation

que_ball.m = 0.1;  % 100 g
que_ball.q = 1e-3;  % 1 mC
que_ball.pos = [0; 0; 0];
que_ball.v = [0.5; 0.5; 0.5];

x = linspace(0,1,10); y = linspace(0,1,10); z = linspace(0,1,10);
[X,Y,Z] = meshgrid(x,y,z);


test_pos = [reshape(X,[1, numel(X)]); reshape(Y, [1, numel(Y)]); reshape(Z, [1, numel(Z)])];
% test_pos is a matrix where each column is a position
% test_charge = 1e-3;



for t=0:DT:T
    que_ball.pos = que_ball.pos + que_ball.v*DT;
    plot3(que_ball.pos(1), que_ball.pos(2), que_ball.pos(3), '.', 'markersize', 50), axis([0 1 0 1 0 1]), grid on, hold on, xlabel('x'), ylabel('y'), zlabel('z')
    E_field = E(test_pos, que_ball);
    B_field = B(test_pos, que_ball);
    E_field = E_field*E_SCALING;  % Scaling
    B_field = B_field*B_SCALING;  % Scaling
    if PLOT_E
        quiver3(test_pos(1,:),test_pos(2,:),test_pos(3,:), E_field(1,:),E_field(2,:),E_field(3,:), 'off')
    end
    if PLOT_B
        quiver3(test_pos(1,:),test_pos(2,:),test_pos(3,:), B_field(1,:),B_field(2,:),B_field(3,:), 'off')
    end
    hold off
    pause(PAUSE_TIME)
end




que_ball.m = 0.1;  % 100 g
que_ball.q = 0.01;  % 0.01 C

% x = linspace(0,1,10); y = linspace(0,1,10); z = linspace(0,1,10);
% [X,Y,Z] = meshgrid(x,y,z);

que_ball.pos = [0.5; 0.5; 0.5];
que_ball.v = [0.1; 0.1; 0.1];

dt = 0.01;

f = figure(1), grid on, xlim([0 1]), xlim('manual'), ylim([0 1]), ylim('manual'), zlim([0 1]), zlim('manual')
for t=0:dt:5
    que_ball.pos = que_ball.pos + que_ball.v*dt;
    plot3(que_ball.pos(1), que_ball.pos(2), que_ball.pos(3), '.', 'markersize', 50)
%     
    pause(0.01)
end




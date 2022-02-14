
m = 0.1;  % 100 g
q = 0.01;  % 0.01 C

x = linspace(0,1,10); y = linspace(0,1,10); z = linspace(0,1,10);
[X,Y,Z] = meshgrid(x,y,z);

pos0 = [0.5; 0.5; 0.5];


plot3(pos0(1), pos0(2), pos0(3), '.', 'markersize', 50), hold on
grid on, xlim([0 1]), ylim([0 1]), zlim([0 1])
quiver3(X,Y,Z,


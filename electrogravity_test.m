dt=0.01;
Q = 1;
M = 1;
m = 1;
T = 1;
radius = 0.3;
v0 = 2*pi*radius/T;
epsilon_0 = 8.8541878128e-12;

x = [0.5+radius; 0.5; 0.5];
X = [0.5; 0.5; 0.5];
v = [0;v0;0];

q = -m*16*pi^3*epsilon_0*radius^3/(Q*T^2);

plot3(X(1),X(2),X(3),'.','markersize',10), hold on
axis([0 1 0 1 0 1]), grid on

for k=1:100
    E = Q*(x-X)/(4*pi*epsilon_0*norm(x-X)^3);
    force = q*E;
    a = force/m;
    v = v+a*dt;
    x = x+v*dt;

    plot3(x(1),x(2),x(3), '.', 'markersize',10)
    pause(0.01)
end
hold off
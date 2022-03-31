% Only for testing purposes
% Assume magnetic field in z-direction
% Particle accelerates too much
e_1 = [0 1; 1 0];
e_2 = [0 -1i; 1i 0];
e_3 = [1 0; 0 -1];
F = 1*e_1*e_2;

dt=0.01;
T = 1;
v0 = 0.5;
m = 1e-3;  % 1 g
q = 5;
epsilon_0 = 8.8541878128e-12;
mu_0 = 1.25663706212e-6;  % H/m

x = vector_to_multivector([0.5; 0.2; 0.5]);
v = vector_to_multivector([-v0;0;0]);

p = plot3(x(1),x(2),x(3),'.','markersize',30);
axis([0 1 0 1 0 1]), grid on

for k=1:200
    % This should give same result as below but does not
    B = sqrt(mu_0)*F;
    force = -q*inner_product(v,B);

%     force = q/2*((F+F')/sqrt(epsilon_0)+sqrt(mu_0)/2*((F-F')*v-v*(F-F')));
    force_v = multivector_to_vector(force);
    
    a = force/m;
    v = v+a*dt;
    x = x+v*dt;
    
    xp = multivector_to_vector(x);
    p.XData = xp(1); p.YData = xp(2); p.ZData = xp(3);

    hold on, quiver3(xp(1),xp(2),xp(3),force_v(1),force_v(2),force_v(3),3), hold off
%     pq.XData = xp(1); pq.YData = xp(2); pq.ZData = xp(3);
    pause(0.01)
end
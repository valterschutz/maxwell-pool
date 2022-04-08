%% Solve y'=y
clearvars, clf
dt = 0.1;
T = 10;

t = 0:dt:10;

ys_RK = zeros(size(t));
ys_EF = zeros(size(t));
ys_exact = exp(t);

y = 1;  % y(0) = 1
for n=1:length(t)
    k1 = y;
    k2 = y+dt/2*k1;
    k3 = y+dt/2*k2;
    k4 = y+dt*k3;
    
    y = y + dt/6*(k1+2*k2+2*k3+k4);
    ys_RK(n) = y;
end

y = 1;  % y(0) = 1
for n=1:length(t)
    y = y + y*dt;
    ys_EF(n) = y;
end


plot(t,ys_RK,'LineWidth',2), hold on
plot(t,ys_EF,'LineWidth',2)
plot(t,ys_exact,'LineWidth',2), hold off
title(['exp(t), dt=' num2str(dt)])

legend("Runge-Kutta","Euler forward", "Exact")

%% Solve harmonic oscillator problem
clearvars, clf
dt = 0.1;
T = 20;
S0 = [1; 0];
g = 10;
k = 1;
m = 1;

t = 0:dt:T;

S_RK = zeros(2,length(t));
S_EF = zeros(2,length(t));
[t_ode45,S_ode45] = ode45(@(t,S) [S(2); g-k/m*S(1)], [0 T], S0);

S = S0;  % S = [x; v], S(0) = [1; 0]
for n=1:length(t)
    k1 = [S(2); g-k/m*S(1)];
    k2 = [S(2)+dt/2*k1(2); g-k/m*(S(1)+dt/2*k1(1))];
    k3 = [S(2)+dt/2*k2(2); g-k/m*(S(1)+dt/2*k2(1))];
    k4 = [S(2)+dt*k3(2); g-k/m*(S(1)+dt*k3(1))];
    
    S = S + dt/6*(k1+2*k2+2*k3+k4);
    S_RK(:,n) = S;
end

S = S0;  % S = [x; v], S(0) = [1; 0]
for n=1:length(t)
    S = S + dt*[S(2); g-k/m*S(1)];
    S_EF(:,n) = S;
end

plot(t,S_RK(1,:),'LineWidth',2), hold on
plot(t,S_EF(1,:),'LineWidth',2)
plot(t_ode45,S_ode45(:,1),'LineWidth',2), hold off
legend("Runge-Kutta","Euler forward","ode45")
text = '$\textrm{Harmonic oscillator} \; x''''(t)=g-k/m x(t)$';
title(text,'interpreter','latex','FontSize',18)

%% Two dimensional gravitational problem
clearvars, clf
C = 1;  % C = G*m2;
dt = 0.1;
T = 20;
S0 = [1; 0; 0; 1];

t = 0:dt:T;

S_RK = zeros(4,length(t));
S_EF = zeros(4,length(t));
[t_ode45,S_ode45] = ode45(@(t,S) [S(3); S(4); -C*S(1)/(S(1).^2+S(2).^2).^(3/2); -C*S(2)/(S(1).^2+S(2).^2).^(3/2)], [0 T], S0);

S = S0;  % S = [x; v], S(0) = [1; 0]
for n=1:length(t)
    k1 = [S(3); S(4); -C*S(1)/(S(1).^2+S(2).^2).^(3/2); -C*S(2)/(S(1).^2+S(2).^2).^(3/2)];
    k2 = [S(3)+dt/2*k1(3); S(4)+dt/2*k1(4); -C*(S(1)+dt/2*k1(1))/((S(1)+dt/2*k1(1)).^2+(S(2)+dt/2*k1(2)).^2).^(3/2); -C*(S(2)+dt/2*k1(2))/((S(1)+dt/2*k1(1)).^2+(S(2)+dt/2*k1(2)).^2).^(3/2)];
    k3 = [S(3)+dt/2*k2(3); S(4)+dt/2*k2(4); -C*(S(1)+dt/2*k2(1))/((S(1)+dt/2*k2(1)).^2+(S(2)+dt/2*k2(2)).^2).^(3/2); -C*(S(2)+dt/2*k2(2))/((S(1)+dt/2*k2(1)).^2+(S(2)+dt/2*k2(2)).^2).^(3/2)];
    k4 = [S(3)+dt*k3(3); S(4)+dt*k3(4); -C*(S(1)+dt*k3(1))/((S(1)+dt*k3(1)).^2+(S(2)+dt*k3(2)).^2).^(3/2); -C*(S(2)+dt*k3(2))/((S(1)+dt*k3(1)).^2+(S(2)+dt*k3(2)).^2).^(3/2)];
    
    S = S + dt/6*(k1+2*k2+2*k3+k4);
    S_RK(:,n) = S;
end

S = S0;  % S = [x; v], S(0) = [1; 0]
for n=1:length(t)
    S = S + dt*[S(3); S(4); -C*S(1)/(S(1).^2+S(2).^2).^(3/2); -C*S(2)/(S(1).^2+S(2).^2).^(3/2)];
    S_EF(:,n) = S;
end

plot(0,0,'k.','MarkerSize',30), hold on, axis equal
plot(S_RK(1,:),S_RK(2,:),'LineWidth',2)
plot(S_EF(1,:),S_EF(2,:),'LineWidth',2)
plot(S_ode45(:,1),S_ode45(:,2),'LineWidth',2)
legend("Center", "Runge-Kutta","Euler forward","ode45")
text = '$\textrm{Gravitation in 2D}$';
title(text,'interpreter','latex','FontSize',18)
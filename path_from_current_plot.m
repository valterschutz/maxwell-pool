lambda_1 = (1+1i)/sqrt(2);
lambda_2 = (1-1i)/sqrt(2);
alpha = 0.1;
v0 = 1;
T = 50; N = 100; dt = T/N;
t = 0:dt:T;

v = -v0/2*[exp(alpha*lambda_1*t)+exp(alpha*lambda_2*t); 1i*(exp(alpha*lambda_2*t)-exp(alpha*lambda_1*t))];
vx = v(1,:); vz = v(2,:);

subplot(1,2,1)
plot(vx,vz,'LineWidth',2), grid on
title("Velocity"), xlabel("v_x"), ylabel("v_z")

pos_x = cumsum(vx)*dt; pos_z = cumsum(vz)*dt;
subplot(1,2,2)
plot(pos_x,pos_z,'LineWidth',2), grid on
title("Position"), xlabel("x"), ylabel("z")
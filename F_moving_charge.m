function F = F_moving_charge(x,p)
%F_MOVING_CHARGE Evaluates F at x given a particle p with charge p.q at
%location p.x
%   Detailed explanation goes here

F = 1/(4*pi*sqrt(epsilon_0))*(x-p.x)*p.q/norm(x-p.x)^3;
end


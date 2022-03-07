function F = F_moving_charge(x,p)
%F_MOVING_CHARGE Evaluates F at x given a particle p with charge p.q at
%location p.x
%   Detailed explanation goes here

epsilon_0 = 8.8541878128e-12;

% This does not give correct result
% F = 1/(4*pi*sqrt(epsilon_0))*(x-p.x)*p.q/(x-p.x)^(3/2);

% Works
x = multivector_to_vector(x);
y = multivector_to_vector(p.x);
q = p.q(1,1);
F = 1/(4*pi*sqrt(epsilon_0))*(x-y)*q/norm(x-y)^3;
F = vector_to_multivector(F);
end


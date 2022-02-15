function res = E(test_pos,source_particle)
% source_particle is a struct with attributes
%   pos: [x; y; z]
%   v: [vx; vy; vz]
%   q: int
% test_pos is the position [tx; ty; tz] of test charge
% res is a column vector containing components of E-field

q = source_particle.q;
pos = source_particle.pos;

epsilon_0 = 8.8541878128e-12;

dist = norm(test_pos-pos);
res = q/(4*pi*epsilon_0) * (test_pos-pos) * 1/dist.^3;
end


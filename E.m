function res = E(test_pos,source_particle)
% source_particle is a struct with attributes
% pos: [x; y; z]
% v: [vx; vy; vz]
% q: int
% test_pos is position [tx; ty; tz] of test charge
% res is a column vector

% [tx; ty; tz] = test_pos;

q = source_particle.q;
% [vx; vy; vz] = source_particle.v;
pos = source_particle.pos;

dist = norm(test_pos-pos);

res = q/(4*pi*epsilon_0) * (test_pos-pos) * 1/dist.^3;

end


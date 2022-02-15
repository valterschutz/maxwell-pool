function res = E(test_pos,source_particle)
q = source_particle.q;
pos = source_particle.pos;

epsilon_0 = 8.8541878128e-12;

dist = norm(test_pos-pos);
res = q/(4*pi*epsilon_0) * (test_pos-pos) * 1/dist.^3;
end


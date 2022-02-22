function res = B_dipole(test_pos,source_particle)
% source_particle is expected to have properties pos (position) and m
% (magnetic dipole moment)
m = source_particle.m;
pos = source_particle.pos;

mu_0 = 1.25663706212e-6;

r = test_pos-pos;  % Vector from dipole to test position
dist = vecnorm(r);
res = mu_0/(4*pi) * (3*sum(r.*m).*r./dist.^5 - m./dist.^3);  % Note: sum(A.*B) is a column-wise dot product
end


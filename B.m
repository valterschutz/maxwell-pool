function res = B(test_pos,source_particle)
q = source_particle.q;
pos = source_particle.pos;
v = source_particle.v;

mu_0 = 1.25663706212e-6;

dist = norm(test_pos-pos);
res = mu_0*q/(4*pi) * cross(repmat(v,1,size(test_pos-pos,2)), (test_pos-pos), 1) * 1/dist.^3;  % Cross product along columns
end


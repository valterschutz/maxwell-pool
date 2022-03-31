function res = inner_product(u,v)
%OUTER_PRODUCT Calculates the inner product u \wedge v if u is a vector (but in matrix multivector notation) and
%v is a multivector
%   Detailed explanation goes here
res = 1/2*(u*v+v*u);
end


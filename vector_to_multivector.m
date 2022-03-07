function multivector = vector_to_multivector(vector)
%VECTOR_TO_MULTIVECTOR Summary of this function goes here
%   Detailed explanation goes here

sigma_1 = [0 1; 1 0];
sigma_2 = [0 -i; i 0];
sigma_3 = [1 0; 0 -1];

multivector = sigma_1 * vector(1) + sigma_2 * vector(2) + sigma_3 * vector(3);
end


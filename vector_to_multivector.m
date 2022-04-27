function multivector = vector_to_multivector(vector)
%VECTOR_TO_MULTIVECTOR Converts a vector in normal form to matrix form.

sigma_1 = [0 1; 1 0];
sigma_2 = [0 -1i; 1i 0];
sigma_3 = [1 0; 0 -1];

multivector = sigma_1 * vector(1) + sigma_2 * vector(2) + sigma_3 * vector(3);
end


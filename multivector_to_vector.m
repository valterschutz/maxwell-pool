function vector = multivector_to_vector(multivector)
%MULTIVECTOR_TO_VECTOR Converts a vector in matrix form to normal form.

vector = [real(multivector(2,1)); imag(multivector(2,1)); multivector(1,1)];
end


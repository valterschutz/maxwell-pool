function vector = multivector_to_vector(multivector)
%MULTIVECTOR_TO_VECTOR Summary of this function goes here
%   Detailed explanation goes here

vector = [real(multivector(1,2)+multivector(2,1))/2
          imag(multivector(2,1)-multivector(1,2))/2
          real(multivector(1,1)-multivector(2,2))/2];
end


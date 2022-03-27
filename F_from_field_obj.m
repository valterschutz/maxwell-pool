function F = F_from_field_obj(field_obj,particle)
%F_FROM_FIELD_OBJ Returns EM field F as a multivector generated by field
%object field_obj and evaluated at particle position
%   Detailed explanation goes here
epsilon_0 = 8.8541878128e-12;
switch field_obj.type
    case "charge"
        F = 1/(4*pi*sqrt(epsilon_0))*(particle.x-field_obj.x)*field_obj.q/((particle.x-field_obj.x)^2).^(3/2);
%         fprintf("|F| ~ %.2e\n",norm(multivector_to_vector(F)))
end
end


function field_obj = update_field_obj(field_obj,dt)
%UPDATE_FIELD_OBJ Summary of this function goes here
%   Detailed explanation goes here
switch field_obj.type
    case "charge"
        field_obj.v = vector_to_multivector(bounce_check(multivector_to_vector(field_obj.x), multivector_to_vector(field_obj.v)));
        field_obj.x = field_obj.x + field_obj.v*dt;
    case "eDipole"
        field_obj.v = vector_to_multivector(bounce_check(multivector_to_vector(field_obj.x), multivector_to_vector(field_obj.v)));
        field_obj.x = field_obj.x + field_obj.v*dt;
end
end


function field_obj = update_field_obj(field_obj)
%UPDATE_FIELD_OBJ Summary of this function goes here
%   Detailed explanation goes here
switch field_obj.type
    case "charge"
        field_obj.v = vector_to_multivector(bounce_check(multivector_to_vector(field_obj.x), multivector_to_vector(field_obj.v)));
        field_obj.x = field_obj.x + field_obj.v*DT;
end
end

function v_after = bounce_check(x,v_before)
%IS_OUT_OF_BOUNDS Change corresponding component of v if x is outside box
eps = 0.05;
if (x(1) < 0+eps && v_before(1)<0) || (x(1)>1-eps && v_before(1)>0)
    v_before(1) = -v_before(1);
end
if (x(2) < 0+eps && v_before(2)<0) || (x(2)>1-eps && v_before(2)>0)
    v_before(2) = -v_before(2);
end
if (x(3) < 0+eps && v_before(3)<0) || (x(3)>1-eps && v_before(3)>0)
    v_before(3) = -v_before(3);
end
v_after = v_before;
end


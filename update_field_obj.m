function field_obj = update_field_obj(field_obj,dt)
%UPDATE_FIELD_OBJ Update position of field object using the Euler-Forward
%method.
switch field_obj.type
    case {"charge", "eDipole", "mDipole"}
        field_obj.velocity = bounce_check(field_obj.position, field_obj.velocity);
        field_obj.position = field_obj.position + field_obj.velocity*dt;
    case "current"
        field_obj.velocity = bounce_check(field_obj.position, field_obj.velocity);
        field_obj.position = field_obj.position + field_obj.velocity*dt;
end
end


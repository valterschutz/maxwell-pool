function field_obj = generate_field_obj(type)
%GENERATE_FIELD_OBJ Returns a field object
%   Types so far: "charge"
if type=="charge"
    field_obj.type = type;
    field_obj.m = 1 * eye(2);  % 1 kg
    field_obj.q = 1e-3 * eye(2);  % 1 mC
    field_obj.x = vector_to_multivector([0.5; 0.5; 0.5]);
    field_obj.v = vector_to_multivector([0; 0; 0]);
    field_obj.color = 'k';
    field_obj.max_speed = 1;  % This corresponds to user entering 100% speed when aiming
    field_obj.starting_aim = [1;0;0];
%     field_obj.F = 0;  % No interacting fields
%     field_obj.force = 0;  % No interacting forces
%     field_obj.a = 0;  % Does not accelerate
    field_obj.p = 0;  % Reference to plot object
end
end


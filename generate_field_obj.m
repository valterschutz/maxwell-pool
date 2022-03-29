function field_obj = generate_field_obj(type)
%GENERATE_FIELD_OBJ Returns a field object
%   Types so far: "charge"
if type=="charge"
    field_obj.type = type;
    field_obj.m = 1 * eye(2);  % 1 kg
    field_obj.q = 1 * eye(2);  % 1 C
    field_obj.x = vector_to_multivector([0.5; 0.5; 0.5]);
    field_obj.v = vector_to_multivector([0; 0; 0]);
    field_obj.color = 'k';
    field_obj.size = 50;
    field_obj.max_speed = 1;  % This corresponds to user entering 100% speed when aiming
    field_obj.starting_aim = [1;0;0];
    field_obj.p = 0;  % Reference to plot object
else if type=="eDipole"
    field_obj.type = type;
    field_obj.m = 1 * eye(2);  % 1 kg
    field_obj.d = 0.01 * vector_to_multivector([1; 0; 0]);  % 0.01 C
    field_obj.x = vector_to_multivector([0.5; 0.5; 0.5]);
    field_obj.v = vector_to_multivector([0; 0; 0]);
    field_obj.color = 'k';
    field_obj.size = 1;
    field_obj.max_speed = 1;  % This corresponds to user entering 100% speed when aiming
    field_obj.starting_aim = [1;0;0];
    field_obj.p = 0;  % Reference to plot object 
end
end


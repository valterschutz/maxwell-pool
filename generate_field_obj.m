function field_obj = generate_field_obj(type)
%GENERATE_FIELD_OBJ Returns a field object
%   Types so far: "charge", "eDipole
switch type
    case "charge"
        field_obj.type = type;
        field_obj.m = 1;  % 1 kg
        field_obj.q = 1e-5;  % 10 mikroC
        field_obj.x = [0.5; 0.5; 0.5];
        field_obj.v = [0; 0; 0];
        field_obj.color = 'k';
        field_obj.size = 50;
        field_obj.max_speed = 1;  % This corresponds to user entering 100% speed when aiming
        field_obj.starting_aim = [1;0;0];
        field_obj.p = 0;  % Reference to plot object
        field_obj.n_particles = 10;
    case "eDipole"
        field_obj.type = type;
        field_obj.m = 1;  % 1 kg
        field_obj.d = 0.1e-3 * [1; 0; 0];  % 0.1 mC
        field_obj.x = [0.5; 0.5; 0.5];
        field_obj.v = [0; 0; 0];
        field_obj.color = 'k';
        field_obj.size = 1;
        field_obj.max_speed = 1;  % This corresponds to user entering 100% speed when aiming
        field_obj.starting_aim = [1;0;0];
        field_obj.p = 0;  % Reference to plot object
        field_obj.n_particles = 5;
    case "current"
        field_obj.type = type;
        field_obj.x = [0; 0.5; 0];  % Where the conductor crosses the xy-plane
%         field_obj.current = 1e14;  % Strong current
        field_obj.v = [0;0;0];
        field_obj.max_speed = 1;
        field_obj.starting_aim = [1;0;0];
        field_obj.current = 4e12;
        field_obj.color = "k";
        field_obj.size = 5;
        field_obj.p = 0;
        field_obj.n_particles = 1;
end
end


function field_obj = generate_field_obj(type)
%GENERATE_FIELD_OBJ Returns a field object
%   type is "charge", "eDipole", "current" or "mDipole"
switch type
    case "charge"
        field_obj.type = type;
        field_obj.charge = 1e-8;  % 10 nanoC
        field_obj.position = [0.5; 0.5; 0.5];
        field_obj.velocity = [0; 0; 0];
        field_obj.color = 'k';
        field_obj.size = 50;
        field_obj.max_speed = 1;  % This corresponds to user entering 100% speed when aiming
        field_obj.starting_aim = [1;0;0];
        field_obj.plotobj = 0;  % Reference to plot object
    case "eDipole"
        field_obj.type = type;
        field_obj.dipolemoment = 1e-7 * [1; 0; 0];  % Electric dipole moment [Cm]
        field_obj.position = [0.5; 0.5; 0.5];
        field_obj.velocity = [0; 0; 0];
        field_obj.color = 'k';
        field_obj.size = 2;
        field_obj.plotobj = 0;  % Reference to plot object
    case "current"
        field_obj.type = type;
        field_obj.position = [0; 0.5; 0];  % Where the wire crosses the xy-plane
        field_obj.velocity = [0;0;0];
        field_obj.max_speed = 1;
        field_obj.starting_aim = [1;0;0];
        field_obj.current = 4e12;
        field_obj.color = "k";
        field_obj.size = 5;
        field_obj.plotobj = 0;
    case "mDipole"
        field_obj.type = type;
        e2 = [0 -1i; 1i 0];
        e3 = [1 0; 0 -1];
        field_obj.dipolemoment =  5e10 * e2 * e3;  % A multivector! [Am^2]
        field_obj.position = [0.5; 0.5; 0.5];
        field_obj.velocity = [0; 0; 0];
        field_obj.color = 'yellow';
        field_obj.size = 2;
        field_obj.plotobj = 0;  % Reference to plot object
end
end


function field_obj = control_field_obj(ax,field_obj)
%CONTROL_FELD_OBJ Summary of this function goes here
%   Detailed explanation goes here

switch field_obj.type
    case "charge"
        % Allow user to aim, start with aim [1;0;0]
        aim = field_obj.starting_aim;
        theta = pi/16;  % Small angle to rotate
        dz = 0.1;  % Small z to rotate upwards
        Z_rot = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
        Z_rot_inv = [cos(-theta) -sin(-theta) 0; sin(-theta) cos(-theta) 0; 0 0 1];

        % Plot arrow representing aim
        pos = field_obj.x;
        hold(ax,'on')
        % Create a quiver object, updated later
        q = quiver3(ax,pos(1),pos(2),pos(3),aim(1),aim(2),aim(3),0.2,'k','LineWidth',2);
        hold(ax,'off')
        
        while true
            q.UData = aim(1); q.VData = aim(2); q.WData = aim(3);
            disp("Waiting for input...")
            [~,~,button] = ginput(1);
            switch button
                case 28  % Left arrow
                    aim = Z_rot*aim;
                case 29  % Right arrow
                    aim = Z_rot_inv*aim;
                case 30  % Up arrow
                    aim = aim + [0;0;dz];
                    aim = aim/norm(aim);
                case 31  % Down arrow
                    aim = aim - [0;0;dz];
                    aim = aim/norm(aim);
                case 32  % Spacebar
                    break
                otherwise
                    continue
            end

        end
        disp("Aim set!")
        strength = input("Hit strength (value between 0-100): "); 
        field_obj.v = strength/100*field_obj.max_speed*aim;
        delete(q);
    case "current"
        % Allow user to aim, start with aim [1;0;0]
        aim = field_obj.starting_aim;
        theta = pi/16;  % Small angle to rotate
        Z_rot = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
        Z_rot_inv = [cos(-theta) -sin(-theta) 0; sin(-theta) cos(-theta) 0; 0 0 1];

        % Plot arrow representing aim
        pos = field_obj.x;
        hold(ax,'on')
        % Create a quiver object, updated later
        q = quiver3(ax,pos(1),pos(2),pos(3),aim(1),aim(2),aim(3),0.2,'k','LineWidth',2);
        hold(ax,'off')
        
        while true
            q.UData = aim(1); q.VData = aim(2); q.WData = aim(3);
            disp("Waiting for input...")
            [~,~,button] = ginput(1);
            switch button
                case 28  % Left arrow
                    aim = Z_rot*aim;
                case 29  % Right arrow
                    aim = Z_rot_inv*aim;
                case 32  % Spacebar
                    break
                otherwise
                    continue
            end

        end
        disp("Aim set!")
        strength = input("Hit strength (value between 0-100): "); 
        field_obj.v = strength/100*field_obj.max_speed*aim;
        delete(q);
end
end


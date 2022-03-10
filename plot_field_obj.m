function field_obj = plot_field_obj(ax,field_obj)
%PLOT_OBJ Summary of this function goes here
%   Detailed explanation goes here
hold(ax,'on')
switch field_obj.type
    case "charge"
        p = plot3(ax,real(field_obj.x(1,2)+field_obj.x(2,1))/2, imag(field_obj.x(2,1)-field_obj.x(1,2))/2, real(field_obj.x(1,1)-field_obj.x(2,2))/2, '.', 'Color', field_obj.color, 'markersize', 50);
        field_obj.p = p;
end
hold(ax,'off')
end


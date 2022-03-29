function [] = replot_field_obj(field_obj)
%REPLOT_FIELD_OBJ Summary of this function goes here
%   Detailed explanation goes here
switch field_obj.type
    case "charge"
        x = real(field_obj.x(1,2)+field_obj.x(2,1))/2;
        y = imag(field_obj.x(2,1)-field_obj.x(1,2))/2;
        z = real(field_obj.x(1,1)-field_obj.x(2,2))/2;
        
        field_obj.p.XData = x;
        field_obj.p.YData = y;
        field_obj.p.ZData = z;
        
        field_obj.px.YData = y;
        field_obj.px.ZData = z;
        
        field_obj.py.XData = x;
        field_obj.py.ZData = z;
        
        field_obj.pz.XData = x;
        field_obj.pz.YData = y;
    case "eDipole"
        x = real(field_obj.x(1,2)+field_obj.x(2,1))/2;
        y = imag(field_obj.x(2,1)-field_obj.x(1,2))/2;
        z = real(field_obj.x(1,1)-field_obj.x(2,2))/2;
        
        field_obj.p.XData = x-0.05;
        field_obj.p.YData = y;
        field_obj.p.ZData = z;
        
        field_obj.px.YData = y;
        field_obj.px.ZData = z;
        
        field_obj.py.XData = x;
        field_obj.py.ZData = z;
        
        field_obj.pz.XData = x;
        field_obj.pz.YData = y;
end
end


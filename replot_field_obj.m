function replot_field_obj(ax,field_obj)
%REPLOT_FIELD_OBJ Summary of this function goes here
%   Detailed explanation goes here
switch field_obj.type
    case "charge"
        x = field_obj.position(1);
        y = field_obj.position(2);
        z = field_obj.position(3);
        
        field_obj.plotobj.XData = x;
        field_obj.plotobj.YData = y;
        field_obj.plotobj.ZData = z;
    case {"eDipole", "mDipole"}
        x = field_obj.position(1);
        y = field_obj.position(2);
        z = field_obj.position(3);
        
        field_obj.plotobj.XData = x-0.05;
        field_obj.plotobj.YData = y;
        field_obj.plotobj.ZData = z;
    case "current"
        x = field_obj.position(1);
        y = field_obj.position(2);

        field_obj.plotobj.XData = [x,x];
        field_obj.plotobj.YData = [y,y];
end
end


function replot_field_obj(field_obj)
%REPLOT_FIELD_OBJ Update position of field object field_obj in plot.
switch field_obj.type
    case "charge"
        x = field_obj.position(1);
        y = field_obj.position(2);
        z = field_obj.position(3);
        
        field_obj.plotobj.XData = x;
        field_obj.plotobj.YData = y;
        field_obj.plotobj.ZData = z;

        % Update shadows if they exist
        if isfield(field_obj, 'xshadow_plotobj')
            field_obj.xshadow_plotobj.YData = y;
            field_obj.xshadow_plotobj.ZData = z;
        
            field_obj.yshadow_plotobj.XData = x;
            field_obj.yshadow_plotobj.ZData = z;
        
            field_obj.zshadow_plotobj.XData = x;
            field_obj.zshadow_plotobj.YData = y;
        end
    case {"eDipole", "mDipole"}
        x = field_obj.position(1);
        y = field_obj.position(2);
        z = field_obj.position(3);
        
        field_obj.plotobj.XData = x-0.05;
        field_obj.plotobj.YData = y;
        field_obj.plotobj.ZData = z;

        % Update shadows if they exist
        if isfield(field_obj, 'xshadow_plotobj')
            field_obj.xshadow_plotobj.YData = y;
            field_obj.xshadow_plotobj.ZData = z;
        
            field_obj.yshadow_plotobj.XData = x;
            field_obj.yshadow_plotobj.ZData = z;
        
            field_obj.zshadow_plotobj.XData = x;
            field_obj.zshadow_plotobj.YData = y;
        end
    case "current"
        x = field_obj.position(1);
        y = field_obj.position(2);

        field_obj.plotobj.XData = [x,x];
        field_obj.plotobj.YData = [y,y];

        % Update shadows if they exist
        if isfield(field_obj, 'xshadow_plotobj')
            field_obj.xshadow_plotobj.YData = [y,y];
        
            field_obj.yshadow_plotobj.XData = [x,x];
        end
end
end


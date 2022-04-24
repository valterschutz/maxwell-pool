function field_obj = plot_field_obj(ax,field_obj,shadows)
%PLOT_OBJ Plots field object field_obj in axes ax.
%   If shadows is true, plot shadows on the side of the box.
hold(ax,'on')
switch field_obj.type
    case "charge"
        x = field_obj.position(1);
        y = field_obj.position(2);
        z = field_obj.position(3);
        
        field_obj.plotobj = plot3(ax,x,y,z, 'Marker','.', 'Color', field_obj.color, 'MarkerSize', field_obj.size);
        if shadows
            field_obj.xshadow_plotobj = plot3(ax,1, y, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
            field_obj.yshadow_plotobj = plot3(ax,x, 1, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
            field_obj.zshadow_plotobj = plot3(ax,x, y, 0, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
        end
    case {"eDipole", "mDipole"}
        x = field_obj.position(1);
        y = field_obj.position(2);
        z = field_obj.position(3);
        
        field_obj.plotobj = quiver3(ax,x-0.05,y,z,0.1,0,0, field_obj.size, 'Color', field_obj.color, 'LineWidth', 2*field_obj.size, 'MaxHeadSize', 1);
        if shadows
            field_obj.xshadow_plotobj = plot3(ax,1, y, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
            field_obj.yshadow_plotobj = plot3(ax,x, 1, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
            field_obj.zshadow_plotobj = plot3(ax,x, y, 0, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
        end
    case "current"
        x = field_obj.position(1);
        y = field_obj.position(2);

        field_obj.plotobj = plot3(ax,[x,x],[y,y],[0,1],'-','Color',field_obj.color,'LineWidth',field_obj.size);
        if shadows
            field_obj.xshadow_plotobj = plot3(ax,[1,1],[y,y],[0,1],'-','Color',[0.8 0.8 0.8],'LineWidth',field_obj.size);
            field_obj.yshadow_plotobj = plot3(ax,[x,x],[1,1],[0,1],'-','Color',[0.8 0.8 0.8],'LineWidth',field_obj.size);
        end
end
hold(ax,'off')
end


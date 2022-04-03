function field_obj = plot_field_obj(ax,field_obj)
%PLOT_OBJ Summary of this function goes here
%   Detailed explanation goes here
hold(ax,'on')
switch field_obj.type
    case "charge"
        x = field_obj.x(1);
        y = field_obj.x(2);
        z = field_obj.x(3);
        
        field_obj.p = plot3(ax,x,y,z, 'Marker','.', 'Color', field_obj.color, 'MarkerSize', field_obj.size);
%         field_obj.px = plot3(ax,1, y, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
%         field_obj.py = plot3(ax,x, 1, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
%         field_obj.pz = plot3(ax,x, y, 0, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
    case "eDipole"
        x = field_obj.x(1);
        y = field_obj.x(2);
        z = field_obj.x(3);
        
        field_obj.p = quiver3(ax,x-0.05,y,z,0.1,0,0, field_obj.size, 'Color', field_obj.color, 'LineWidth', 2*field_obj.size, 'MaxHeadSize', 1);
    case "current"
        x = field_obj.x(1);
        y = field_obj.x(2);
        field_obj.p = plot3(ax,[x,x],[y,y],[0,1],'-','Color',field_obj.color,'LineWidth',field_obj.size);
end
hold(ax,'off')
end


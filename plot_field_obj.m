function field_obj = plot_field_obj(ax,field_obj)
%PLOT_OBJ Summary of this function goes here
%   Detailed explanation goes here
hold(ax,'on')
switch field_obj.type
    case "charge"
        x = real(field_obj.x(1,2)+field_obj.x(2,1))/2;
        y = imag(field_obj.x(2,1)-field_obj.x(1,2))/2;
        z = real(field_obj.x(1,1)-field_obj.x(2,2))/2;
        
        field_obj.p = plot3(ax,x,y,z, 'Marker','.', 'Color', field_obj.color, 'MarkerSize', field_obj.size);
%         field_obj.px = plot3(ax,1, y, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
%         field_obj.py = plot3(ax,x, 1, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
%         field_obj.pz = plot3(ax,x, y, 0, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
    case "eDipole"
        x = real(field_obj.x(1,2)+field_obj.x(2,1))/2;
        y = imag(field_obj.x(2,1)-field_obj.x(1,2))/2;
        z = real(field_obj.x(1,1)-field_obj.x(2,2))/2;
        
        field_obj.p = quiver3(ax,x-0.05,y,z,0.1,0,0, field_obj.size, 'Color', field_obj.color, 'LineWidth', 2*field_obj.size, 'MaxHeadSize', 1);
%         field_obj.px = plot3(ax,1, y, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
%         field_obj.py = plot3(ax,x, 1, z, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
%         field_obj.pz = plot3(ax,x, y, 0, 'Marker','o', 'MarkerSize', 10,'MarkerFaceColor',[0.8 0.8 0.8],'MarkerEdgeColor',field_obj.color);
end
hold(ax,'off')
end


function F = F_from_field_obj(field_obj,x)
%F_FROM_FIELD_OBJ Returns EM field F as a multivector generated by field
%object field_obj and evaluated at x
%   Detailed explanation goes here
epsilon_0 = 8.8541878128e-12;
mu_0 = 1.25663706212e-6;  % H/m
switch field_obj.type
    case "charge"
        x = vector_to_multivector(x);
        y = vector_to_multivector(field_obj.x);
        q = field_obj.q;
        F = 1/(4*pi*sqrt(epsilon_0))*(x-y)*q/((x-y)^2).^(3/2);
    case "eDipole"
        %field_obj.p is the dipolemoment.
        d = vector_to_multivector(field_obj.d);
        R=vector_to_multivector(x-field_obj.x); %from dipole to testparticle
        A=d*R+R*d; % 2 * field_obj.p DOTPRODUCT R
        F=1/(4*pi*sqrt(epsilon_0)) * (3/2*(R)*(A)/((R^2).^(5/2))-d/((R^2).^(3/2)));
    case "current"
        % First calculate where particle position is in xy-plane, call this
        % xp
        xp = x; xp(3) = 0; xp = vector_to_multivector(xp);
        y = vector_to_multivector(field_obj.x);
        e3 = [1 0; 0 -1];
        I = field_obj.current;
        
        % Define the outer product for a vector u and bivector v
        outer_product = @(u,v) 1/2*(u*v-v*u);

        F = sqrt(mu_0)*I/(2*pi)*outer_product(e3,xp-y)/(xp-y)^2;
end
end


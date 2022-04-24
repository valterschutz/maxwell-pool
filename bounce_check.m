function v_after = bounce_check(x,v_before)
%BOUNCE_CHECK If position x is outside the 1x1x1 box with one corner in
%[0;0;0] and the other in [1;1;1] and the velocity v_before is pointing out
%of the box, reverse the velocity.

eps = 0.05;  % Ideally this should be equal to the radius of particles
v_after = v_before;  % Keep velocity same if no bouncing occurs
if (x(1) < 0+eps && v_before(1)<0) || (x(1)>1-eps && v_before(1)>0)
    v_after(1) = -v_before(1);
end
if (x(2) < 0+eps && v_before(2)<0) || (x(2)>1-eps && v_before(2)>0)
    v_after(2) = -v_before(2);
end
if (x(3) < 0+eps && v_before(3)<0) || (x(3)>1-eps && v_before(3)>0)
    v_after(3) = -v_before(3);
end
end


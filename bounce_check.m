function v_after = bounce_check(x,v_before)
%IS_OUT_OF_BOUNDS Change corresponding component of v if x is outside box
eps = 0.05;
if (x(1) < 0+eps && v_before(1)<0) || (x(1)>1-eps && v_before(1)>0)
    v_before(1) = -v_before(1);
end
if (x(2) < 0+eps && v_before(2)<0) || (x(2)>1-eps && v_before(2)>0)
    v_before(2) = -v_before(2);
end
if (x(3) < 0+eps && v_before(3)<0) || (x(3)>1-eps && v_before(3)>0)
    v_before(3) = -v_before(3);
end
v_after = v_before;
end


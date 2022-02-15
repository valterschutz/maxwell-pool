function bool = is_out_of_bounds(pos)
%IS_OUT_OF_BOUNDS Checks if position vector pos is outside box with
%sidelengths 1
bool = pos(1) < 0 || pos(1) > 1 || pos(2) < 0 || pos(2) > 1 || pos(3) < 0 || pos(3) > 1;
end


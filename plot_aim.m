function [] = plot_aim(ax,cue_ball,aim)
%PLOT_AIM Plots an arrow from que_ball towards aim. Assume aim is
%normalized
%   Detailed explanation goes here
que_ball_pos = multivector_to_vector(cue_ball.x);
hold on
quiver3(ax,que_ball_pos(1),que_ball_pos(2),que_ball_pos(3),aim(1),aim(2),aim(3),0.2,'k','LineWidth',2)
hold off
end


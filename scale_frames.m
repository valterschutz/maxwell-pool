function frames = scale_frames(frames)
%SCALE_FRAMES Summary of this function goes here
%   Detailed explanation goes here
for i = 1:length(frames)
    i
    A = imresize(frames(i).cdata(:,:,1), [700, 700]);
    B = imresize(frames(i).cdata(:,:,2), [700, 700]);
    C = imresize(frames(i).cdata(:,:,3), [700, 700]);
    frames(i).cdata = zeros(700,700,3);
    frames(i).cdata(:,:,1) = A;
    frames(i).cdata(:,:,2) = B;
    frames(i).cdata(:,:,3) = C;
end
end


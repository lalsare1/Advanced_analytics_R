%Created by Amoolya
%Function sinewave
function sinewave(multi)
clc;
y = zeros(250, 1);
theta = 0:(multi*pi/250):multi*pi;
    for i = 1:length(theta);
    y(i) = sin(theta(i));
    end
%Creating a plot with appropriate marker size, marker type, marker color    
plot(theta, y, '-o', 'MarkerSize', 15, 'MarkerFaceColor', 'blue');
%plot(theta, y);
title('sinewave'); %Title for the plot
xlim([0, 25.2]); %X axis limits
xlabel('theta'); %Axis labels
ylabel('y');
end

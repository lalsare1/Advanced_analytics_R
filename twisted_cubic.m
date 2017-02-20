%Created by Amoolya
%Plotting The Twisted Cubic
function twisted_cubic(umin, umax)
    %Checking for required arguments. If less than 2 or no arguments are
    %used while calling the function, the function will prompt for the
    %required arguments.
    if nargin == 1
        umax = input('Enter the maximum value of u:');
    elseif nargin == 0
        umin = input('Enter the minimum value of u:');
        umax = input('Enter the maximum value of u:');
    end
u = linspace(umin, umax, 500);
x = u;
y = u.^2;
z = u.^3;
plot3(x,y,z), grid
xlabel('x(t) = u');
ylabel('y(t) = u^2');
zlabel('z(t) = u^3');
title('The Twisted Cubic, (u, u^2, u^3)')
end

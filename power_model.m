%created by Amoolya
%Power model
function power_model()
A = [2.1; 2.12; 2.15; 2.2; 2.22; 2.23; 2.26; 2.3];
W = [70; 75; 77; 80; 82; 84; 87; 90];
y = log(A);
x = log(W);
%Finding the constants for linear regression fitting
X = [ones(length(x),1) x];
B = X\y;
yCalc = X*B;
%Plotting the linearized data (logarithms)
subplot(2,1,1);
scatter(x,y,'blue');
hold on;
%Linear regression of the transformed data
plot(x,yCalc,'red');
legend('Data', 'Slope and Intercept', 'Location', 'best');
xlabel('Log(A)');
ylabel('Log(W)');
title('Linearization and linear regression fitting for transformed data');
hold on;
%Finding a and b from constants obtained from linear regression fit
a = exp(B(1));
b = B(2);
%Display the constants
constants = [a, b]
A = a*W.^b;
ax2 = gca;
%Fitting power model to the original data
subplot(2,1,2);
scatter(A, W);
xlabel('A');
ylabel('W');
title('Fitting the power model to original data');
end

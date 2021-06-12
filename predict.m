function x_predict = predict(y, x_mean, v_mean, x_var, v_var, a, b)
%Function predicts x given information about noise and observed RV v and y
%respectively. 
% y: Observation
% x_mean: Mean of original signal's distribution 
% v_mean: Mean of noise
% x_var: Variance of original signal
% v_var: Variance of noise


% y_mean: Mean of observation
y_mean = a*x_mean+b*v_mean; 

% y_var: Variance of observed RV
y_var = a^2.*(x_mean.^2+x_var) + b^2.*(v_mean+v_var) + y_mean.^2 + 2*a*b*v_mean*v_mean - 2*b*y_mean*v_mean - a*y_mean*x_mean;

% xy_var: Covariance of XY
xy_var = a*x_var;

%Estimate x: 
x_predict = x_mean + (y-y_mean).*xy_var./y_var; 





end


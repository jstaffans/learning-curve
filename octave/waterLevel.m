% Octave prototyping for the water level example.
% Based on exercise 5 from Coursera's machine learning course.


clear; close all; clc

fprintf('Loading data ...')

X = csvread('level.csv');
y = csvread('flow.csv');

m = size(X, 1);

%plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
%xlabel('Change in water level');
%ylabel('Water flow out of the dam');

theta = [1; 1];
[J, grad] = linearRegCostFunction([ones(m, 1) X], y, theta, 1);

fprintf(['Cost at theta = [1; 1]: %f ' ...
         '\n(should be about 303.993)\n'], J);

% Train linear regression

lambda = 0;
[theta] = trainLinearReg([ones(m, 1) X], y, lambda);

plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
hold on;
plot(X, [ones(m, 1) X]*theta, '--', 'LineWidth', 2)
hold off;

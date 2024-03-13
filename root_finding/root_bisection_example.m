% Setup Problem
x = 60;   % ft
v0 = 50;  % ft/s
hQ = 6.5; % ft
g = 32.2; % ft/s^2

f = @(theta_deg) x * tand(theta_deg) ...
    - 0.5*x^2*g/v0^2./cosd(theta_deg).^2 ...
    + hQ - 7;

% Visualize & Select an Interval
thetas_deg = 1:70;
figure
hold on;
plot(thetas_deg, f(thetas_deg));
grid on;
xlabel('\theta^\circ');
ylabel('f(\theta)');

a = 20; b = 40;
plot([a, b], [0, 0], 'LineWidth', 2);

% Bisection Algorithm
for i = 1:10
    xns = (a + b)/2;
    
    % Two candidate brackets:
    % [a xns] or [xns b]
    % Run check to decide which bracket to proceed with
    % f(A)*F(B) < 0
    fa = f(a);
    fxns = f(xns);
    
    fprintf("%d  %f  %f  %f  %f\n", i, a, b, xns, f(xns));
    
    if fa*fxns < 0
        b = xns;
    else
        a = xns;
    end
    plot([a, b], [i, i], 'LineWidth', 2);
end



% Update bracket
% a = 
% b = 




% View Result
fprintf("theta: %f\n", xns);
plot(xns, f(xns), 'k*');



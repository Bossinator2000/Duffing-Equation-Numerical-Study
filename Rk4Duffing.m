function [xVals, vVals] = Rk4Duffing(xi, vi, r)
%Numerically integrates the Duffing Equation using a fourth order
%Runge-Kutta method. An inital position, inital velocity, and driving
%coefficent are inputted. A 1 million long column vector for position and
%another for velocity is outputed. The Duffing Equation is split into a
%coupled pair of single order differential equations given by: dx/dt = v
%and dv/dt = (-k*x - A*x^3 - B*v + R*cos(omega*t))/m. 

A = 4; %Non-Linear component coefficient
B = .154; %Drag coefficeint
omega = 1.2199778; %Angular Frequency
k = -1; %SHM coefficent
m = 1; %mass
R = r; %Driving coefficeint
xVals = zeros(1000000, 1); %Make position output a 1 million long column
                           %vector full of zeroes
vVals = zeros(1000000, 1); %Make velcoity output a 1 million long column
                           %vector full of zeroes
xVals(1, 1) = xi;%Set the first value in the position output to the initial 
                 %postition value input
vVals(1, 1) = vi;%Set the first value in the velocity output to the initial
                 %velocity value input
t = 0; %Set time equal to zero
T = 2*pi/omega; %Set the period based on the angular frequency
h = T/1250; %Set a stepsize proportional to the period
for n = 1:999999 %Loop 1 million minus 1 times
    v = vVals(n, 1); %Create a velocity variable equal to the current
                     %velocity value in the output
    x = xVals(n, 1); %Create a position variable equal to the current 
                     %position value in the output
    k1v = (-k*x - A*x^3 - B*v + R*cos(omega*t))/m; %Calculate k1v
    k1x = v; %Calculate k1x
    v = vVals(n, 1) + k1v*h/2; %Calculate v for k2
    x = xVals(n, 1) + k1x*h/2; %Calculate x for k2
    t = t + h/2; %Increment t for k2
    k2v = (-k*x - A*x^3 - B*v + R*cos(omega*t))/m; %Calculate k2v
    k2x = v; %Calculate k2x
    v = vVals(n, 1) + k2v*h/2; %Calculate v for k3
    x = xVals(n, 1) + k2x*h/2; %Calculate x for k3
    %t does not need to be increment because it is the same for k2 and k3
    k3v = (-k*x - A*x^3 - B*v + R*cos(omega*t))/m; %Calculate k3v
    k3x = v; %Calculate k3x
    v = vVals(n, 1) + k3v*h; %Calculate v for k4
    x = xVals(n, 1) + k3x*h; %Calculate x for k4
    t = t + h/2; %Increment t for k4
    k4v = (-k*x - A*x^3 - B*v + R*cos(omega*t))/m; %Calculate k4v
    k4x = v; %Calculate k4x
    vVals(n + 1, 1) = vVals(n, 1) + h/6*(k1v + 2*(k2v + k3v) + k4v); 
    %Calculate the next velocity value by adding a weighted average of k1v,
    %k2v, k3v and k4v multiplied by the step size to the current velocity 
    %value
    xVals(n + 1, 1) = xVals(n, 1) + h/6*(k1x + 2*(k2x + k3x) + k4x);
    %Calculate the next position value by adding a weighted average of k1x,
    %k2x, k3x and k4x multiplied by the step size to the current position
    %value
end



end


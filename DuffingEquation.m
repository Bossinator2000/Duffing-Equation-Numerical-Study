xi = .1; %Initial postion
vi = .1; %Inital velocity
R = .1143; %Driving coefficient
[x, v] = Rk4Duffing(xi,vi,R); %Creates a 1 million by 2 matrix where
%the fist column is full of position values and the second column is full
%of velocity values. See Rk4Duffing.m* to see how the matrix is computed
plot(x(10^6-10^5:10^6), v(10^6-10^5:10^6), '.'); %Plots postion versus velocity
title('v vs. x'); %Gives the plot a title
ylabel('v'); %Labels the y axis
xlabel('x'); %Labels the x axis
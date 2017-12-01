b = 8; %Amount of bifucations desired to be seen
precision = 10^(-5); %Precision of R values, not all bifurcations desired 
%will be able to be seen unless the precision is set sufficiently low 
%enough. However, lower R values can take a lot of computing power and
%time!!
Ri = .1; %Inital R Value
Rf = .12; %Final R Value
length = (Rf - Ri)/precision; %Number of (R, x) points to be calculated 
                              %based on the precision, Ri, and Rf values
R = zeros(int8(length), 1); %Column vector for R set to 0
x = zeros(int8(length), 2^(b)); %Matrix for x set to 0. It has the same 
                                %amount of rows as R so they can be ploted
                                %against eachother. Its length is set so
                                %that the amount of bifurcations desired
                                %can be seen.
for n = 1:length %Loop through length
    R(n) = (n-1)*precision+Ri;%Input the current R value into the R vector
    [xVals, vVals] = Rk4Duffing(.1, .1, R(n));%Numerically solve the 
                                              %the Duffing equation and
                                              %store position and velocity
                                              %in xVals and vVals
                                              %respectively
                                         
    for j = 1:2^b %Loop through the columns of x
        x(n,j) = xVals(1000000-1250*(j-1)); %Input values from xVals 
                                            %separated by a period into x
    end
    
    
end
plot(R, x, '.'); %Plot x vs. R
title('x vs. R'); %Give it a title
ylabel('x'); %Label y-axis
xlabel('R'); %Label x-axis

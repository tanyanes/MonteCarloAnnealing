
function [score] = ScoreKNNVar(xdata,ydata,x,y)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[xs,ys] = getKNN(xdata,ydata,x,y,3);
distanceList = zeros(1,3);
for i = 1:3
    distanceList(1,i) = sqrt((x-xs(i))^2 + (y-ys(i))^2);
end
score = std(distanceList)^2;
end
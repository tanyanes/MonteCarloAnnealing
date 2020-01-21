function plotKNN(xdata,ydata,xval,yval,num)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
hold on
[xs,ys] = getKNN(xdata,ydata,xval,yval,num);
gscatter(xs,ys)
xlim([0 6])
ylim([0 6])
plot(xval,yval,'-p',...
    'MarkerFaceColor','green',...
    'MarkerSize',15)
end


function [xs,ys] = getKNN(xdata,ydata,xval,yval,coor)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

X = [xval yval];
Q = [xdata ydata];
size(setdiff(xdata,xval)');
size(setdiff(ydata,yval)');
Y = [setdiff(xdata,xval,'stable')' setdiff(ydata,yval,'stable')']

Idx = knnsearch(Y,X,'K',coor);
m = Y(Idx,:);
xs = m(:,1)
ys = m(:,2)
end


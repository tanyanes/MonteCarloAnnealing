function [out] = scoreSFactor(xdata,ydata,xc,yc)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
qvalues = ones(36,1);
for i = 1:36
    [xda, yda] = getKNN(xdata,ydata,i,6);
    qvalues(i) = calcOrderPara(xc,yc,xda,yda);
end

norms = ones(36,1);
for i = 1:36
    norms(i,1) = norm(qvalues(i,1),2);
end
out = mean(norms);
end


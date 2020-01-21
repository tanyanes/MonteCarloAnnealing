function [qn] = calcOrderPara(xcent,ycent,xneigh,yneigh)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
q = 0;
r = 0;
theta = complex(0,0);
for i = 1:3
    r = sqrt((xneigh(i)-xcent)^2 + (yneigh(i)-ycent)^2);
    u = [(xneigh(i)-xcent) (yneigh(i)-ycent)];
    v = [1 0];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    theta = ThetaInDegrees*((2*pi)/180);
    q = q + exp(6i*theta);
end
qn = q/3;
end


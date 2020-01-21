function [r,theta] = Polar(x,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
r = sqrt(x^2 + y^2);
theta = atan(y/x);
end


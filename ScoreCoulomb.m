function [diff] = ScoreCoulomb(xdata,ydata,xbound,ybound,x,y,ex,ey,pos,T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    diff = (Coulomb(xdata,ydata,xbound,ybound,x,y,pos)-Coulomb(xdata,ydata,xbound,ybound,ex,ey,pos));

end


function [diff] = ScoreCoulomb(x,y,ex,ey,pos,T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    diff = (Coulomb(x,y,pos)-Coulomb(ex,ey,pos));

end


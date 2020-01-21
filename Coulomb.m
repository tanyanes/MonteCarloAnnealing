function [cumsum] = Coulomb(xdata,ydata,xbound,ybound,x,y,pos)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%xdata = [0.677,1.549,2.323,3.899,4.727,5.676,.877,1.986,2.823,3.805,...
%    4.808, 5.611,0.007, 1.161, 2.351, 3.483, 4.165, 5.005, 0.971,...
%    1.613, 2.593, 3.716, 4.519,5.659, 0.488, 1.343, 2.496, 3.101, 4.688,...
%    5.783,0.211,1.964,2.989,3.793,4.767,5.924];
%ydata = [5.228,5.372,5.683,5.627,5.112,5.294,3.263,2.715,4.427,4.032,...
%    4.368,4.329,3.376,3.271,3.386,3.340,3.074,3.187,2.207,2.552,2.224,...
%    2.101,2.159,2.612,1.399,1.238,1.068,1.673,1.368,1.522,0.31,0.199,...
%    0.034,0.448,0.087,0.286];
lx = length(xbound);
q = 1;
distance2 = 0;
cumsum = 0;
N=length(ydata);
k0=40.0;
k1=4.0;
minDist=0.2;
 for j = 1:N
        if j ~= pos
            distance2 = (x-xdata(j))^2 + (y -ydata(j))^2;
            if distance2 < minDist
               distance2 = minDist;
            end
            cumsum = cumsum + k0* (q^2)/distance2;
        end
 end
for i = 1:lx 
       distance2 = (x-xbound(j))^2 + (y -ybound(j))^2;
            if distance2 < minDist
               distance2 = minDist;     
            end
       cumsum = cumsum + k1*(q^2)/distance2;
end
 
end


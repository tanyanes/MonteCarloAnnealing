function [cx,cy] = makeHexagonalPack(xstat, ystat,xact,yact,iterations,T,stepsize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

subplot(1,2,1)
plot([xstat,xact],[ystat,yact],'o')
title("Initial Positions");
Temperature = T;
itLeft = iterations;
V = 0:0.01:2*pi;
N = 0:0.001:0.999;
TargDist=1.0;
while ((itLeft > 0))
%for i =  1:36
    a = 1;
    b =  length(yact);
    numgen = 1;
    i = int8((b-a).*rand(numgen,1) + a);
    %transform then perturb point under radial coordinates
    [r,theta] = Polar(xact(i),yact(i));
    rad_delta = stepsize;
    delta_theta = V(randi([1,numel(V)]));
    theta_delta = delta_theta;
    x_delta = rad_delta *cos(theta_delta);
    y_delta = rad_delta *sin(theta_delta);
    
    x_per = xact(i)+x_delta;
    y_per = yact(i)+y_delta;
    
    x_per;
    y_per;
    
    xdata=[xstat,xact];
    ydata=[ystat,yact];
    
    xactTemp = xact;
    yactTemp = yact;
    
    xactTemp(i) = x_per;
    yactTemp(i) = y_per;
    
    xdataTemp = [xstat,xactTemp];
    ydataTemp = [ystat,yactTemp];
    
    
    sold=abs(TargDist-ScoreKNN(xdata,ydata,xact(i),yact(i)));
    snew=abs(TargDist-ScoreKNN(xdataTemp,ydataTemp,x_per,y_per));
    
    soldV=abs(ScoreKNNVar(xdata,ydata,xact(i),yact(i)));
    snewV=abs(ScoreKNNVar(xdataTemp,ydataTemp,x_per,y_per));
    
    [xda, yda] = getKNN(xdata,ydata,xact(i),yact(i),3);
    soldS= abs(0.6 - norm(calcOrderPara(xact(i),yact(i),xda,yda),2));
     
    [xda, yda] = getKNN(xdataTemp,ydataTemp,x_per,y_per,3);
    snewS= abs(0.6 - norm(calcOrderPara(x_per,y_per,xda,yda),2));
    
    if ((sold > snew) && ((soldV +0.1)> snewV))
        xact(i) = x_per; 
        yact(i) = y_per;    
    %elseif ( N(randi([1,numel(N)])) > exp(snew/T))
    %   xact(i) = x_per ;
    %   yact(i) = y_per;
    end
    itLeft = itLeft - 1;
%end
end
cx = xact;
cy = yact;
subplot(1,2,2)
plot(xstat,ystat,'o')
hold on
plot(xact,yact,'o')
title("Final Positions");
end


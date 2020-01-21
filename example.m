clf

xdata = [0.677,1.549,2.323,3.899,4.727,5.676,.877,1.986,2.823,3.805,...
    4.808, 5.611,0.007, 1.161, 2.351, 3.483, 4.165, 5.005, 0.971,...
    1.613, 2.593, 3.716, 4.519,5.659, 0.488, 1.343, 2.496, 3.101, 4.688,...
    5.783,0.211,1.964,2.989,3.793,4.767,5.924];
ydata = [5.228,5.372,5.683,5.627,5.112,5.294,3.263,2.715,4.427,4.032,...
    4.368,4.329,3.376,3.271,3.386,3.340,3.074,3.187,2.207,2.552,2.224,...
    2.101,2.159,2.612,1.399,1.238,1.068,1.673,1.368,1.522,0.31,0.199,...
    0.034,0.448,0.087,0.286];

clf
%makeHexagonalPack(xdata, ydata,100,10)

xMill = [0.9299,1.7348,2.3195,3.2715,4.0411,5.0442,1.0647,2.2041,...
    3.0878,3.7323,4.6494,5.6035,0.1429,1.8232,2.7558,3.1621,4.1533,...
    5.0759,0.3908,1.4113,2.5982,3.5595,4.5491,5.5307,0.3462,1.3659,...
    2.4229,3.3866,4.3734,5.4542,0.6713,1.6325,2.5388,3.4866,4.4515,5.2814];
yMill = [4.2222,4.8336,5.6622,6.0062,5.3527,5.1505,3.2198,2.9088,...
    5.0285,4.0285,4.2791,4.2855,3.5297,3.8275,4.0898,3.1788,3.0748,...
    3.4058,2.5141,2.3090,1.9957,2.2640,2.1422,2.5493,1.5328,1.3483,...
    1.0186,1.2825,1.1478,1.5889,0.6076,0.4005,0.0290,0.2662,0.1362,0.6351];

%X = [4,2,-2,-4,-2,2]; 
%Y = [0,3.5,3.5,0,-3,-3.5];


%qvalue = calcOrderPara(0,0,X',Y')
%norm(qvalue,2)

xActive = [xMill(8)+.001, xMill(10)+0.5, xMill(11)+.6, xMill(16)+.005, xMill(15)+.01,...
    xMill(17)-.07, xMill(20)-.3, xMill(21)-.5, xMill(22)+.09, xMill(23)+.3,3];
yActive = [yMill(8)+.6, yMill(10)+.4, yMill(11)-.3, yMill(16)+.4, yMill(15)-.2,...
    yMill(17)+.005, yMill(20)-.4, yMill(21)+.2, yMill(22)-.005, yMill(23)-.5,3];

xStationary =  [0.9299,1.7348,2.3195,3.2715,4.0411,5.0442,1.0647,...
    3.0878,5.6035,0.1429,1.8232,...
    5.0759,0.3908,5.5307,0.3462,1.3659,...
    2.4229,3.3866,4.3734,5.4542,0.6713,1.6325,2.5388,3.4866,4.4515,5.2814,6];
yStationary = [4.2222,4.8336,5.6622,6.0062,5.3527,5.1505,3.2198,...
    5.0285,4.2855,3.5297,3.8275,...
    3.4058,2.5141,2.5493,1.5328,1.3483,...
    1.0186,1.2825,1.1478,1.5889,0.6076,0.4005,0.0290,0.2662,0.1362,0.6351,3.5];

%plot(xActive,yActive,'o')
%hold on
%plot(xStationary,yStationary,'o')

%[x_, y_] = makeHexagonalPack(xStationary,yStationary,xActive,yActive,100,10000,0.05);
%clf
%[x_2, y_2] = makeHexagonalPack(xStationary,yStationary,x_,y_,20000,100,0.005);

%totX = [x_2 xStationary];
%totY = [y_2 yStationary];

totX = xMill;
totY = yMill;
%% 
clf
triOrderList = ones(1,length(xMill));
for i = 1:(length(xMill))
    [xs,ys] = getKNN(totX,totY,totX(i),totY(i),3);
    triOrderList(1,i) = norm(calcOrderPara(totX(i),totY(i),xs,ys),2);
end
triOrderList;

coordinates = [totX' ,totY', triOrderList']

pointsize = 50;
scatter(totX', totY', pointsize, triOrderList','filled')
colormap spring
set(gca,'Color','k')
colorbar
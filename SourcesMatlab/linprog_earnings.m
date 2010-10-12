function [X,Y,NN] = linprog_earnings(propMinEarnings, propMaxEarnings, steps, F, infEqConstraints, infEqValues)

FetchData;
[ dummy, MaxEarnings ] = Comptable( );
minE = MaxEarnings*propMinEarnings;
maxE = MaxEarnings*propMaxEarnings;


X = zeros(1,steps);
Y = zeros(1,steps);
NN=zeros(steps,6);

Earnings=(V - ( (T * C' ./ 60)' + (A * Q) ));

%pour des benefices differents on cherche un equilibre entre les deux
%familles de produits
for i = 1:steps
    b = minE + i / steps * ( maxE - minE );
    
    [N,YTmp,exitFlag] = linprog(F, [infEqConstraints;-Earnings], [infEqValues;-b]);
    if exitFlag == 1
        X(i) = i / steps;
        Y(i) = YTmp;
        NN(i,:) = N;
    end
end

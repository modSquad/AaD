function [] = ResponsableCommercial()
%Summary of this function goes here
%   Detailed explanation goes here

FetchData();
[ OptProduction, MaxEarnings ] = Comptable( );
maxB = MaxEarnings;
minB = MaxEarnings*0.80;
steps=200;
X=zeros(steps);
Y1 = zeros(steps);
Y2 = zeros(steps);
Tmax = ones(7,1)*4800;

%contraintes
AA = [Q;T'];
B = [S';Tmax;0];

F=[ones(1,3) -ones(1,3)];

%on fixe le benefice sur une valeur et on commence a iterer
Aeq=[V - ( (T * C' ./ 60)' + (A * Q) )];
lb = zeros(6,1);
for i = 1:steps
    b = minB + i / steps * ( maxB - minB );
    X(i) = b;
    %F>0
    N1 = linprog([ones(1,3) -ones(1,3)], [AA;  ones(1,3) -ones(1,3)], B, Aeq, b, lb);
    Y1(i) = [ones(1,3) -ones(1,3)]*N1;
    %-F>0
    N2 = linprog([-ones(1,3) ones(1,3)], [AA;  -ones(1,3) +ones(1,3)], B, Aeq, b, lb);
    Y2(i) = [-ones(1,3) ones(1,3)]*N2;
end

plot(X,Y1,'Color',[1 0 0]);
plot(X,Y2,'Color',[0 1 0]);


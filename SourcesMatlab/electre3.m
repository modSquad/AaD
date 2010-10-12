function [C,D,S] = electre3 (J,w,s,v)
% J = m x n judgment matrix
% w = n weight

n = size(J,1); % alternatives
m = size(J,2); % indicators
e = 10 % scale

if (m ~= size(w))
    error('Size doesn`t match.');
end;
    
C = zeros(n);
D = zeros(n);

% EVALUATE AGREEMENT-DESAGREEMENT MATRICES
for i = 1:n
    for j = 1:n
        if (i ~= j)
            C(i,j) = sum( (J(i,:)>=J(j,:)).*w )/sum(w);
            D(i,j) = max(max(J(j,:)-J(i,:)),0)/e;
        end;
    end;
end;

% EVALUATE OUTCLASS MATRIX
S = ((C > s).*(D <= v));

% ASCENDING ORDER
% TODO

% DESCENDING ORDER
% TODO

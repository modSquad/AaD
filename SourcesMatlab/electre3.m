function [S,C,D] = electre3 (J,w,s,v)
% J = m x n judgment matrix
% w = n weight

n = size(J,1); % alternatives
m = size(J,2); % indicators
e = 10; % scale

graphname = 'graph.dot';

if (m ~= size(w))
    error('Size doesn`t match.');
end;
    
C = zeros(n);
D = zeros(n);

% APPLY NEW SCALE TO JUDGMENT MATRIX
for i = 1:m
    J(:,i) = ( (J(:,i) - (e/2)) * (w(i)/max(w))) + (e/2);
end;

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

% DRAW ORDER GRAPH
fid = fopen(graphname, 'w');
fprintf(fid, 'digraph G {\n');
[row, col] = find(S);
k = size(row,1);
for i = 1:k
    fprintf(fid, [char(64+row(i)), ' -> ', char(64+col(i)), ';\n']);
end;
fprintf(fid, '\n');
for i = 1:n
    fprintf(fid, [char(64+i), ';\n']);
end;
fprintf(fid, '}');
fclose(fid);
% ASCENDING ORDER
% TODO

% DESCENDING ORDER
% TODO

function [S1,S2,C,D] = electre3 (J,w,s1,s2,v)
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
S1 = ((C > s1).*(D <= v));
S2 = ((C > s2).*(D <= v));

% DRAW ORDER GRAPH
fid = fopen(graphname, 'w');
fprintf(fid, 'digraph G {\n');
[row1, col1] = find(S1);
[row2, col2] = find(S2);

for i = 1:n
    fprintf(fid, [char(64+i), ';\n']);
end;
fprintf(fid, '\n');

k = size(row1,1);
for i = 1:k
    fprintf(fid, [char(64+row1(i)), ' -> ', char(64+col1(i)), ';\n']);
end;
fprintf(fid, '\n');

k = size(row2,1);
for i = 1:k
    fprintf(fid, [char(64+row2(i)), ' -> ', char(64+col2(i)), '[style = "dashed"];\n']);
end;
fprintf(fid, '\n');

fprintf(fid, '}');
fclose(fid);
% ASCENDING ORDER
% TODO

% DESCENDING ORDER
% TODO

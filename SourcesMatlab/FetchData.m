%--------------------------------------------------
% RAW DATA
%--------------------------------------------------

% Indices - product mapping
a = 1;
b = 2;
c = 3;
d = 4;
e = 5;
f = 6;

Products = [a,  b,  c,  d,  e,  f];

% Manufacturing time per machine, for each product. (Table 1)
% Usage : T(a,2), T(d,7), ...
T = [
        8,  0,  8,  2,  5,  5,  5;
        15, 1,  1,  10, 0,  5,  3;
        0,  2,  11, 5,  0,  3,  5;
        5,  15, 0,  4,  0,  12, 8;
        0,  7,  10, 13, 10, 8,  0;
        10, 12, 25, 7,  25, 0,  0
    ];

% Quantity of raw material needed for each product
% Usage : Q(1,a), Q(3,f), ...
Q = [
        1,  2,  1,  5,  0,  2;
        2,  2,  1,  0,  2,  1;
        1,  0,  3,  2,  2,  0
    ];

% Maximum stock of raw material
% Usage : S(1), S(2), ...
S = [
        350,    620,    485
    ];

% Sale price of each product
% Usage : V(a), V(f), ...
V = [
        20, 27, 26, 30, 45, 40
    ];

% Cost of each raw material
% Usage : A(1), A(2), ...
A = [
        3,  4,  2
    ];

% TODO
% Usage : C(1), C(4), ...
C = [
        2,  2,  1,  1,  2,  3,  1
    ];

% TODO
% Usage : J(a,2)
J = [
        6,  5,  5,  5;
        5,  2,  6,  7;
        3,  4,  7,  3;
        3,  7,  5,  4;
        5,  4,  3,  9;
        2,  5,  7,  3;
        5,  4,  2,  9;
        3,  5,  7,  4
    ];

% Weight of each factor.
% Usage : P(1), P(2), ...
P = [
        1.2, 1.2, 0.8, 0.8
    ];

%--------------------------------------------------
% BASE CONSTRAINTS
%--------------------------------------------------

InfEqConstraints = zeros(16,6);
InfEqValues = zeros(16,1);
OffSet = 0;

% Quantity of products must be >= 0
for i = Products,
    InfEqConstraints(i+OffSet,i) = -1;
    InfEqValues(i+OffSet) = 0;
end
OffSet = OffSet + 6;

% Work time is limited
for i = 1:7,
   for j = Products,
       InfEqConstraints(i+OffSet,j) = T(j,i);
   end
   InfEqValues(i+OffSet) = 2*8*60*5;
end
OffSet = OffSet + 7;

% We have limited stocks of raw material
for i = 1:3,
   for j = Products,
       InfEqConstraints(i+OffSet,j) = Q(i,j);
   end
   InfEqValues(i+OffSet) = S(i);
end
OffSet = OffSet + 3;

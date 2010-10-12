function [ OptProduction, MinStocks ] = Stock()

FetchData;

% Matrix corresponding to the stocks variation
Stocks = ones(size(Q, 2), 1) *  (eye(size(Q)) - Q)

% Optimization
% prealloc
OptProduction = zeros(size(Stocks, 2), 1)
OptProduction = linprog(Stocks, InfEqConstraints, InfEqValues)

% Effective stocks
MinStocks = Stocks * OptProduction

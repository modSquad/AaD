function [ OptProduction, MinStocks ] = Stock()

FetchData;

% Matrix corresponding to the earnings
% Stocks = (??)

% Optimization
% prealloc
OptProduction = zeros(size(Stocks, 2), 1)
OptProduction = linprog(Stocks, InfEqConstraints, InfEqValues)

% Effective stocks
% MinStocks = ...

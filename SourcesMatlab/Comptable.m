function [ N ] = Comptable( )
%COMPTABLE Summary of this function goes here
%   Detailed explanation goes here

FetchData();

% This is the matrix corresponding to the earnings function
Earnings = (V - ( (T * C' ./ 60)' + (A * Q) ))

% We'll try to maximize the function, so we minimize the opposite
Earnings = -Earnings;

% Optimisation
N = linprog(Earnings, InfEqConstraints, InfEqValues);
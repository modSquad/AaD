function [ N ] = Comptable( )

FetchData();

% This is the matrix corresponding to the earnings function
Products = [1; 1; 1; 1; 1; 1];
			
% We'll try to maximize the function, so we minimize the opposite
Products = -Products;
			
% Optimisation
N = linprog(Products, InfEqConstraints, InfEqValues);
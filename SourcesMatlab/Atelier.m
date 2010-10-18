function [ N ] = Atelier( )

FetchData;

% This is the matrix corresponding to the earnings function
Units = [1; 1; 1; 1; 1; 1];
			
% We'll try to maximize the function, so we minimize the opposite
Units = -Units;
			
% Optimisation
N = linprog(Units, InfEqConstraints, InfEqValues);

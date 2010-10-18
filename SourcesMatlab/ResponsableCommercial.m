function [X1,Y1,NN1,X2,Y2,NN2] = ResponsableCommercial()
% Minimise la difference de production entre les familles des produits {A,B,C} et {D,E,F}
% pour toutes les valeurs possibles du benefice

%Prise en compte des constraintes generales
FetchData; 

%La precision des iterations
steps=200;

%La fonction qu'on veut etudier et qui modelise la difference de production
%entre les deux familles des produits
F=[ones(1,3) -ones(1,3)];

%On approche F et -F de 0 et on cherche les minimums.
[X1,Y1,NN1]=linprog_earnings(0,1,steps,F,[InfEqConstraints;-F],[InfEqValues;0]);
[X2,Y2,NN2]=linprog_earnings(0,1,steps,-F,[InfEqConstraints;F],[InfEqValues;0]);

%Les valeurs obtenus pour F
Y1 = abs(Y1);
%Les valeurs obtenus pour -F
Y2 = abs(Y2);

%On construit le graphe des deux fonctions pour trouver la meilleure
%solution.
close;
hold on;
plot(X1,Y1,'Color',[1 0 0]);
plot(X2,Y2,'Color',[0 1 0]);
xlabel('Benefice minimum impose (exprime par rapport au benefice maximum)');
ylabel('Ecart optimal de quantite produite entre les deux familles');
hold off;


end

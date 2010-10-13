function [X,Y,NN] = ResponsableStocks()
%Minimise le stock de produits
% Minimise le stock de produits pour toutes les valeurs possibles du
% bénéfice

FetchData;

Stock = (ones(1,3) * Q) + ones(1,6);
steps = 200;

[X,Y,NN]=linprog_earnings(0,1,steps,Stock,InfEqConstraints,InfEqValues);

close;
hold on;
plot(X,Y,'Color',[1 0 0]);
xlabel('Bénéfice minimum imposé (exprimé par rapport au bénéfice maximum)');
ylabel('Quantité de produits & matières premières en stock optimale');
hold off;

end

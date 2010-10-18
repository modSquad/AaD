function result = get_remaining_stock(produits)
% Quantite de matiere premiere par produit :
MatPremParProduit = [
 1  2   1   5   0   2
 2  2   1   0   2   1
 1  0   3   2   2   0
];
%Quantite max de matiere premiere par produit
MatPremMax = [
    350 620 485
];

produits

result = MatPremMax - produits * MatPremParProduit';

end

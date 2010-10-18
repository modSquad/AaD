function result = get_remaining_stock(produits)
% Quantité de matière première par produit :
MatPremParProduit = [
 1  2   1   5   0   2
 2  2   1   0   2   1
 1  0   3   2   2   0
];

%Quantité max de matière première par produit
MatPremMax = [350 620 485];

result = MatPremParProduit * produits;

end
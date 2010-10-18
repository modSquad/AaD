function [ optimized ] = OptimisationPartie2( inputs )
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

    result = ones(100,4);

    stock = MatPremMax - (inputs' * MatPremParProduit');
    
    % Pour chaque iteration, on enleve un produit de la famille 1, et 
    % on rajoute un produit de type E si on a les matieres premieres pour.
    % A chaque fois, on recalcule les metriques.
    for a=1:1:100
        if stock(1,1) > MatPremParProduit(1,3)
            if stock(1,2) > MatPremParProduit(2,3)
                if stock(1,3) > MatPremParProduit(3,3)
                    % On ajoute un element au stock : il n'est plus
                    % fabrique
                    stock = stock + MatPremParProduit(1:3,3)';
                    % On le retire en quantite
                    inputs(3,1) = inputs(3,1) - 1;
                end
            end
        end
         if stock(1,1) > MatPremParProduit(1,5)
            if stock(1,2) > MatPremParProduit(2,5)
                if stock(1,3) > MatPremParProduit(3,5)
                    % On fabrique un nouvel element : on me retire
                    % du stock
                    stock = stock - MatPremParProduit(1:3,5)';
                    % On l'ajoute en quantite
                    inputs(5,1) = inputs(5,1) + 1;
                end
            end
         end
         % On recalcule les metriques
        result(a,1:4) = compute_satisfaction(inputs);
        %inputs'
        %stock'
    end
    
    result
    %stock'
    
end




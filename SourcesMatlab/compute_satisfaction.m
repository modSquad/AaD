function result = compute_satisfaction(inputs)

% Prix unitaires des produits
PuProduits = [20
              27
              26
              30
              45
              40];

    % Qtt max comptable
    QttProdMaxComptable = [0 
                           20.4082
                           0
                           0
                           242.5
                           94.1837];
    % Qtt max atelier
    QttProdMaxAtelier = [0
                          56.732
                          38.6928
                          0
                          182.4608
                          98.9216];

    % Qtt max commercial
    QttProduitEquilibre = [0.888810041865781 
                           114.910246268340
                           60.2321120650158
                           0.253790723745169
                           148.743054004414
                           27.0343236470630];

    % Qtt max stocks
    QttMaxStock = [1.91903382074088e-10 
                   2.63753463514149e-10
                   1.89174897968769e-10
                   1.23691279441118e-10
                   124.634235411818
                   142.146305832495];
               
    result = zeros(1,4);
    
    result(1,1) = (sum((inputs .* PuProduits)) / sum((QttProdMaxComptable .* PuProduits))) * 100;
    result(1,2) = (sum(inputs) / sum(QttProdMaxAtelier)) * 100;
    result(1,3) = compute_stock(inputs);
    result(1,4) = (1-abs(sum(inputs(1:3))-sum(inputs(4:6)))/sum(inputs)) * 100;
end
result = ones(4);

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
QttProduitEquilibre = [0.8888
                       114.9102
                       60.2321
                       0.2537
                       148.7430
                       27.0343];


% Qtt max stocks
QttMaxStock = [1.91903382074088e-10 
               2.63753463514149e-10
               1.89174897968769e-10
               1.23691279441118e-10
               124.634235411818
               142.146305832495];

result(1,1:4) = compute_satisfaction(QttProdMaxComptable);
result(2,1:4) = compute_satisfaction(QttProdMaxAtelier);
result(3,1:4) = compute_satisfaction(QttMaxStock);
result(4,1:4) = compute_satisfaction(QttProduitEquilibre);


result
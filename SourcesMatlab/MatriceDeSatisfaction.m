% Matrice de resultats
Resultat = eye(4) * 100;
% Prix unitaires des produits.
PuProduit = [20,27,26,30,45,40];
% Quantité de produits maximales, quand l'atelier est statisfait à 100%
QttProdMax = [0 56.732 38.6928 0 182.4608 98.9216];

%% Solution du comptable par rapport aux autres responsables.
QttProd = [0,20.4082, 0,0,242.5,94.1837];
BeneficeMax = QttProd * PuProduit';
S = sum(QttProd);

% Atelier
NbProduitMax = sum(QttProd);
Resultat(1,2) = (NbProduitMax / sum(QttProdMax)) * 100;
% Stock
Resultat(1,3) = compute_stock(S);
% Commercial
Resultat(1,4) = (1 - abs(sum(QttProd(1:3)) - sum(QttProd(4:6))) / S) * 100;

%% Solution du responsable d'atelier par rapport aux autres responsables.


% Comptable
BeneficeCom = QttProdMax * PuProduit';
Resultat(2,1) = (BeneficeCom / BeneficeMax) * 100;
% StockCom / BeneficeMax) * 100;
% Stock
Resultat(2,3) = compute_stock(sum(QttProdMax));
% Commercial
Resultat(2,4) = (1 - abs(sum(QttProdMax(1:3)) - sum(QttProdMax(4:6))) / S) * 100;

%% Solution du responsable des stocks par rapport aux autres responsables.
QttProdMaxStock = [1.91903382074088e-10 2.63753463514149e-10 1.89174897968769e-10 1.23691279441118e-10 124.634235411818 142.146305832495];
% Comptable
BeneficeStock = QttProdMaxStock * PuProduit';
Resultat(3,1) = (BeneficeStock / BeneficeMax) * 100;
% Atelier
Resultat(3,2) = (sum(QttProdMaxStock) / sum(QttProdMax)) * 100;
% Commercial
Resultat(3,4) = (1 - abs(sum(QttProdMaxStock(1:3)) - sum(QttProdMaxStock(4:6))) / S) * 100;


%% Solution du responsable commercial par rapport aux autres responsables.
QttProduitEquilibre = [0.888810041865781 114.910246268340 60.2321120650158 0.253790723745169 148.743054004414 27.0343236470630];
% Comptable
Resultat(4,1) = ((QttProduitEquilibre * PuProduit') / BeneficeMax) * 100;
% Atelier
Resultat(4,2) = (sum(QttProduitEquilibre) / sum(QttProdMax)) * 100;
% Stock
Resultat(4,3) = compute_stock(sum(QttProduitEquilibre));

%% affichage resultat
Resultat
Moyennes = [mean(Resultat(1,1:4)),mean(Resultat(2,1:4)),mean(Resultat(3,1:4)), mean(Resultat(4,1:4))];
Moyennes

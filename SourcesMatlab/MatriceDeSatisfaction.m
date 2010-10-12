% Matrice de resultats
Resultat = eye(4) * 100;
% Prix unitaires des produits.
PuProduit = [20,27,26,30,45,40];

%% Solution du comptable par rapport aux autres responsables.
QttProd = [0,20.4082, 0,0,242.5,94.1837];
BeneficeMax = QttProd * PuProduit';
S = sum(QttProd);

% Atelier
QttProduits = [1,2,3,4,5,6];
NbProduitMax = sum(QttProduits);

% Stock

% Commercial
Resultat(1,4) = (1 - abs(sum(QttProd(1:3)) - sum(QttProd(4:6))) / S) * 100;

%% Solution du responsable d'atelier par rapport aux autres responsables.
QttProdMax = [1,2,3,4,5,6];
% Comptable
BeneficeCom = QttProdMax * PuProduit';
Resultat(2,1) = (BeneficeCom / BeneficeMax) * 100;
% Stock

% Commercial
Resultat(2,4) = (1 - abs(sum(QttProdMax(1:3)) - sum(QttProdMax(4:6))) / S) * 100;

%% Solution du responsable des stocks par rapport aux autres responsables.
QttProdMaxStock = [1,2,3,4,5,6];
% Comptable
BeneficeStock = QttProdMaxStock * PuProduit';
Resultat(3,1) = (BeneficeStock / BeneficeMax) * 100;
% Atelier
Resultat(3,2) = (sum(QttProdMaxStock) / NbProduitMax) * 100;
% Commercial
Resultat(3,4) = (1 - abs(sum(QttProdMaxStock(1:3)) - sum(QttProdMaxStock(4:6))) / S) * 100;


%% Solution du responsable commercial par rapport aux autres responsables.
QttProduitEquilibre = [0.888810041865781 114.910246268340 60.2321120650158 0.253790723745169 148.743054004414 27.0343236470630];
% Comptable
Resultat(4,1) = ((QttProduitEquilibre * PuProduit') / BeneficeMax) * 100;
% Atelier
Resultat(4,2) = (sum(QttProduitEquilibre) / NbProduitMax) * 100;
% Stock


%% affichage resultat
Resultat
Moyennes = [mean(Resultat(1,1:4)),mean(Resultat(2,1:4)),mean(Resultat(3,1:4)), mean(Resultat(4,1:4))];
Moyennes

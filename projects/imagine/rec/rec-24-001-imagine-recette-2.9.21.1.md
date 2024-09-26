# Imagine - Recette MOE
L'objectif est de voir si les développements réalisés dans le cadre de la refonte allegro ont des impacts sur Imagine

## Retours de recette MOE

### Lignes de plan
- Le dictionnaire thématique n'est pas appliqué alors que l'option du programme est bien présente
- Erreur lors de la duplication d'une ligne de plan (violation de contrainte unique (SIH2_ADAGIO_DBA_SUMARIS_MAP.M_PMFM_STRATEGY_PK))
- Erreur lors de la création d'un échantillonnage depuis le tableau des lignes de plan (Variable 'id' has an invalid value: Variable 'id' has coerced Null value for NonNull type 'Int!')

### Lignes de plan > Ligne de plan
- Les listes déroulantes des pmfm sortent de l'écran
- A VERIFIER : EOTP, mettre le fichier de properties à jour avec les éléments dédiés :

sumaris.analyticReferences.enable=true
sumaris.analyticReferences.service.url=https://sap.ifremer.fr/sap/opu/odata/sap/ZUI5_WS_EOTP_SRV/EotpSet/?$format=json&saml2=disabled
sumaris.analyticReferences.service.auth=ws_eotp:peindrions-rhizostome-somnolants
sumaris.analyticReferences.service.filter=.*-MS

### Sorties > Sortie
- Erreur lors de la création d'une sortie OBSBIO si aucun filtre n'est appliqué sur le tableau des sorties (Form errors -> measurementValues.__typename (required)) (#728)

### Echantillonnages
- La colonne "Ligne de plan" n'est pas systématiquement présente sur l'onglet "échantillonnage"
- A VERIFIER : s'il n'y a pas de filtre sur le programme, est-ce que le filtre ligne de plan a les valeurs vide et "refonte" ?

### Sorties > Echantillonnages
- Sortie : le champ ne doit pas être affiché lors de la création d'un échantillonnage depuis une sortie
- Zones de pêche : filtre des éléments déjà saisis abscent et obligation de saisir 2 caractères avant de lancer la recherche
- Encart plan d'échantillonnage : doit contenir les zones de pêche et l'espèce

### Sorties > Echantillonnages > Mesures individuelles
- Le compactage des lignes ne fonctionne pas
- Bug d'affichage sur certains pmfm : il y a autant de colonnes pour le pmfm qu'il y a d'individus dans l'échantillonnage (sortie Capbreton - 06/03/2024 - ligne de plan 24DICELAB401 - 777686)
- Liste déroulante : les valeurs ne sont plus tronquées et peuvent être affichées sur plusieurs lignes

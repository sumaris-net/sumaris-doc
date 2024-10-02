# Imagine - Recette MOE
L'objectif est de voir si les développements réalisés dans le cadre de la refonte allegro ont des impacts sur Imagine

## Retours de recette MOE

### Lignes de plan
- [ ] Le dictionnaire thématique n'est pas appliqué alors que l'option du programme est bien présente
- [ ] Erreur lors de la duplication d'une ligne de plan (violation de contrainte unique (SIH2_ADAGIO_DBA_SUMARIS_MAP.M_PMFM_STRATEGY_PK))
- [ ] Erreur lors de la création d'un échantillonnage depuis le tableau des lignes de plan (Variable 'id' has an invalid value: Variable 'id' has coerced Null value for NonNull type 'Int!')

### Lignes de plan > Ligne de plan
- [ ] Les touches "Supp" et "Delete" du clavier ne fonctionnent plus sur le code de la ligne de plan
- [ ] Les listes déroulantes des pmfm sortent de l'écran
  ![rec-imagine](/projects/imagine/rec/images/rec-24-001-2.9.21.1-LDP-listes_déroulantes_tronquées.PNG)


### Sorties > Sortie
- [ ] Erreur lors de la création d'une sortie OBSBIO si aucun filtre n'est appliqué sur le tableau des sorties (Form errors -> measurementValues.__typename (required)) (#728)

### Echantillonnages
- [ ] La colonne "Ligne de plan" n'est pas systématiquement présente sur l'onglet "échantillonnage"
- [ ] A VERIFIER : s'il n'y a pas de filtre sur le programme, est-ce que le filtre ligne de plan a les valeurs vide et "refonte" ?

### Sorties > Echantillonnages
- [ ] Sortie : le champ ne doit pas être affiché lors de la création d'un échantillonnage depuis une sortie
- [ ] Zones de pêche : filtre des éléments déjà saisis absent et obligation de saisir 2 caractères avant de lancer la recherche
- [ ] Encart plan d'échantillonnage : doit contenir les zones de pêche et l'espèce

### Sorties > Echantillonnages > Mesures individuelles
- [ ] Le compactage des lignes ne fonctionne pas
- [ ] Bug d'affichage sur certains pmfm : il y a autant de colonnes pour le pmfm qu'il y a d'individus dans l'échantillonnage (sortie Capbreton - 06/03/2024 - ligne de plan 24DICELAB401 - 777686)
  ![rec-imagine](/projects/imagine/rec/images/rec-24-001-2.9.21.1-MI_colonnes_dupliquées.PNG)

- [ ] Lors qu'une ligne a le focus, le placeholder ne s'affiche plus sur certains pmfm saisissables autre que taille et poids mais s'affiche sur des pmfm non saisissables
  ![rec-imagine](/projects/imagine/rec/images/rec-24-001-2.9.21.1-MI_placeholder.PNG)
- [ ] Liste déroulante : les valeurs ne sont plus tronquées et peuvent être affichées sur plusieurs lignes

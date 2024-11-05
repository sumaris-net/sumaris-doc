# Imagine - Recette MOE
L'objectif est de voir si les développements réalisés dans le cadre de la refonte allegro ont des impacts sur Imagine
URL utilisée : https://sumaris-app.isival.ifremer.fr/

## Retours de recette MOE

### Lignes de plan
- [ ] Le dictionnaire thématique n'est pas appliqué alors que l'option du programme est bien présente
- [ ] Le compteur de filtre est à 1, alors qu'aucun filtre n'est appliqué, même après suppression des filtres via l'icône dédié
- [ ] Le filtre sur la zone ne fonctionne pas : trop de lignes de plan sont présentes, alors qu'elles n'ont pas la zone indiquée dans le filtre - pas d'erreur
- [ ] Les filtres "Paramètres à mesurer" et "Efforts" ne fonctionnent pas : aucune incidence sur les lignes de plan présentes et compteur de filtres pas mis à jour
- [ ] Erreur lors de la duplication d'une ligne de plan (violation de contrainte unique (SIH2_ADAGIO_DBA_SUMARIS_MAP.M_PMFM_STRATEGY_PK)) (reproduit depuis l'environnement de préprod imagine)
- [ ] Erreur lors de la création d'un échantillonnage depuis le tableau des lignes de plan (Variable 'id' has an invalid value: Variable 'id' has coerced Null value for NonNull type 'Int!')

### Ligne de plan
- [ ] Erreur lors de la création d'une ligne de plan (violation de contrainte unique (SIH2_ADAGIO_DBA_SUMARIS_MAP.M_PMFM_STRATEGY_PK)) (l'erreur est uniquement présente depuis l'environnement sumaris de préprod - non reproduit depuis l'environement Imagine de préprod)

### Sorties > Echantillonnage
- [ ] Ligne de plan : le champ ne doit plus être modifiable lors qu'il y a des individus associés à l'échantillonnage
- [ ] Sortie : le champ ne doit pas être affiché lors de la création d'un échantillonnage depuis une sortie
- [ ] Zones de pêche : 
  - [ ] Remettre en place le filtre des éléments déjà saisis
  - [ ] Supprimer l'obligation de saisir 2 caractères avant de lancer la recherche
- [ ] Encart plan d'échantillonnage : doit contenir les zones de pêche et l'espèce au lieu de l'espèce et les pièces calcifiées

### Sorties > Echantillonnages > Mesures individuelles
- [ ] Le compactage des lignes ne fonctionne pas
- [ ] Liste déroulante : les valeurs ne sont plus tronquées et peuvent être affichées sur plusieurs lignes
- [ ] Impossibilité de saisir une mesure sur le pmfm "Poids déterminé par calcul - produit/lot - Calculé, méthode inconnue" (colone "Autre")
- [ ] Le comptage des individus ne fonctionne plus (reproduit depuis l'environnement de préprod imagine). Les impacts sont les suivants :
  - [ ] Sur le tableau des lignes de plan, les efforts réalisés ne sont pas mis à jour (même après vidage du cache)
  - [ ] Sur le formulaire ligne de plan, tous les champs sont modifiables
  - [ ] Sur le tableau des échantillonnages, le filtre "Ligne de plan" ne ramène pas les échantillonnages associés à la ligne de plan
  - [ ] Sur le formulaire échantillonnage, il est possible de créer des individus ayant le même code prélèvement sur plusieurs échantillonnages associés àla même ligne de plan. On peut donc avoir plusieurs individus avec le code 24ARGYREG251-0001
# Imagine - Recette MOE
L'objectif est de voir si les développements réalisés dans le cadre de la refonte allegro ont des impacts sur Imagine
URL utilisée : https://imagine-app-pp.isival.ifremer.fr/

## Retours de recette MOE

### Lignes de plan
- [ ] Le dictionnaire thématique n'est pas appliqué alors que l'option du programme est bien présente ("Dictionnaire thématique" = "Paramètres biologiques")
- [ ] Le filtre sur la zone ne fonctionne pas correctement : trop de lignes de plan sont présentes, alors qu'elles n'ont pas la zone indiquée dans le filtre - pas d'erreur
- [ ] Le filtre sur l'année ne fonctionne pas correctement (exemple lors du filtrage "Année début" = "2025", il y a des lignes de plan de 2024 qui remontent)
- [ ] Lors de la duplication d'une ligne de plan, la nouvelle ligne est correctement créée mais mal affichée dans le tableau des lignes de plan. Elle apparait comme "vide". Problème de rafraichissement ?
    ![ldp](/projects/imagine/rec/images/rec-25-001-2.9.30-LDP_bug_duplication.png)
- [ ] Erreur lors de la création d'un échantillonnage depuis le tableau des lignes de plan (Variable 'id' has an invalid value: Variable 'id' has coerced Null value for NonNull type 'Int!')
    ![ldp](/projects/imagine/rec/images/rec-25-001-2.9.30-LDP_bug_creation_ech.png)

### Sorties
- [ ] Le filtre sur le lieu de la sortie ne tient plus compte de l'option des paramètres systèmes "Référentiel > Niveau de lieu > Port" et affiche les ports et les criées
- [ ] Le filtre sur l'état ne devrait pas être présent (pas d'utilité, il n'est pas présent en prod)

### Sorties > Echantillonnages
- [ ] Le titre de l'onglet "Echantillonnage" n'est pas forcément visible alors que l'onglet est actif 
    ![ech](/projects/imagine/rec/images/rec-25-001-2.9.30-ECH_bug_affichage_onglet.png)
- [ ] Le filtre sur la ligne de plan n'a pas de restriction selon le programme les valeurs (on voit natamment la stratégie "Opus Activite" en début de liste). Reproduit en prod !
    ![ech](/projects/imagine/rec/images/rec-25-001-2.9.30-ECH_bug_filtre_LDP.png)
- [ ] Le filtre sur l'état ne devrait pas être présent (pas d'utilité, il n'est pas présent en prod)

### Sorties > Echantillonnage
- [ ] Sortie : le champ ne doit pas être affiché lors de la création d'un échantillonnage depuis une sortie
- [ ] Zones de pêche :
    - [ ] Remettre en place le filtre des éléments déjà saisis
    - [ ] Supprimer l'obligation de saisir 2 caractères avant de lancer la recherche
- [ ] Encart plan d'échantillonnage : doit contenir les zones de pêche et l'espèce au lieu de l'espèce et les pièces calcifiées

### Sorties > Echantillonnages > Mesures individuelles
- [ ] Liste déroulante : les valeurs ne sont plus tronquées et peuvent être affichées sur plusieurs lignes
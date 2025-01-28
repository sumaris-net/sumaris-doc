Liste des évolutions 2025

- https://forge.ifremer.fr/mantis/view.php?id=66130
  - Le modèle est "simplifié" dans Obsbio par rapport aux autres volets. Donc on peut mettre plusieurs métiers sur l'opération, mais on sera incapable de relier les observations à un métier en particulier
    puisque le lien se fait uniquement par opération.
    S'il fallait faire le lien il faudrait revoir la persistance pour Imagine. On a les tables pas besoin d'en créer, mais plusieurs possibilités pour les utiliser et arriver à rapprocher une observation d'une capture avec un métier
    Comme d'habitude, il faut se rapprocher d'eux et voir ce qu'ils veulent avoir comme info. Est-ce qu'ils veulent pouvoir associer des observations à un métier en particulier ?

- Améliorations de la 2.9

  - Socle technique :
    - Nouveau socle technique (Angular 18 - optimisation du chargement des composants graphiques - écrans plus rapides)
    - Possibilité de forcer le noeud par défaut
    - Gestion de la recherche des noeuds par programme de collecte (avec outil de recherche)
  - Améliorations de l'UX sur les tableaux :
    - Saisie dans les tableaux (par exemple dans l'échantillonnage) : la cellule éditée est surlignée sur les bords de la cellule, et non pas en plein milieu de la cellule
    - Possibilité de compacter les lignes (via menu "..." sur les tableaux). La valeur choisie est conservée en mémoire à l'ouverture suivante
  - Amélioration de l'UX des formulaires :
    - Nouveau look des composants, qui sont légèrement grisées, et mis en surbrillance lors du focus
    - Nouveau composant pour la saisie des heures (design légèrement revu)
    - Amélioration des combos avec autocompletion (correction de bug)
  - Autres améliorations d'UX :
    - Affichage de sous menu, au fur et à mesure de la navigation dans les écrans
    - Un sous-menu peut être épingler, pour faciliter la navigation (ces sous menus sont restaurés à la prochaine ouverture)
    - Possibilité de mettre une aide en ligne depuis les écrans de saisie (lien vers un PDF ou via du markdown dynamique). Les liens sont configurables dans les options de programme
  - Mode tablette :
    - Saisie sous tablette et téléphone Android ou iphone
  - Mode bureau :
    - Possibilité d'installer un client lourd (avec un installer .exe ou .deb)
  - Améliorations fonctionnelle :
    - Le tableau des SAMPLE (utilisé dans la page d'échantillonnage d'Imagine) peut gérer les photos (en attente d'une évolution coté POD, pour les sauvegarder en fichiers)
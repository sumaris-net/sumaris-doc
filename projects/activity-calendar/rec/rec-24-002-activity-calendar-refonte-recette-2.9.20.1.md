# Activity Calendar - Recette MOE/MOA

## Retours de recette MOE - release 2.9.20.1

### Arbre de navigation

- [ ] Plusieurs calendriers non épinglés peuvent s'afficher alors qu'il ne faudrait que le calendrier en cours
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Menu_gauche.PNG)
- [ ] Les calendriers épinglés restent épinglés même si on se connecte avec un autre utilisateur

### Gestion des droits

- [ ] Erreur lors de la consultation des calendriers avec un user qui n'est pas administrateur [#625](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/625)

### Calendriers d'activité

- ~~[ ] Enquête éco ? : La colonne est vide. Prévoir un script pour renseigner le flag sur les données historiques~~
- [ ] Enquêteur(s) : La colonne est vide. Implémenter la fonctionnalité

### Calendriers d'activité > Filtres

- [x] Programme de collecte : supprimer le filtre
- [ ] Année : 
  - [x] Dans la zone de filtres : supprimer le filtre (le filtre est déjà présent dans le bandeau)
  - [ ] Dans le bandeau : lors de la sélection d'une année, on voit apparaitre puis disparaitre une date du style "MON JAN 01 2024 00:00:00 GMT+0100" (exemple pour 2024)
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Filtres_année_bandeau.PNG)
- [ ] Navire : lors de la recherche par l'immat d'un navire qui a changé de nom, des fois c'est le nom actuel qui s'affiche, des fois c'est l'ancien
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Filtres_nav_noms.PNG)
- [ ] Etat & Niveau de qualité : lorsque l'état est "Qualifié", le champ "Etat" doit garder sa taille et le champ "Niveau de qualité" doit être sous le champ "Enquêteur"
- [ ] Objectif d'enquête directe ? & Enquête éco ? : 
  - [ ] Problème de focus : Impossible de sélectionner la valeur "Non" via le rond sans avoir préalablement sélectionner la valeur "Oui"
    (reproduis sur les radios button de l'onglet "Général" d'un calendrier)
  - [ ] Lors de l'utilisation des filtres, la colonne "Enquête éco ?" du tableau affiche les codes au lieu des libellés (COMMON.NO et COMMON.YES)

### Calendrier d'activité > Général

- [ ] Erreur lors de la consultation de certains calendriers (Exception while fetching data (/data) : null). Impact la prédoc de certains calendriers ne s'affiche pas. 
Exemple : 919025 - MAL JOJO année 2022 (calendrier) et 511079 - AR BREUR année 2022 (prédoc)

### Calendrier d'activité > Navire

- [ ] Caractéristiques navires : 
  - [ ] Certaines lignes ne sont pas fusionnées alors qu'elles auraient dû l'être (exemple 846740 - NARVAL année 2022)
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Carac_navire_fusion_lignes.PNG)
  - [x] Port d'exploitation : tronquer et mettre "..." lorsque le libellé ne tient pas sur 2 lignes
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Carac_navire_port_exploit.PNG)
- [ ] Immatriculations et armateur : Dans le tableau des immatriculations et des armateurs, s'il y a plus de 5 valeurs à afficher et que le 
nombre de lignes affichées est 5, alors les flèches de pagination sont grisées alors qu'elles devraient être actives. Les données les plus 
anciennes ne sont donc pas visibles. Si on modifie le nombre de lignes affichées avec une valeur plus élevée, l'ensemble des données est visible.
- [x] Armateur :
  - [x] Début d'activité : supprimer cette colonne car en base le champ est renseigné au 01/01/2010 ou vide
  - [x] Date de la retraite : masquer la colonne (vu avec Glenn le 19/08/24)
    - ~~[ ] En base, il y a des VESSEL_OWNER.RETIREMENT_DATE à 0001-01-01 00:00:00.000~~
    - ~~[ ] En base, il y a des VESSEL_OWNER.RETIREMENT_DATE à 0001-01-01 00:00:00.000 et un affichage dans l'ihm au 29/12/0001 (exemple 510764 - EMMA-LOAN année 2022)~~
![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Armateur_date_retraite.PNG)
- [x] Tooltip flèche pagination : modifier les libellés "First page" et "Last page" pour les mettre en français

### Calendrier d'activité > Calendrier

- [ ] Gestion des droits : en admin, le message "Vous n'êtes pas autorisé à saisir sur ce lieu" s'affiche alors que la saisie et la sauvegarde fonctionne (925409 - LA REVANCHE année 2022)
![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Calendrier_gestion_droits.PNG)
- [ ] Actif ? : 
  - [x] Enregistrement impossible après avoir passé le champ à "Inactif" sur des données (historiques ou non), la colonne reste en "pending"
  - [x] Message champ obligatoire incohérents sur les mois inactifs
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Calendrier_mois_inactif.PNG)
- [x] Lieu d'immatriculation : Sur certains calendriers, le lieu d'immatriculation ne s'affiche pas tout le temps ou est mal renseigné. Quand le lieu d'immatriculation est vide, tous les champs du calendrier sont grisés et la saisie est bloquée. Pas de cinématique
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Calendrier_lieu_immat.PNG)
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Calendrier_lieu_immat2.PNG)
- [ ] Métier : 
  - [ ] La liste déroulante affiche les x 1ère valeurs mais n'affiche pas les x valeurs suivantes lors du scroll vers le bas
  - [ ] Bloquer l'enregistrement lorsque le métier est en doublon sur un mois (actuellement il y a une erreur sur le mois et l'enregistrement génère une erreur oracle)
- [ ] Gradients : bloquer la saisie du gradient côte, profondeur et zone proche lorsque la zone de pêche n'est pas renseignée
- [ ] Copier/coller : 
  - [x] La zone copier peut être étendu lorsque le menu contextuel est affiché. Pour reproduire : sélectionner une cellule, faire clic droit > copier, sur la même cellule refaire clic droit et déplacer la souris -> la zone bleue s'étend
  - [ ] Impossible de copier/coller un gradient côte seul 
  - [ ] Bloquer l'action "Coller" et afficher le message "Vous ne pouvez pas coller ici" dans le champ "Actif ?" lorsque la valeur copiée est "Inexistant"
- [ ] Prédocumentation :
  - [ ] La case cocher "SACROIS-OBSDEB" n'est pas présente et la ligne source indique systématiquement "Enquête N-1"
  alors qu'il y a des données "Enquête N-1" et "SACROIS-OBSDEB" (exemple 669336 - TONIN année 2022)
![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Prédocumentation_sources.PNG)
  - [ ] La prédocumentation affiche les données des calendriers N-1 et N
  - [ ] Après avoir copié la prédocumentation vers le calendrier, l'icône "copier" conserve un halo bleu
- [ ] Erreur à l'enregistrement : 
  - [ ] Violation de contrainte unique (SIH2_ADAGIO_DBA.VESSEL_USE_FEAT_UNIQUE_KEY) SIH2_ADAGIO_DBA_SUMARIS_MAP.TR_VESSEL_USE_FEATURES. 
  Pour reproduire : sur un mois non renseigné (données historiques ou non), sélectionner une valeur dans le champ "Actif ?", enregistrer, sélectionner un port d'exploitation, enregistrer
  - [x] Impossible d'insérer NULL dans (SIH2_ADAGIO_DBA.GEAR_USE_FEATURES.START_DATE) SIH2_ADAGIO_DBA_SUMARIS_MAP.TR_GEAR_USE_FEATURES
  Pour reproduire : sur un mois inactif d'un calendrier (historique ou non), passer le mois à actif, rensiegner un métier, une zone et un gradient cote puis enregistrer


### Calendrier d'activité > Métiers

- [ ] Supprimer les cases à cocher qui n'ont pas d'utilité

### Calendrier d'activité > Formulaire terrain vierge

- [X] L'accès au rapport redirige vers la page d'accueil
- [ ] Renseigner les infos sur le navire (lieux d'immatriculation, immatriculation, nom)
- [x] Dans le tableau des métiers, ajouter 4 blocs métiers vides  
- [x] Ajouter le tableau des caractéristiques engins avec 5 colonnes pour les métiers et 2 lignes pour les PMFM. Mettre en dur les libellés 
"Plus petit maillage étiré en mm" et "Dimension" pour les PMFM

### Calendrier d'activité > Formulaire terrain avec données

- [x] Lieux d'immatriculation : Afficher plusieurs lieux d'immatriculation s'il y en a plusieurs sur l'année ? (exemple : 511079 - AR BREUR année 2022)
- [x] Port : Renommer "Port" en "Port d'exploitation" pour être conforme à l'ihm
- [x] Zone/Gradient : présence de 3 lignes "Zone/Gradient" pour le 1er métier (non systématique)
- [X] Qualification de l'enquête : pas de cases à cocher
- [X] Vente : pas de cases à cocher

![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Formulaire_terrain.PNG)

## Retours de recette MOA - release 2.9.20.1

Recette faite par Emilie Le Roy le 02/09/2024

Certains retours de recette MOA concernent des fonctionnalités pas encore implémentées dans la version recettable.

Il faudra rappeler ce point lors des prochaines recettes.


### Calendriers d'activité

- [X] Le bouton + pour ajouter un nouveau calendrier doit être enlevé
- [X] Filtrer l'année : par défaut "(VIDE)"
- [X] Absence de la fonctionnalité "Importer les calendriers vides"
  - _En 2.9.21_
- [X] L'année par défaut doit être l'année N-1 (actuellement c'est positionné à "Vide")
- [X] Il faut pouvoir trier sur les colonnes suivantes : Etat
  - _Modifier le cas d'usage (enlever l'année)_

### Calendrier d'activité > Navire

- [ ] Marquage extérieur > remplacer par immatriculation
- [X] Supprimer la colonne "date de la retraite"
- [ ] S'il y a plusieurs pages et que l'on affiche plus de lignes, ça ne change rien.
  - _Non reproduit_
- [ ] Pagination des tableaux : Parfois c'est le nombre d'éléments du tableau qui est indiqué dans le nombre de page. [Capture](/projects/activity-calendar/rec/images/rec-24-002-2.9.20.1-Pagination_problem.PNG)

### Calendrier d'activité > Calendrier

- [ ] Il faudrait que visuellement la première colonne soit mieux démarquée :
  - Reprendre le même coloris de fond que pour les cellules à saisir ?
  - Mettre les champs en gras de lieu d'immat à métier puis zone, gradient en non gras ?
- [ ] Décalage de la sélection d'une cellule. [Capture](/projects/activity-calendar/rec/images/rec-24-002-2.9.20.1-Calendrier_decalage_selection.PNG)
- [X] La saisie des jours de mer se fait souvent en partant de janvier puis jusqu'à dec. il faudrait pouvoir changer de cellule horizontalement par tabulation ou flèche droite et gauche sans devoir double-cliquer. Actuellement on ne peut pas saisir de façon fluide les jours de mer.
  - Issue [#698](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/698)
- [ ] Pas de possibilité de copier/coller la ligne de nombre de jours de mer vers la ligne de nombre de jours de pêche
- [ ] Pas de limite de jours de mer saisis
- [ ] A la sauvegarde, il n'y a pas de tri des métiers : 1 métier par ligne, comme dans l'allegro actuel. C'est à maintenir pour une meilleure visibilité.
  - _A creuser_
- [ ] Problème de copier/coller : faute de Français ("Vous DE pouvez pas coller ici")
- [ ] Le compteur de mois actif ne fonctionne pas
- [ ] Le dénombrement des métiers ne fonctionne pas. Il ne se met à jour que lorsque que l'on clique sur l'onglet métier.
  - _Non reproduit_
- [X] Erreur à la sauvegarde (Violation de contrainte d'unicité)

### Calendrier d'activité > Métiers
- [ ] Supprimer l'entête #
- [ ] Manque la saisie de la caractéristique Dimension pour les métiers. [Capture](/projects/activity-calendar/rec/images/rec-24-002-2.9.20.1-Metier_caracteristique_manquante.PNG)
- [ ] Problème du message "Vous n'êtes pas autorisé à saisir sur ce lieu d'immatriculation" 
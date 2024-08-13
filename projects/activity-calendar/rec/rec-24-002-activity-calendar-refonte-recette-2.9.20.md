# Activity Calendar - Recette MOE

## Retours de recette MOE

### Menu de gauche

- [ ] Plusieurs calendriers non épinglés peuvent s'afficher alors qu'il ne faudrait que le calendrier en cours
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Menu_gauche.PNG)

### Calendriers d'activité

- [ ] Enquête éco ? : La colonne est vide. Prévoir un script pour renseigner le flag sur les données historiques
- [ ] Enquêteur(s) : La colonne est vide. Renseigner la colonne

### Calendriers d'activité > Filtres

- [ ] Programme de collecte : supprimer le filtre
- [ ] Année : 
  - [ ] Dans la zone de filtres : supprimer le filtre (le filtre est déjà présent dans le bandeau)
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
- [ ] Armateurs :
  - [x] Début d'activité : supprimer cette colonne car en base le champ est renseigné au 01/01/2010 ou vide
  - [ ] Date de la retraite :
    - [ ] En base, il y a des VESSEL_OWNER.RETIREMENT_DATE à 0001-01-01 00:00:00.000
    - [ ] En base, il y a des VESSEL_OWNER.RETIREMENT_DATE à 0001-01-01 00:00:00.000 et un affichage dans l'ihm au 29/12/0001 (exemple 510764 - EMMA-LOAN année 2022)
![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Armateur_date_retraite.PNG)
- [ ] Tooltip flèche pagination : modifier les libellés "First page" et "Last page" pour les mettre en français

### Calendrier d'activité > Calendrier

- [ ] Gestion des droits : en admin, le message "Vous n'êtes pas autorisé à saisir sur ce lieu" s'affiche alors que la saisie et la sauvegarde fonctionne (925409 - LA REVANCHE année 2022)
![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Calendrier_gestion_droits.PNG)
- [ ] Actif ? : 
  - [x] Enregistrement impossible après avoir passé le champ à "Inactif" sur des données (historiques ou non), la colonne reste en "pending"
  - [x] Message champ obligatoire incohérents sur les mois inactifs
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Calendrier_mois_inactif.PNG)
- [ ] Lieu d'immatriculation : Sur certains calendriers, le lieu d'immatriculation ne s'affiche pas tout le temps ou est mal renseigné. Quand le lieu d'immatriculation est vide, tous les champs du calendrier sont grisés et la saisie est bloquée. Pas de cinématique
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Calendrier_lieu_immat.PNG)
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Calendrier_lieu_immat2.PNG)
- [ ] Métier : 
  - [ ] La liste déroulante affiche les x 1ère valeurs mais n'affiche pas les x valeurs suivantes lors du scroll vers le bas
  - [ ] Bloquer l'enregistrement lorsque le métier est en doublon sur un mois (actuellement il y a une erreur sur le mois et l'enregistrement génère une erreur oracle)
- [ ] Gradients : bloquer la saisie du gradient côte, profondeur et zone proche lorsque la zone de pêche n'est pas renseignée
- [ ] Copier/coller : 
  - [ ] La zone copier peut être étendu lorsque le menu contextuel est affiché. Pour reproduire : sélectionner une cellule, faire clic droit > copier, sur la même cellule refaire clic droit et déplacer la souris -> la zone bleue s'étend
  - [ ] Impossible de copier/coller un gradient côte seul 
- [ ] Prédocumentation :
  - [ ] La case cocher "SACROIS-OBSDEB" n'est pas présente et la ligne source indique systématiquement "Enquête N-1"
  alors qu'il y a des données "Enquête N-1" et "SACROIS-OBSDEB" (exemple 669336 - TONIN année 2022)
![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Prédocumentation_sources.PNG)
  - [ ] La saisie du calendrier impacte les données présentes dans la prédocumentation
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

### Calendrier d'activité > Formulaire terrain avec données

- [x] Lieux d'immatriculation : Afficher plusieurs lieux d'immatriculation s'il y en a plusieurs sur l'année ? (exemple : 511079 - AR BREUR année 2022)
- [x] Port : Renommer "Port" en "Port d'exploitation" pour être conforme à l'ihm
- [ ] Zone/Gradient : présence de 3 lignes "Zone/Gradient" pour le 1er métier (non systématique)
- [X] Qualification de l'enquête : pas de cases à cocher
- [X] Vente : pas de cases à cocher

![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Formulaire_terrain.PNG)
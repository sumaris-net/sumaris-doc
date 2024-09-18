# Activity Calendar - Recette MOE

## Retours de recette MOE

### Gestion des droits

- [ ] Erreur "opérateur relationnel non valide" lors de l'affichage du tableau des calendriers avec tstq2

### Calendriers d'activité

- [ ] Erreur de chargement des données lors du filtrage (lieu d'immat, port d'exploit, enquêteur ...) et du tri sur la colonne Navire
- [ ] Erreur lors de la consultation de certains calendriers (Exception while fetching data (/data) : null). Impact la prédoc de certains calendriers ne s'affiche pas.
  Exemple : 3224068 - BELLE VUE - année 2022 [#689](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/689)
- [ ] Erreur oracle lors de la suppression d'un calendrier "Impossible d'effectuer une suppression à partir de la vue sans exactement une table protégée par clé"

### Calendriers d'activité > Filtres

- [ ] Année : Lors de la consultation d'un écran autre que le tableau de consultation des calendriers puis de ce tableau, le tableau ne ramène plus aucun résultat, en modifiant le filtre "Année", les résultats apparaissent de nouveau
- [ ] Navire : lors de la recherche par l'immat d'un navire qui a changé de nom, des fois c'est le nom actuel qui s'affiche, des fois c'est l'ancien
- [ ] Enregistrement des filtres : composant peu visible en noir

### Calendrier d'activité > Général

- [ ] Warning qualification : affichage du warning "Qualification xxx incohérente avec l'objectif" si l'objectif d'enquête directe est à "oui" et la qualification de l'enquête est "Directe" alors qu'il ne devrait pas s'afficher
- [ ] Warning inactivité annuelle : Afficher un warning si au moins un mois est actif et valeur est "oui"

### Calendrier d'activité > Navire

- [ ] Caractéristiques navires : Certaines lignes ne sont pas fusionnées alors qu'elles auraient dû l'être (exemple 846740 - NARVAL année 2022)
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Carac_navire_fusion_lignes.PNG)

### Calendrier d'activité > Calendrier

- [ ] Gestion des droits : en admin, le message "Vous n'êtes pas autorisé à saisir sur ce lieu" s'affiche alors que la saisie et la sauvegarde fonctionne
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Calendrier_gestion_droits.PNG)
- [ ] Actif ? : lors du passage de actif à inactif puis inactif à actif sans enregistrer, les nb de jours en mer, nb de jours de pêche et nb de personnes à bord sont perdus alors que les métiers, zones et gradients sont conservés
- [ ] Lieu d'immatriculation : Lorsque de la modification d'un calendrier puis de la reconsultation de celui-ci, le lieu d'immatriculation n'est plus présent, tous les champs du calendrier sont grisés et la saisie est bloquée
- [ ] Métier : 
  - [ ] La liste déroulante affiche les x 1ères valeurs mais n'affiche pas les x valeurs suivantes lors du scroll vers le bas
  - [ ] Le message pour indiquer qu'un métier est en doublon sur un mois ne s'affiche que quand le mois a le focus et ne bloque pas l'enregistrement
- [ ] Gradients : bloquer la saisie du gradient côte, profondeur et zone proche lorsque la zone de pêche n'est pas renseignée
- [ ] Prédocumentation :
  - [ ] La prédocumentation affiche les données des calendriers N-1 et N
  - [ ] Après avoir copié la prédocumentation vers le calendrier, l'icône "copier" conserve un halo bleu
- [ ] Copier/coller : Bloquer l'action "Coller" et afficher le message "Vous ne pouvez pas coller ici" dans le champ "Actif ?" lorsque la valeur copiée est "Inexistant" [#687](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/687)
- [ ] Raccourcis clavier : 
  - [ ] Lorsqu'une cellule a le focus, l'utilisation de la flèche bas, met le focus sur la cellule en-dessous mais décale l'ensemble du tableau vers le bas
  - [ ] Lors de l'utilisation des flèches pour se déplacer puis de la touche "Entrée" pour entrer en édition, ce n'est pas la cellule qui a le focus qui entre en édition mais la dernière cellule cliquée
- [ ] Violation de contrainte unique à l'enregistrement (SIH2_ADAGIO_DBA.VESSEL_USE_FEAT_UNIQUE_KEY) SIH2_ADAGIO_DBA_SUMARIS_MAP.TR_VESSEL_USE_FEATURES.
  Pour reproduire : sur un mois non renseigné (données historiques ou non), sélectionner une valeur dans le champ "Actif ?", enregistrer, sélectionner un port d'exploitation, enregistrer

### Calendrier d'activité > Métiers

- [ ] Supprimer les cases à cocher qui n'ont pas d'utilité [#704](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/704)

### Calendrier d'activité > Formulaire terrain vierge [#696](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/696)

- [ ] Qualification de l'enquête : 
  - [ ] Afficher uniquement les qualitatives values avec STATUS_FK = 1 (ce qui permet de ne plus afficher les "Recopie 2021" et "Recopie 2022")
  - [ ] Trier les qualitatives values selon l'ordre alphabétique (pour être conforme au formulaire de saisie)
- [ ] Vente : Trier les qualitatives values selon l'ordre alphabétique (pour être conforme au formulaire de saisie)

### Calendrier d'activité > Formulaire terrain avec données

- [ ] Le titre présent dans le bandeau ne tient pas compte de l'option "Liste déroulante > Navires" des préférences utilisateurs
- [ ] Afficher les pmfm liés aux niveaux d'acquisition ACTIVITY_CALENDAR_GEAR_PHYSICAL_FEATURES et ACTIVITY_CALENDAR_GEAR_USE_FEATURES

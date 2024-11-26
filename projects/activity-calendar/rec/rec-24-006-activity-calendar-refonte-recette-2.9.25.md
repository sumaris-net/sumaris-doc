# Activity Calendar - Recette MOE/MOA


## Question à la MOA

- Issue [746](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/746)
  - Faut il pouvoir filtrer sur des saisisseurs inactifs ?
  - POC à proposer : 
    - Ajout d'un bouton icône sur le champ qui permet d'activer l'affichage des observateurs/saisisseurs inactifs (status_fk=0)
    - Afficher l'état actif/inactif sur les saisisseurs dans le filtre
- Doit-on pouvoir générer un formulaire vierge pour une année autre que l'année courante ? 
   si non, il y a un correction à faire sur le lieu d'immat pour afficher uniquement celui ou ceux de l'année courante (exemple : 252740 LA NOUNOUTE)

## Retours de recette MOE - release 2.9.25

### Gestion des droits

- [ ] Un responsable de programme doit pouvoir : importer des calendriers vides et supprimer un calendrier. Actuellement ces actions sont soient grisées soient absentes

### Calendriers d'activité > Filtres

- [ ] Bug d'affichage des liste déroulantes des filtres [#817](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/817)
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-006-2.9.24-Bug_affichage_listes_filtres.gif)
- [ ] Port d'exploitation : problème de pagination suite à la correction du ticket [#809](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/809).
  Les doublons sont bien supprimés mais les calendriers ne sont pas répartis suivants le nb de lignes demandées, il y a donc moins de 20 calendriers affichés par page alors que le nb de lignes demandées est 20 [#829](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/829)
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-007-2.9.25-Bug_calendriers_par_page.PNG)
- [ ] Objectif d'enquête directe ? : ajouter un croix pour pouvoir supprimer la valeur "Non" lorsqu'elle est sélectionnée, comme c'est le cas pour les valeurs "Oui" et "Opportuniste"
- [ ] Navire : lors de la recherche par l'immat d'un navire qui a changé de nom, des fois c'est le nom actuel qui s'affiche, des fois c'est l'ancien [#639](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/639)
- [ ] Saisisseur/Observateur : les filtres ne remontent pas les utilisateurs ayant un PERSON.STATUS_FK = 0, exemple [#746](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/746)
  - PETIT Oceanne : n'apparait pas dans les filtres alors qu'elle est saisisseur de calendriers notamment sur 2022
  - LECROSNIER	Sandile : a 2 lignes dans la table PERSON. Le filtrage sur ce saisisseur en 2019,2020,2021 ne remonte aucun calendrier alors qu'elle est saisisseur de calendriers notamment sur ces années

### Calendriers d'activité > Import

- [ ] Toujours l'erreur du traitement qui tourne en boucle sans se terminer [#830](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/830)

### Calendriers d'activité > Calendrier

- [ ] Lors de la saisie d'un métier sur un mois (déjà déclaré pour d'autres mois), on a des lignes de métier qui se rajoutent dont la plupart sont vides (jusqu'à 9 métiers)
  - https://sumaris-app.isival.ifremer.fr/activity-calendar/3415834
  - _MOE_ : bug résolu dans develop (2.9.25.1)

- [ ] Lors du passage d'un mois de "Inactif" à "Actif", les champs "Nb de jours de mer", "Nb de jours de pêche", "Nb de personnes à bord" ne sont saisissables qu'après la sélection d'un métier/pêche

- [X] ~~Sur des calendriers 2025, j'ai une prédocumentation vide (Enquête N-1)~~ Car le calendrier 2024 a été importé mais pas renseigné

- [X] Parfois on ne peut plus saisir les zones de pêches Quadrilatère FAO 1*1 et 5*5 (plus dans la liste)

- [ ] Cas d'un calendrier ou seuls les 1ers mois sont renseignés : lors du copier/coller d'une ligne vers une autre dans le cas ou le copier/coller est autorisé, 
tous les mois sont considérés comme modifiés et les mois non renseignés ont le warning "Actif ? Champ obligatoire"
- [ ] Le message "Doublon métier" affiche le code et non le libellé (_uniqueMetier_ affiché)

- [ ] Quand on n'est pas régionalisé, la liste des zone de pêche ramenée est trop grande : elle ne tient pas compte de l'option
  ![rec-activity-calendar-peche](/projects/activity-calendar/rec/images/rec-24-007-2.9.25-Bug_liste_zone_de_peche.png)


### Calendriers d'activité > Régionalisation 

- [ ] Gradient de côte, zone proche : pas cohérents avec Allegro, gradient de profondeur vide
  - MR pas encore faite [!339](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/merge_requests/339)

- [ ] Le copier/coller depuis un mois de la prédocumentation ne fonctionne pas

- [ ] Zone de compétence activée : Si on rafraichit (F5), il n'y a plus de zone de compétence appliquée (_Aucune zone de compétence_ sélectionnée)

- [ ] Problème de saisie : On peut ouvrir simultanément plusieurs listes déroulantes de valeurs [#831](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/831)  
      - On a aussi un bug sur une liste déroulante quand on enléve la régionalisation
  ![rec-activity-calendar-bug-edition](/projects/activity-calendar/rec/images/rrec-24-007-2.9.25-Bug_edition.gif)

### Calendrier d'activité > Rapport d'avancement

- [ ] Corriger la faute d'orthograhe : "gradient" (avec un "e" et pas un "a")
- [ ] Lorsqu'il y a le filtre "Objectif d'enquête directe ?" à la valeur "Opportuniste", c'est la valeur "Oui" qui s'affiche dans le filtre du rapport 
- [ ] Déplacer la date de génération du rapport pour afficher le pied de page sur une seule ligne
- [ ] Si le filtre sur l'année est vide, le rapport d'avancement s'affiche pour l'année N-1, au lieu des années indiquées dans le tableau de consultation
- [ ] S'il y a un filtre sur le QIM1, il faut prendre en compte les calendriers avec un navire qui a changé de QIM2 -> QIM1
     exemple avec le filtre QIM avec les valeurs "Le Harvre" et "Audierne" sur l'année 2022 : le tableau ramène 83 calendriers alors que le rapport d'avancement ramène 74 calendriers
     exemple de navires présents dans le tableau de consultation mais pas dans le rapport d'avancement : 252740 - LA NOUNOUTE, 389179 - NOTRE DAME DE GRACE, 517697 LE BEDOUIN, ...


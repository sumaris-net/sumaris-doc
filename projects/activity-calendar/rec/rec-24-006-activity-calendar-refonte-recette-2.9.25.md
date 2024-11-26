# Activity Calendar - Recette MOE/MOA


## Question à la MOA

- Issue [746](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/746)
  - Faut il pouvoir filtrer sur des saisisseurs inactifs ?
  - POC à proposer : 
    - Ajout d'un bouton icône sur le champ qui permet d'activer l'affichage des observateurs/saisisseurs inactifs (status_fk=0)
    - Afficher l'état actif/inactif sur les saisisseurs dans le filtre
- Doit-on pouvoir générer un formulaire vierge pour une année autre que l'année courante ?

## Retours de recette MOE - release 2.9.25

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

- [ ] Remarque : On est obligé de saisir une zone de pêche pour que la saisie des PMFMs quantitatifs (nbre de jours de mer/pêche/, nbre d'hommes à bord) soit active
  - Reproduit sur ce calendrier : https://sumaris-app.isival.ifremer.fr/activity-calendar/3336814
  - Comportement voulu ?

- [ ] Sur des calendriers 2025, j'ai une prédocumentation vide (Enquête N-1)

- [ ] Parfois on ne peut plus saisir les zones de pêches Quadrilatère FAO 1*1 et 5*5 (plus dans la liste)

- [ ] Problème de saisie : On peut ouvrir simultanément plusieurs listes déroulantes de valeurs

### Calendriers d'activité > Régionalisation 

- [ ] Gradient de profondeur vide
  - MR pas encore faite [!339](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/merge_requests/339)

- [ ] Le copier/coller depuis un mois de la prédocumentation ne fonctionne pas

### Calendrier d'activité > Rapport d'avancement

- [ ] Déplacer la date de génération du rapport pour afficher le pied de page sur une seule ligne


# Activity Calendar - Recette MOE/MOA


## Question à la MOA

- Issue [746](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/746)
  - Faut il pouvoir filtrer sur des saisisseurs inactifs ?
  - POC à proposer : 
    - Ajout d'un bouton icône sur le champ qui permet d'activer l'affichage des observateurs/saisisseurs inactifs (status_fk=0)
    - Afficher l'état actif/inactif sur les saisisseurs dans le filtre



## Retours de recette MOE - release 2.9.25


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


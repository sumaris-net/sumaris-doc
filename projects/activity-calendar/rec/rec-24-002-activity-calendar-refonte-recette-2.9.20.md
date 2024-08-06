# Activity Calendar - Recette MOE

## Retours de recette MOE

### Calendriers d'activité

- [ ] Enquête éco ? : La colonne est vide. Prévoir un script pour renseigner le flag sur les données historiques
- [ ] Enquêteur(s) : La colonne est vide. Renseigner la colonne

### Calendriers d'activité > Filtres

- [ ] Programme de collecte : supprimer le filtre
- [ ] Année : supprimer le filtre de la zone de filtres (le filtre est déjà présent dans le bandeau)
- [ ] Etat & Niveau de qualité : lorsque l'état est "Qualifié", le champ "Etat" doit garder sa taille et le champ "Niveau de qualité" doit être sous le champ "Enquêteur"
- [ ] Objectif d'enquête directe ? & Enquête éco ? : 
  - [ ] Problème de focus : Impossible de sélectionner la valeur "Non" via le rond sans avoir préalablement sélectionner la valeur "Oui"
    (reproduis sur les radios button de l'onglet "Général" d'un calendrier)
  - [ ] Lors de l'utilisation des filtres, la colonne "Enquête éco ?" du tableau affiche les codes au lieu des libellés (COMMON.NO et COMMON.YES)

### Calendrier d'activité > Général

- [ ] Erreur lors de la consultation de certains calendriers, exemple : 919025 - MAL JOJO en 2022 : Exception while fetching data (/data) : null

### Calendrier d'activité > Navire

- [ ] Caractéristiques navires : certaines lignes auraient du être fusionnées (exemple 846740 - NARVAL année 2022)
- [ ] Armateurs :
  - [ ] Début d'activité : supprimer cette colonne car en base le champ est renseigné au 01/01/2010 ou vide
  - [ ] Date de la retraite :
    - [ ] En base, il y a des VESSEL_OWNER.RETIREMENT_DATE à 0001-01-01 00:00:00.000
    - [ ] En base, il y a des VESSEL_OWNER.RETIREMENT_DATE à 0001-01-01 00:00:00.000 et un affichage dans l'ihm au 29/12/0001 (exemple 510764 - EMMA-LOAN année 2022)
![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Armateur_date_retraite.png)
- [ ] Tooltip flèche pagination : modifier les libellés "First page" et "Last page" pour les mettre en français

### Calendrier d'activité > Calendrier

- [ ] Gestion des droits : en admin, le message "Vous n'êtes pas autorisé à saisir sur ce lieu" s'affiche alors que la saisie et la sauvegarde fonctionne (925409 - LA REVANCHE année 2022)
![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Calendrier_gestion_droits.png)
- [ ] Prédocumentation : 
  - [ ] La prédocumentation ne s'affiche pas pour certains calendriers
![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Prédocumentation_erreur.png)
  - [ ] La case cocher "SACROIS-OBSDEB" n'est pas présente et la ligne source indique systématiquement "Enquête N-1"
  alors qu'il y a des données "Enquête N-1" et "SACROIS-OBSDEB" (exemple 669336 - TONIN année 2022)
![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Prédocumentation_sources.png)

### Calendrier d'activité > Métiers

- [ ] Supprimer les cases à cocher qui n'ont pas d'utilité
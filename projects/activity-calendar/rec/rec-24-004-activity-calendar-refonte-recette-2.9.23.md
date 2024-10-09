# Activity Calendar - Recette MOE/MOA

## Retours de recette MOE - release 2.9.23

# Gestion des droits

- [ ] Erreur connexion avec t1ee00 (compte extranet de tstq2)

# Calendriers d'activité

- [ ] Le tri sur la colonne "Saisisseur" applique un tri sur le PERSON.ID au lieu du PERSON.LASTNAME (idem sur le tableau des marées)

# Calendriers d'activité > Filtres

- [ ] Navire : lors de la recherche par l'immat d'un navire qui a changé de nom, des fois c'est le nom actuel qui s'affiche, des fois c'est l'ancien [#639](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/639)

### Calendrier d'activité > Navire [#718](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/718)

- [ ] Caractéristiques navires :
    - [ ] Certaines lignes ne sont pas fusionnées alors qu'elles auraient dû l'être (exemple 846740 - NARVAL année 2022)
      ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Carac_navire_fusion_lignes.PNG)
    - [ ] La pagination ne tient pas compte des lignes fusionnées, il y a donc des pages vides


# Calendrier d'activité > Calendrier

- [ ] Erreur de chargement des données lors du filtrage (lieu d'immat, port d'exploit, enquêteur ...) et du tri sur la colonne Navire
  - Erreur Oracle : ORA-01791: cette expression n'a pas été SELECTionnée [#723](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/723)
- [ ] Ajouter un contrôle avec un message bloquant si la zone 2 d'un métier n'est pas renseignée alors que le gradient côte 2 ou la profondeur 2 ou la zone proche 2 est renseigné. Actuellement cela génère une erreur oracle à l'enregistrement
  - ORA-01400: impossible d'insérer NULL dans (SIH2_ADAGIO_DBA.FISHING_AREA.LOCATION_FK) 
- [ ] Mettre un libellé sur les messages d'erreur zone de pêche et gradient côte obligatoires
  ![rec-activity-calendar](/projects/activity-calendar/rec/images/rec-24-004-2.9.23-Calendrier_codes_messages.PNG)
- [ ] Lors de l'entrée en édition d'une cellule via la touche "Entrée" ou le doucle-clic, sélectionner la valeur de la cellule pour permettre au saisisseur de modifier rapidement la valeur
- [ ] Dans certains cas, la touche "Entrée" entre en édition mais en ressort aussi tôt
  ![rec-activity-calendar](/projects/activity-calendar/rec/images/rec-24-004-2.9.23-Calendrier_édition_touche_entrée.gif)
- [ ] La bordure du dernier mois du calendrier de saisie et de la prédoc n'est plus présente [#742](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/742)
- [ ] L'icône "Warning" présent sur les en-têtes de colonnes du calendrier de saisie est n'apparait plus entièrement [#742](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/742)

# Calendrier d'activité > Terminaison de la saisie

- [ ] Si l'objectif d'enquête est à "Oui" et que la qualification de l'enquêt est à "Directe", le message "Qualification Directe incohérente avec l'objectif" s'affcihe alors qu'il ne devrait pas
- [ ] Si au moins un mois est actif et que l'innactivité annuelle à confirmer est à "Oui", le message bloquant "xxx" doit s'afficher

# Calendriers d'activité > Rapport d'avancement [#743](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/743)

- [ ] L'entrée de menu pour accéder aux rapports n'est pas présente
- [ ] L'affichage du rapport est long (environ 35s pour 6 calendriers). Possibilité d'améliorer les perfs ?
- [ ] Erreur lors de l'affichage de certains lots de rapports (exemple : année 2023, saisisseur ROVILLON) [#744](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/744)
- [ ] Dans la colonne "Observateur(s)", le nom de l'observateur est répété autant de fois qu'il y a de mois renseignés
- [ ] Suite à la modification des validateurs sur le calendrier, les contrôles et les annotations suivantes n'ont plus lieu d'être :
  - [ ] (1) Port d'exploitation manquant
  - [ ] (3) Zone de pêche manquante
  - [ ] (4) Gradient côte manquant
- [ ] Corriger les fautes d'orthographe
  - [ ] Nombre de métiers pratiqués mar mois -> Nombre de métiers pratiqués **par** mois
  - [ ] Nombre de navire -> Nombre de **navires**
  - [ ] Navire non renseignés -> Navires non renseignés
- [ ] Mettre en place une pagination car la zone "Synthèse de l'avancement des calendriers d'activité" peut sortir de la page s'il y a trop de calendriers
- [ ] L'impression sort de la page à droite malgré le mode paysage

![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-004-2.9.23-Rapport_avancement.PNG)
![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-004-2.9.23-Rapport_avancement_impression.PNG)

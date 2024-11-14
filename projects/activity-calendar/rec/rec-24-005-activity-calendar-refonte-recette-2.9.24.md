# Activity Calendar - Recette MOE/MOA

## Retours de recette MOE - release 2.9.24

### Calendriers d'activité

- [ ] La colonne "Objectif d'enquête directe" affiche la valeur "Oui" à la place de "Opportuniste"
- [ ] Le tri sur la colonne "Lieu d'immatriculation" n'est pas cohérent : pour certains calendriers, le lieu d'immat correspond à une donnée historique et pas la dernière. Lié à l'indexation des navires ?
   ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-005-2.9.24-Bug_affichage_listes_filtres.gif)

### Calendriers d'activité > Filtres

- [ ] Masquer le programme SIH-ACTIPRED dans le volet calendrier d'activité car tous les saisisseurs de calendriers ont des droits sur les programmes SIH-ACTIFLOT et SIH-ACTIPRED
- [ ] Bug d'affichage des liste déroulantes des filtres
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-005-2.9.24-Duplication_calendriers.PNG)
- [ ] Port d'exploitation : l'application du filtre dupplique les calendriers dans le tableau
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-005-2.9.24-Duplication_calendriers.PNG)
- [ ] Navire : lors de la recherche par l'immat d'un navire qui a changé de nom, des fois c'est le nom actuel qui s'affiche, des fois c'est l'ancien [#639](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/639)
- [ ] Type de navire : la liste n'est pas filtrée selon l'option des paramètres systèmes "Saisie > Navire : Type(s) de navire (filtre)"
- [ ] Saisisseur/Observateur : les filtres ne remontent pas les utilisateurs ayant un PERSON.STATUS_FK = 0, exemple [#746](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/746)
  - PETIT Oceanne : n'apparait pas dans les filtres alors qu'elle est saisisseur de calendriers notamment sur 2022
  - LECROSNIER	Sandile : a 2 lignes dans la table PERSON. Le filtrage sur ce saisisseur en 2019,2020,2021 ne remonte aucun calendrier alors qu'elle est saisisseur de calendriers notamment sur ces années

### Calendriers d'activité > Import

- [ ] Toujours l'erreur du traitement qui tourne en boucle sans se terminer [#715](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/715)

### Calendrier d'activité > Navire 

- [ ] Caractéristiques navires : certaines lignes ne sont pas fusionnées alors qu'elles auraient dû l'être (exemple 846740 - NARVAL année 2022)
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Carac_navire_fusion_lignes.PNG)

### Calendrier d'activité > Calendrier
 
- [ ] Liste des gradients vides
- [ ] Ajouter un contrôle avec un message bloquant si la zone de pêche 2 d'un métier n'est pas renseignée alors que la profondeur 2 ou la zone proche 2 est renseignée. Actuellement cela génère une erreur oracle à l'enregistrement
  - ORA-01400: impossible d'insérer NULL dans (SIH2_ADAGIO_DBA.FISHING_AREA.LOCATION_FK) [#799](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/799)

### Calendrier d'activité > Calendrier - Régionalisation

- [ ] La régionalisation étant obligatoire, la case à cocher "Activer la zone de compétence" doit être visible uniquement par les responsables de programme et les administrateurs
- [ ] Localisation Mayotte, Régionalisation La Réunion : Les warning sur les ports ne s'affichent pas sur tous les ports concernés
  ![rec-activity-calendar](/projects/activity-calendar/rec/images/rec-24-006-2.9.24-warning-regionalisation.PNG)
- [ ] Quand on sélectionne une zone de compétence, la liste des zones de pêche est vide
- [ ] Quand on désactive la zone de compétence et que l'on rafraichit la page (F5), la zone de compétence est réactivée

### Calendrier d'activité > Métiers

- [ ] Améliorer l'ergonomie du tableau pour le rendre plus lisible (alternance de couleurs pour les colonnes PMFM)

### Calendrier d'activité > Terminaison de la saisie 

- [ ] Modifier la règle qui a été mise en place : si les 12 mois du calendrier sont inactifs, alors le champ "Innactivité annuelle confirmée par l'observateur" est obligatoire. La valeur sélectionnée peut être "Oui" ou "Non"
- [ ] Ajouter une règle pour bloquer la terminaison de la saisie si un mois n'a pas au moins un métier
- [ ] Le menu contextuel et donc l'accès au rapport n'est pas accessible depuis un calendrier validé

### Calendrier d'activité > Formulaire terrain vierge 

- [ ] Qualification de l'enquête : Afficher uniquement les qualitatives values avec STATUS_FK = 1 (ce qui permet de ne plus afficher les "Recopie 2021" et "Recopie 2022"). Attention sur le formulaire terrain avec données, il ne faut pas appliquer ce filtre et afficher toutes les qualitatives values du pmfm
- [ ] Immatriculation : Renseigner le champ, actuellement il est vide
- [ ] Dernier armateur : Renseigner le champ, actuellement il est vide
- [ ] Vente : Trier les qualitatives values selon l'ordre alphabétique (pour être conforme au formulaire de saisie). Ce tri sera commun avec le formulaire terrain avec données

### Calendrier d'activité > Formulaire terrain avec données 

- [ ] Lorsque l'option des préférences utilisateurs "Liste déroulante > Navires" n'est pas renseignée, le titre présent dans le bandeau doit afficher par défaut l'immatriculation au lieu du marquage extérieur
- [ ] Caractéristiques engins : afficher les PMFMs liés aux niveaux d'acquisition ACTIVITY_CALENDAR_GEAR_PHYSICAL_FEATURES et ACTIVITY_CALENDAR_GEAR_USE_FEATURES
- [ ] Observateurs : mettre un observateur par ligne pour plus de lisibilité
- [x] Erreur lors de l'accès depuis le tableau de consultation des calendriers en filtrant sur le programme ACTIFLOT et en sélectionnant un calendrier
  - Variable 'id' has an invalid value: Variable 'id' has coerced Nul value for NonNull type 'Int!'

### Calendriers d'activité > Rapport d'avancement 

- [ ] Si l'utilisateur a les droits sur plusieurs programmes de collecte de type calendrier (ACTIFLOT et ACTIPRED) :
  - [ ] Charger par défaut le programme ACTIFLOT et ses options
  - [ ] Afficher un warning
- [ ] Augmenter la largeur de la colonne "Longueur H.T (m)" pour le pas couper le mot "Longueur"
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-005-2.9.24-Rapport_avancement.PNG)
- [ ] Afficher le filtre "Objectif d'enquête directe"
- [ ] Le filtre "Type de navire" apparait dès que le filtre "Navire" est renseigné, alors qu'il devrait apparaitre uniquement si le type de navire est renseigné
- [ ] Le filtre "Type de navire" n'est pas pris en compte et aucun message n'apparait pour indiquer qu'il y a plus de 20 calendriers dans le rapport



## Retours de recette MOA - release 2.9.24

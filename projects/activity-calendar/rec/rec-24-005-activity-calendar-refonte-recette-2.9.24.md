# Activity Calendar - Recette MOE/MOA

## Retours de recette MOE - release 2.9.24

### Calendriers d'activité [#810](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/810)

- [ ] La colonne "Objectif d'enquête directe" affiche la valeur "Oui" à la place de "Opportuniste"
- [ ] Le tri sur la colonne "Lieu d'immatriculation" n'est pas cohérent : pour certains calendriers, le lieu d'immat correspond à une donnée historique et pas la dernière. Lié à l'indexation des navires ?
   ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-005-2.9.24-Tri_lieu_immat.PNG)

### Calendriers d'activité > Filtres

- [ ] Masquer le programme SIH-ACTIPRED dans le volet calendrier d'activité car tous les saisisseurs de calendriers ont des droits sur les programmes SIH-ACTIFLOT et SIH-ACTIPRED [#809](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/809)
- [ ] Bug d'affichage des liste déroulantes des filtres [#809](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/809)
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-006-2.9.24-Bug_affichage_listes_filtres.gif)
- [ ] Port d'exploitation : l'application du filtre duplique les calendriers dans le tableau [#809](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/809)
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-005-2.9.24-Duplication_calendriers.PNG)
- [ ] Navire : lors de la recherche par l'immat d'un navire qui a changé de nom, des fois c'est le nom actuel qui s'affiche, des fois c'est l'ancien [#639](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/639)
- [ ] Type de navire : la liste n'est pas filtrée selon l'option des paramètres systèmes "Saisie > Navire : Type(s) de navire (filtre)" [#809](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/809)
- [ ] Saisisseur/Observateur : les filtres ne remontent pas les utilisateurs ayant un PERSON.STATUS_FK = 0, exemple [#746](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/746)
  - PETIT Oceanne : n'apparait pas dans les filtres alors qu'elle est saisisseur de calendriers notamment sur 2022
  - LECROSNIER	Sandile : a 2 lignes dans la table PERSON. Le filtrage sur ce saisisseur en 2019,2020,2021 ne remonte aucun calendrier alors qu'elle est saisisseur de calendriers notamment sur ces années

### Calendriers d'activité > Import

- [ ] Toujours l'erreur du traitement qui tourne en boucle sans se terminer [#808](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/808)

### Calendrier d'activité > Navire 

- [ ] Caractéristiques navires : certaines lignes ne sont pas fusionnées alors qu'elles auraient dû l'être (exemple 846740 - NARVAL année 2022) [#807](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/807)
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-006-2.9.24-Carac_navire.PNG)

### Calendrier d'activité > Calendrier
 
- [ ] Liste des gradients vides
- [ ] Ajouter un contrôle avec un message bloquant si la zone de pêche 2 d'un métier n'est pas renseignée alors que la profondeur 2 ou la zone proche 2 est renseignée. Actuellement cela génère une erreur oracle à l'enregistrement
  - ORA-01400: impossible d'insérer NULL dans (SIH2_ADAGIO_DBA.FISHING_AREA.LOCATION_FK) [#799](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/799)

### Calendrier d'activité > Calendrier - Régionalisation

- [ ] La régionalisation étant obligatoire, la case à cocher "Activer la zone de compétence" doit être visible uniquement par les responsables de programme et les administrateurs [#800](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/800)
- [ ] Quand on désactive la zone de compétence et que l'on rafraichit la page (F5), la zone de compétence est réactivée [#800](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/800)
- [ ] Localisation Mayotte, Régionalisation La Réunion : Les warning sur les ports ne s'affichent pas sur tous les ports concernés [#800](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/800)
  ![rec-activity-calendar](/projects/activity-calendar/rec/images/rec-24-006-2.9.24-warning-regionalisation.PNG)
- [ ] Quand on sélectionne une zone de compétence, la liste des zones de pêche est vide [#801](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/801)

### Calendrier d'activité > Métiers [#806](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/806)

- [ ] Améliorer l'ergonomie du tableau pour le rendre plus lisible (alternance de couleurs pour les colonnes PMFM)

### Calendrier d'activité > Terminaison de la saisie [#805](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/805)

- [ ] Modifier la règle qui a été mise en place : si les 12 mois du calendrier sont inactifs, alors le champ "Inactivité annuelle confirmée par l'observateur" est obligatoire. La valeur sélectionnée peut être "Oui" ou "Non"
- [ ] Ajouter une règle pour bloquer la terminaison de la saisie si un mois n'a pas au moins un métier
- [ ] Le menu contextuel et donc l'accès au rapport n'est pas accessible depuis un calendrier validé

- [ ] Clique sur terminer la saisie : Erreur dans l'app
    - https://sumaris-app.isival.ifremer.fr/activity-calendar/3235048
```
Uncaught (in promise) TypeError: q.asObject is not a function
    at main.e7fdd22429f644ca.js:1:322648
    at Array.map (<anonymous>)
    at S.asObject (main.e7fdd22429f644ca.js:1:322639)
    at ce.asObject (3071.cd337e6958f4c8e8.js:243:16621)
    at main.e7fdd22429f644ca.js:108:27672
    at Generator.next (<anonymous>)
    at r (main.e7fdd22429f644ca.js:3809:588220)
    at M (main.e7fdd22429f644ca.js:3809:588422)
```

### Calendrier d'activité > Formulaire terrain vierge [#804](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/804)

- [ ] Qualification de l'enquête : Afficher uniquement les qualitatives values avec STATUS_FK = 1 (ce qui permet de ne plus afficher les "Recopie 2021" et "Recopie 2022"). Attention sur le formulaire terrain avec données, il ne faut pas appliquer ce filtre et afficher toutes les qualitatives values du pmfm
- [ ] Immatriculation : Renseigner le champ, actuellement il est vide
- [ ] Dernier armateur : Renseigner le champ, actuellement il est vide
- [ ] Vente : Trier les qualitatives values selon l'ordre alphabétique (pour être conforme au formulaire de saisie). Ce tri sera commun avec le formulaire terrain avec données

### Calendrier d'activité > Formulaire terrain avec données  [#803](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/803)

- [ ] Lorsque l'option des préférences utilisateurs "Liste déroulante > Navires" n'est pas renseignée, le titre présent dans le bandeau doit afficher par défaut l'immatriculation au lieu du marquage extérieur
- [ ] Caractéristiques engins : afficher les PMFMs liés aux niveaux d'acquisition ACTIVITY_CALENDAR_GEAR_PHYSICAL_FEATURES et ACTIVITY_CALENDAR_GEAR_USE_FEATURES
- [ ] Observateurs : mettre un observateur par ligne pour plus de lisibilité
- [x] Erreur lors de l'accès depuis le tableau de consultation des calendriers en filtrant sur le programme ACTIFLOT et en sélectionnant un calendrier
  - Variable 'id' has an invalid value: Variable 'id' has coerced Nul value for NonNull type 'Int!'

### Calendriers d'activité > Rapport d'avancement [#802](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/802)

- [ ] Si l'utilisateur a les droits sur plusieurs programmes de collecte de type calendrier (ACTIFLOT et ACTIPRED) : [#797](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/797)
  - [ ] Charger par défaut le programme ACTIFLOT et ses options
  - [ ] Afficher un warning
- [ ] Augmenter la largeur de la colonne "Longueur H.T (m)" pour le pas couper le mot "Longueur"
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-005-2.9.24-Rapport_avancement.PNG)
- [ ] Afficher le filtre "Objectif d'enquête directe"
- [ ] Le filtre "Type de navire" apparait dès que le filtre "Navire" est renseigné, alors qu'il devrait apparaitre uniquement si le type de navire est renseigné
- [ ] Le filtre "Type de navire" n'est pas pris en compte et aucun message n'apparait pour indiquer qu'il y a plus de 20 calendriers dans le rapport


## Retours de recette MOA - release 2.9.24

### Calendriers d'activité > Import

- [ ] Pas d'accès à la fonctionalité d'import [#771(https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/771)

### Calendriers d'activité

- [X] Activer le mode hors ligne n'est pas visible mais il me semble qu'il a été masqué.
  - _MOE_ : Cas de tests modifiés

### Calendriers d'activité > Navire

- [ ] Caractéristiques : je n'ai pas marquage extérieur, qui avait été corrigé. Mais je n'ai pas non plus immatriculation à la place. Je ne sais pas si c'est normal ?
  - _MOE_ : Cas de tests modifiés

### Calendriers d'activité > Régionalisation

- [ ] Les choix de la liste déroulante ne semblent pas s'afficher par ordre alphabétique. Serait-il possible de mettre "zone de compétence" en premier plustôt que parmi les derniers ?

- [X] Comme dis en démo, il faut enlever la case à cocher.

- [ ] Métier et zone de pêche sont adaptés à la régionalisation mais le gradient n'est pas cohérent avec la zone de pêche.
  - Ex, pour La Réunion, si je saisis la zone côtière RUSE3; le gradient côte proposé est "Etranger", c'est incohérent. Par contre-les autres gradients, profondeur et zone proche ne sont pas régionalisés dans les refs, donc pas de pb.
  - J'ai vérifié en passant sur la zone de compétence "Manche". Idem, si je saisis 30f1T, une zone côtière, le seul gradient côte proposé est 'étranger'. 

![rec-activity-calendar-gradient](/projects/activity-calendar/rec/images/rec-24-005-2.9.24-regionalisation_gradient.PNG)

- [ ] Dans les filtres sur le lieu d'immatriculation, des lieux étrangers viennent s'intercaler dans la lsite. Nous ne les voyions dans l'ancien Allegro. 
  - Serait-il possible de les masquer ou à minma de les mettre en fin de liste ?

![rec-activity-calendar-gradient](/projects/activity-calendar/rec/images/rec-24-006-2.9.24-lieux-etrangers.PNG)

### Calendrier d'activité > Contrôle de la saisie [#805](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/805)

- [ ] Si on répond à cette question, le calendrier est forcément inactif toute l'année. 
Si la réponse est oui c'est que l'observateur sait que le navire est réellement inactif. 
Si l'observateur répond non, c'est que "inactif" a été mis par défaut car aucune info n'existe sur ce navire.

- [ ] Vu en démo. Calendrier inactif toute l'année. Je réponds non à 'inactivité confirmée par l'observateur" et j'ai le message d'erreur "champ obligatoire", 
ce qui empêche de terminer la saisie. Si je réponds, oui, ça fonctionne.

- [ ] Si je clique sur valider, il ne se passe rien mais le bouton est cliquable, il n'est pas grisé.
  - _MOE_ : Pas de bouton valider si on termine la saisie d'un calendrier

- [ ] Pour le coordinateur, y aura-t-il la possibilité de valider tous les calendriers d'une année par un seul clique quelque part ?

![rec-activity-calendar-valider](/projects/activity-calendar/rec/images/rec-24-006-2.9.24-valider-saisie.PNG)

- [ ] Calendrier incomplet : Au fil de la recette, je m'aperçois que lorsque l'on ouvre un calendrier, on ne voit nulle part son état. 
Possible de le rajouter dans l'encart de droite sous la date de mise à jour ? même si le bouton "terminer la saisie" peut nous laisser penser qu'il est "en cours de saisise", ce n'est pas explicite. 

![rec-activity-etat-calendrier](/projects/activity-calendar/rec/images/rec-24-006-2.9.24-affichage-etat-calendrier.PNG)


### Calendrier d'activité > Formulaire terrain vierge

- [ ] Il manque les données du dernier armateur [#804](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/804)

- [ ] Globalement, sur les 22 formulaires et sur le rapport, un seul logo du SIH suffit. En noir si possible comme tous les docs sont en noir.

### Calendrier d'activité > Formulaire terrain avec données

- [ ] Tout ok mais y a pas le nom de l'observeteur. 
  - _MOE_ : Reproduit avec le calendrier id 3346311
![rec-activity-rapport-observateur](/projects/activity-calendar/rec/images/rec-24-006-2.9.24-formulaire-donnees-sans-observateur.PNG)


### Calendriers d'activité > Rapport d'avancement

- [ ] Il manque des observateurs :  Sur le quartier de Boulogne en 2023, seule ABIVEN Camille apparaît et je ne sais pas qui c'est ;-)
  - _MOE_ : Reproduit sur 2023 pour des lieux d'immatriculation à Boulogne 
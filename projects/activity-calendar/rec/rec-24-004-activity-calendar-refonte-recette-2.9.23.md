# Activity Calendar - Recette MOE/MOA

## Retours de recette MOE - release 2.9.23

# Gestion des droits

- [x] Erreur connexion avec tstq2 (comptes intranet et extranet). MAJ du fichier de conf du pod

# Calendriers d'activité

- [ ] Le tri sur la colonne "Saisisseur" applique un tri sur le PERSON.ID au lieu du PERSON.LASTNAME (idem sur le tableau des marées) [#745](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/745)

# Calendriers d'activité > Filtres

- [ ] Navire : lors de la recherche par l'immat d'un navire qui a changé de nom, des fois c'est le nom actuel qui s'affiche, des fois c'est l'ancien [#639](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/639)
- [ ] Saisisseur/Observateur : les filtres ne remontent pas les utilisateurs ayant un PERSON.STATUS_FK = 0, exemple [#746](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/746)
  - PETIT Oceanne : n'apparait pas dans les filtres alors qu'elle est saisisseur de calendriers notamment sur 2022
  - LECROSNIER	Sandile : a 2 lignes dans la table PERSON. Le filtrage sur ce saisisseur en 2019,2020,2021 ne remonte aucun calendrier alors qu'elle est saisisseur de calendriers notamment sur ces années

# Calendriers d'activité > Import

- [ ] Il n'y a pas d'avancement ni de rapport affiché concernant l'import des calendriers vides.
  On a bien l'horloge, dans le menu de gauche, qui indique que la tâche est en cours mais on n'a pas le rapport.
  EN BDD, le PROCESSING_STATUS du traitement est à "CANCELLED". Les calendriers sont quand même bien importés. [#715](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/715)

# Calendrier d'activité > Navire 

- [ ] Caractéristiques navires : [#718](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/718)
    - [ ] Certaines lignes ne sont pas fusionnées alors qu'elles auraient dû l'être (exemple 846740 - NARVAL année 2022)
      ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Carac_navire_fusion_lignes.PNG)
    - [ ] La pagination ne tient pas compte des lignes fusionnées, il y a donc des pages vides

# Calendrier d'activité > Calendrier

- [ ] Erreur de chargement des données lors du filtrage (lieu d'immat, port d'exploit, enquêteur ...) et du tri sur la colonne Navire [#723](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/723)
  - Erreur Oracle : ORA-01791: cette expression n'a pas été SELECTionnée 
- [ ] Présence de 2 scrollbars sur le calendrier de saisie 
  ![rec-activity-calendar](/projects/activity-calendar/rec/images/rec-24-004-2.9.23-Calendrier_2_scrollbars.gif)
- [ ] Ajouter un contrôle avec un message bloquant si la zone 2 d'un métier n'est pas renseignée alors que le gradient côte 2 ou la profondeur 2 ou la zone proche 2 est renseigné. Actuellement cela génère une erreur oracle à l'enregistrement [#747](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/747)
  - ORA-01400: impossible d'insérer NULL dans (SIH2_ADAGIO_DBA.FISHING_AREA.LOCATION_FK) 
- [ ] Mettre un libellé sur les messages d'erreur zone de pêche et gradient côte obligatoires [#747](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/747)
  ![rec-activity-calendar](/projects/activity-calendar/rec/images/rec-24-004-2.9.23-Calendrier_codes_messages.PNG)
- [ ] A la sauvegarde, lorsqu'il y a un mois en erreur, les valeurs des pmfm sont vidées alors qu'elles devraient être conservées [#747](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/747)
- [ ] Lors de l'entrée en édition d'une cellule via la touche "Entrée" ou le doucle-clic, sélectionner la valeur de la cellule pour permettre au saisisseur de modifier rapidement la valeur
- [ ] Dans certains cas, la touche "Entrée" entre en édition mais en ressort aussi tôt
  ![rec-activity-calendar](/projects/activity-calendar/rec/images/rec-24-004-2.9.23-Calendrier_édition_touche_entrée.gif)
- [ ] La bordure du dernier mois du calendrier de saisie et de la prédoc n'est plus présente [#762](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/762)
- [x] L'icône "Warning" présent sur les en-têtes de colonnes du calendrier de saisie est n'apparait plus entièrement [#742](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/742)
- [ ] Etendre : 
  - [ ] La fonctionnalité "Etendre" vers la gauche a un décalage d'une cellule [#760](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/760)
  - [x] Il n'est plus possible détendre les cellules métier, zone, gradient côte, profondeur, zone proche. Le curseur pour étendre n'est plus visible sur ces cellules [#695](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/695)
- [ ] Lorsqu'une seule source de prédc est sélectionnée, il n'y a pas forcément de métier dans le bloc #1. Possibilité de réorganiser les métiers ?

# Calendrier d'activité > Métiers

- [ ] Supprimer les cases à cocher et la colonne # qui n'ont pas d'utilité [#704](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/704)

# Calendrier d'activité > Terminaison de la saisie [#717](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/717)

- [x] Si l'objectif d'enquête est à "Oui" et que la qualification de l'enquêt est à "Directe", le message "Qualification Directe incohérente avec l'objectif" s'affcihe alors qu'il ne devrait pas
- [x] Si au moins un mois est actif et que l'innactivité annuelle à confirmer est à "Oui", le message bloquant "xxx" doit s'afficher

# Calendrier d'activité > Formulaire terrain vierge [#696](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/696)

- [ ] Qualification de l'enquête :
  - [ ] Afficher uniquement les qualitatives values avec STATUS_FK = 1 (ce qui permet de ne plus afficher les "Recopie 2021" et "Recopie 2022"). Attention sur le formulaire terrain avec données, il faut garder le fonctionnement actuel, c'est-à-dire, afficher toutes les qualitatives values du pmfm
  - [ ] Trier les qualitatives values selon l'ordre alphabétique (pour être conforme au formulaire de saisie). Ce tri sera commun avec le formulaire terrain avec données
- [ ] Le champ "Zone/Gradient" n'affiche que le LOCATION.LABEL, il faut ajouter le DISTANCE_TO_COAST_GRADIENT.LABEL
- [ ] Vente : Trier les qualitatives values selon l'ordre alphabétique (pour être conforme au formulaire de saisie). Ce tri sera commun avec le formulaire terrain avec données
- [ ] Caractéristiques engins : première ligne ajouter "métier(s)" dans la case vide
- [ ] Lieux d'immat : n'est pas renseigné alors que l'immatriculation et le nom sont renseignés

# Calendrier d'activité > Formulaire terrain avec données [#722](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/722)

- [ ] Erreur lors de la consultation du rapport si ACTIVITY_CALENDAR_RECORDER_PERSON_FK est null
- [ ] Revoir la pagination car le contenu du rapport peut sortir de la page
- [ ] Le titre présent dans le bandeau ne tient pas compte de l'option "Liste déroulante > Navires" des préférences utilisateurs
- [ ] Caractéristiques engins :
  - [ ] Afficher les PMFMs liés aux niveaux d'acquisition ACTIVITY_CALENDAR_GEAR_PHYSICAL_FEATURES et ACTIVITY_CALENDAR_GEAR_USE_FEATURES
  - [ ] Ordonner les métiers selon le même ordre que sur les onglets "Calendrier" et "Métiers" de l'écran de saisie
- [ ] Faire apparaitre le ou les observateurs (table ACTIVITY_CALENDAR2PERSON) au lieu du saisisseur
- [ ] Lieux d'immat : n'est pas renseigné alors que l'immatriculation et le nom sont renseignés

# Calendriers d'activité > Rapport d'avancement [#743](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/743)

- [x] L'entrée de menu pour accéder aux rapports n'est pas présente -> s'il y a plusieurs programme de collecte, sélectionner le programme ACTIFLOT
- [x] L'affichage du rapport est long (environ 35s pour 6 calendriers). Possibilité d'améliorer les perfs ?
- [x] Erreur lors de l'affichage de certains lots de rapports (exemple : année 2023, saisisseur ROVILLON) [#744](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/744)
- [x] Dans la colonne "Observateur(s)", le nom de l'observateur est répété autant de fois qu'il y a de mois renseignés
- ~~[ ] Suite à la modification des validateurs sur le calendrier, les contrôles et les annotations suivantes n'ont plus lieu d'être :~~ les conserver, car le fonctionnement de l'application peut évoluer
  - ~~[ ] (1) Port d'exploitation manquant~~
  - ~~[ ] (3) Zone de pêche manquante~~
  - ~~[ ] (4) Gradient côte manquant~~
- [x] Corriger les fautes d'orthographe
  - [x] Nombre de métiers pratiqués mar mois -> Nombre de métiers pratiqués **par** mois
  - [x] Nombre de navire -> Nombre de **navires**
  - [x] Navire non renseignés -> Navires non renseignés
- [x] Mettre en place une pagination car la zone "Synthèse de l'avancement des calendriers d'activité" peut sortir de la page s'il y a trop de calendriers
- [ ] L'impression sort de la page à droite malgré le mode paysage [#757](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/757)
- [ ] La colonne "Observateur(s)" est vide alors que le champ est renseigné dans l'IHM [#757](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/757)
- [ ] Lors de la génération du rapport, ajouter une limite bloquante sur le nombre de calendriers ou à minima mettre un warning pour avertir l'utilisateur que les perfs seront dégradés [#757](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/757)
- [ ] Erreur "Cannot read properties of null (reading 'replace')" lors de la génération du rapport pour tous les calendriers 2021 (soit 6257 calendriers - lié aux perfs ?)
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-004-2.9.23-Rapport_avancement_erreur_volumétrie.PNG)
- [ ] Agencer les filtres dans le même ordre que dans l'application [#757](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/757)
- [ ] Inclure les filtres "Objectif d'enquête directe" et "Objectif d'enquête éco" [#757](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/757)

![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-004-2.9.23-Rapport_avancement.PNG)
![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-004-2.9.23-Rapport_avancement_impression.PNG)

# Paramètres systèmes

- [ ] Erreur à l'enregistrement lorsque l'option "Saisie > Navire : Type(s) de navire (filtre)" est renseignée
  ![rec-activity-calendar](/projects/activity-calendar/rec/images/rec-24-004-2.9.23-Erreur_option_type_navire.PNG)


  
## Retours de recette MOA - release 2.9.23.3

Recette faite par Emilie Le Roy le 17/10/2024

# Calendrier d'activité > Import

- [X] Dans le menu contextuel, "importer depuis un fichier..." est grisé.

# Calendriers d'activité

- [ ] Pas de bouton rafraîchir.
- [ ] "Editer le rapport Formulaire vierge et Formulaire avec données" > grisés même si on sélectionne un navire.
- [ ] Rajouter le lieu d'immatriculation en colonne car quand on filtre sur un lieu d'immat, ce lieu n'est ensuite visible que dans l'onglet navire du calendrier.
  - [ ] Quand on ouvre le calendrier, rajouter ce lieu dans le fil d'ariane ? : lieu immat - immat - nom - activité 2024 (Ex : **Point à Pitre - 935087 - MI BIGMAC - Activité 2024**)
    - _A valider MOE/Dév_

# Calendriers d'activité > Filtres

- [ ] Le filtre navire ne fonctionne que sur l'immat et pas sur le nom. Et quand on commence à mettre une immat, ça donne une liste bizare, cf capture.

![rec-activity-calendar-filtre-vessels](/projects/activity-calendar/rec/images/rec-24-005-2.9.23.3-Filtre_navire.PNG)

- [ ] Organismes saisisseur : on ne doit voir que les sociétés qui ont des droits sur ACTIFLOT

# Calendrier d'activité > Navire

- [ ] Marquage extérieur doit être modifié en "immatriculation"

# Calendrier d'activité > Calendrier

- [X] Bug de saisie (remonté par Vincent Badts) [#766](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/766)

- [ ] Le bandeau de prédoc débarde de l'écran et est tronqué, on ne voit pas la source Sacrois-ObsDeb
  - _MOE : Il n'y a pas de données Sacrois-ObsDeb dans ce cas_ 
  - _MOA : Il faudrait que le choix de cocher s'affiche pas défaut même si pas de données. Comme ça on voit pas nous-même que le calendrier de predoc est vide et que donc pas de données._

- [ ] Il faut bloquer l'usage de la molette pour les zones de saisie d'un nombre (Ex : Nombre de jours de mer)
  - On peut utiliser la molette et mettre des nombres négatifs. Il est d'ailleurs possible d'enregister avec un nombre négatif.

- [ ] L'icône warning s'affiche mais quand on remplit le port, elle ne disparait pas. Idem après sauvegarde. cf capture.

![rec-activity-calendar-warning](/projects/activity-calendar/rec/images/rec-24-005-2.9.23.3-Warning.PNG)

- [X] Le dénombrement des métiers ne se fait qu'après sauvegarde et pas au fil de la saisie, c'est bien ça ?
  - _MOE_ : Oui

# Calendrier d'activité > Validation

- [ ] Action de "Dévalider" et "Valider" accessible même si on n'est pas Admin ?

- [ ] La liste des qualifications n'est pas adaptée au programme ActiFlot 

- [ ] Erreur dans le scénario SqushTM : Les boutons "Dévalider" et "Qualifier (état)" sont cliquables

- [ ] Cas de test d'un calendrier avec le flag Innactivité annuelle confirmée par l'observateur" à "Non" ET tous les mois du calendrier à l'état "Inactif"
  - Il n'y a pas de message d'erreur quand on termine la saisie

# Calendrier d'activité > Formulaire terrain avec données

- [ ] Le lieu d'immatriculation n'est pas renseigné

- [ ] Résultat du filtre incohérent et "Erreur de chargement de données"

![rec-activity-calendar-filtre](/projects/activity-calendar/rec/images/rec-24-005-2.9.23.3-Liste_navire_incoherents.PNG)

![rec-activity-calendar-erreur](/projects/activity-calendar/rec/images/rec-24-005-2.9.23.3-Plantage.PNG)

- [ ] C'est aléatoire, formulaire vierge et avec données ne sont pas toujours cliquables, il faut parfois rafraichir plusieurs fois

# Calendrier d'activité > Formulaire vierge

- [ ] Instable : L'option est parfois grisée

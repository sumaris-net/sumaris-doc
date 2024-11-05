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


  
# Retours de recette MOA - release 2.9.23.3

Recette faite par Emilie Le Roy le 17/10/2024

## Configuration des profils

- Profil d'Emilie Le Roy (Responsable de programme): 
  - Table PERSON2USER_PROFIL : ALLEGRO_UTILISATEUR, ALLEGRO_SUPER_UTILISATEUR 
  - Table PROGRAM2PERSON : Administrateur, Observateur
- Profil de Vincent Badts (Administrateur): 
  - Table PERSON2USER_PROFIL : ALLEGRO_ADMINISTRATEUR, ALLEGRO_UTILISATEUR, ALLEGRO_SUPER_UTILISATEUR
  - Table PROGRAM2PERSON : 
- Profil de Vincent Fachéro (Administrateur): 
  - Table PERSON2USER_PROFIL : ALLEGRO_ADMINISTRATEUR, ALLEGRO_UTILISATEUR, ALLEGRO_SUPER_UTILISATEUR
  - Table PROGRAM2PERSON : Observateur
- Profil de TSTQ2 (Responsable de programme):
  - Table PERSON2USER_PROFIL : ALLEGRO_UTILISATEUR
  - Table PROGRAM2PERSON : Administrateur (ajouté)


## Calendrier d'activité > Import

- [ ] Dans le menu contextuel, "importer depuis un fichier..." est grisé.
  - _MOE_ : Accessible pour les Administrateurs. A modifier, doit être accessible pour les coordinateurs de programme
    [#771](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/771)

## Calendriers d'activité

- [ ] Pas de bouton rafraîchir.
  - _MOE_ : Visible pour les admins (à corriger) 
    [#771](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/771)
- [ ] Rajouter le lieu d'immatriculation en colonne car quand on filtre sur un lieu d'immat, ce lieu n'est ensuite visible que dans l'onglet navire du calendrier.
  - [ ] Quand on ouvre le calendrier, rajouter ce lieu dans le fil d'ariane ? : lieu immat - immat - nom - activité 2024 (Ex : **Point à Pitre - 935087 - MI BIGMAC - Activité 2024**)
    - [#768](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/768)
    - [#769](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/769)
    - _MOE_ : A spécifier


## Calendriers d'activité > Filtres

- [X] Le filtre navire ne fonctionne que sur l'immat et pas sur le nom. Et quand on commence à mettre une immat, ça donne une liste bizare, cf capture.
  - _MOE_ : Pour filtrer sur le nom il faut préfixer par * et mettre le nom recherché en minuscule. 
  [#737](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/737)

![rec-activity-calendar-filtre-vessels](/projects/activity-calendar/rec/images/rec-24-005-2.9.23.3-Filtre_navire.PNG)

- [ ] Organismes saisisseur : on ne doit voir que les sociétés qui ont des droits sur ACTIFLOT
  - _MOE_ : **Pas abordé durant la phase de spécifications, en V1.1 si possible**

## Calendrier d'activité > Navire

- [ ] Marquage extérieur doit être modifié en "immatriculation"
  [#774](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/774)

  _MOE_ : On a déja l'immatriculation dans le tableau ci dessous. Ce n'est pas juste un renommage de colonne dans les caractéristiques.  
  On peut proposer : 
  - Recopier l'immat dans le tableau des caractéristiques et enlever la colonne marquage : la colonne immat ne sera pas triable
  - Le tableau des immatriculations est au dessus du tableau des caractéristiques

## Calendrier d'activité > Calendrier

- [X] Bug de saisie (remonté par Vincent Badts) [#766](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/766)

- [ ] Le bandeau de prédoc déborde de l'écran et est tronqué, on ne voit pas la source Sacrois-ObsDeb [#778](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/778)
  - _MOE : Bug sur l'affichage de la source Sacrois-ObsDeb si on n'est pas administrateur_ 
  - _MOA : Il faudrait que le choix de cocher s'affiche pas défaut même si pas de données. Comme ça on voit pas nous-même que le calendrier de predoc est vide et que donc pas de données._

- [X] Il faut bloquer l'usage de la molette pour les zones de saisie d'un nombre (Ex : Nombre de jours de mer)
  - On peut utiliser la molette et mettre des nombres négatifs. Il est d'ailleurs possible d'enregister avec un nombre négatif.
  - _MOE_ : PMFM - Min à mettre sur le PMFM à 1 (on ne peut pas mettre 0 en min). 
  - _MOE_ : PMFM - positionner le 0 en BDD (PMFM_STRATEGY).
    [#772](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/772)

- [ ] L'icône warning s'affiche mais quand on remplit le port, elle ne disparait pas. Idem après sauvegarde. cf capture.
  - _MOE_ : A reproduire (lister l'erreur)
  - _MOE_ : Problème de recopie de la totalité de la prédoc : On perd le bloc métier de la prédoc à la sauvegarde et au rafraichissement.
    [#773](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/773)
  
![rec-activity-calendar-warning](/projects/activity-calendar/rec/images/rec-24-005-2.9.23.3-Warning.PNG)

- [X] Le dénombrement des métiers ne se fait qu'après sauvegarde et pas au fil de la saisie, c'est bien ça ?
  - _MOE_ : Oui

## Calendrier d'activité > Validation

- [ ] Action de "Dévalider" et "Valider" accessible même si on n'est pas Admin ?
  - Responsable de programme ou superviseur (à vérifier car elle doit être superviseur)

- [ ] La liste des qualifications n'est pas adaptée au programme ActiFlot
  - _MOE_ - **Avoir une option qui adapte la liste au programme (visible que d'Emilie) : en V1.1**

- [ ] Erreur dans le scénario SquashTM : Les boutons "Dévalider" et "Qualifier (état)" sont cliquables

- [ ] Cas de test d'un calendrier avec le flag "Inactivité annuelle confirmée par l'observateur" à "Non" ET tous les mois du calendrier à l'état "Inactif"
  - Il n'y a pas de message d'erreur quand on termine la saisie [#770](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/770)

## Calendrier d'activité > Formulaire terrain avec données

- [ ] Le lieu d'immatriculation n'est pas renseigné [#722](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/722)
  - On perd ensuite les lieux d'immatriculation à l'affichage du calendrier (Cf mail Caroline du 17/10/2024)
  - _MOE : Fixé dans la 2.9.24_

- [ ] Résultat du filtre incohérent et "Erreur de chargement de données"
  - _MOE_ : Problème de tri sur navire - [#723](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/723)
    - _MOE_ : Il faut trier sur une autre colonne pour ne plus avoir l'erreur. Bug passé en priorité "Majeure"
  - _MOE_ : Attente de la colonne Lieu d'immat

![rec-activity-calendar-filtre](/projects/activity-calendar/rec/images/rec-24-005-2.9.23.3-Liste_navire_incoherents.PNG)

![rec-activity-calendar-erreur](/projects/activity-calendar/rec/images/rec-24-005-2.9.23.3-Plantage.PNG)

- [ ] C'est aléatoire, formulaire vierge et avec données ne sont pas toujours cliquables, il faut parfois rafraichir plusieurs fois
  - _MOE_ : Bug reproduit si on n'a pas d'année de sélectionnée ou dans le filtre. Ce sera corrigé. Les formulaires seront toujours actifs mais bloqués s'il y a trop
    de calendriers affichés. L'utilisateur sera averti. 
  - _MOE_ : A paramétrer : Il est possible de fixer une limite pour bloquer et de fixer une limite pour avertir les saisisseurs 
  - _MOE_ : A proposer spécifier 

## Calendrier d'activité > Formulaire vierge

- [ ] Instable : L'option est parfois grisée
  - _MOE_ : Même comportement que le formulaire avec données


# Retours de recette Utilisateurs - release 2.9.23.3

## Lise MAS (CAPENA)

- Points positifs :
  - Merci d’avoir permis de masquer la colonne de gauche (double flèche rose en bas), cela permet de voir le calendrier en entier de janvier à décembre, ce qui n’est pas le cas si on laisse cette colonne visible.
  - Lorsque l’on voit le calendrier en entier, on retrouve la forme que nous avions sur le logiciel Allegro habituel. Donc nickel.
  - Je trouve ça très bien de pouvoir supprimer des cellules sans être obligée de confirmer la suppression

### Calendriers d'activité et # Calendriers d'activité > Filtre

- [X] Bug : Aucun observateur de CAPENA n’apparaît dans la liste « Observateurs ». Dans le filtre, la société n'est pas trouvée.
  - _MOE : Vérifier les requêtes côté POD_

### Calendriers d'activité > Calendrier

- [ ] Remarque : Pour ajouter une info dans une case, il faut double-cliquer : un simple clic ne serait-il pas mieux ?
  - _MOE : Non, le simple clique permet de sélectionner une cellule. L'appuie de la touche "Entrée" permet de rentrer en édition._

- [ ] Question : A quoi correspondent les étoiles roses en bas des mois ? Elles apparaissent dès qu’il y a une action faite sur un mois.
  - _MOE : Elles apparaissent quand on a des modifications non enregistrées sur un mois_ 

- [ ] Question : Le mois de décembre a un problème (rond rose avec point d’exclamation), mais comment puis-je connaître le problème ?
  - _MOE : En passant la souris dessus, le message d'erreur apparait_

- [ ] Bug : Dès que l’on sélectionne plusieurs cases d’un même mois ou d’un même métier, cette sélection reste apparente (tirets roses) et cette sélection reste apparente sauf si je fais une autre sélection de une ou plusieurs cases
  - _MOE : Je le reproduis en faisant un copié. Pour que la sélection disparaisse, il faut coller la sélection ou appyuer sur "Echap" pour annuler la copie.

- [ ] Bug : Lorsque l’on sélectionne une case, si on monte ou on descend, le rectangle bleu reste au même endroit et le texte monte et descend
  - _MOE : L'ensemble du tableau se déplace vers le haut ou vers le bas pour permettre de toujours voir la cellule ayant le focus_


## Nicolas GOASCOZ (IFREMER)

- Points positifs :
  - Je trouve cela intéressant de voir l’historique du navire.  
  - « * » fonctionne au top pour filtrer dans un champ

### Calendriers d'activité 

- [ ] Remarque : « l’état » (en cours, pas saisis, saisis ou synchronisés)  ne sont pas très visibles comme précédemment à part la coche

- [ ] Remarque : Il ne faut qu’un seul clic pour accéder au navire alors que dans l’interface suivante il faut un double clic sur les divers champs (l’inverse serait top).
  - _MOE : Non, le simple clique permet de sélectionner une cellule. L'appuie de la touche "Entrée" permet de rentrer en édition._

### Calendriers d'activité > Calendrier

- [ ] Evo : 
  - [ ] Serait-il possible que certains raccourcis clavier fonctionne comme "tab" entre autre, après je ne sais si les autres utilisateurs sont avides des contrôles clavier. Sinon sur mon ordi, des fois ctrl+C et ctrl+V ne fonctionne pas ?!
    - _MOE : Oui, on peut envisager d'autres raccourcis claviers._
  - [ ] Par défaut activer le compactage des lignes lors de la 1ère utilisation de l'application par un utilisateur
  - [ ] Améliorer la fonctionnalité "Etendre" pour pouvoir étendre plusieurs cellules d'un même mois
  - [ ] Implémenter une fonctionnalité de sélection de cellules/colonnes/lignes via CTRL + clic 
  - [ ] Afficher une popup de confirmation pour enregistrer ou supprimer les données modifiées lors de l'utilisation de la touche F5. C'est déjaà le cas avec les bouton "Fermer", "Rafraichir", "Retour", "Accueil" et "Page précédente du navigateur"

- [ ] Bugs : 
  - [x] Par moment un ensemble d’incohérences sur les différents référentiels apparait
    - _MOE : Lié à la traduction de la page par Chrome. Désactiver la traduction pour le site pour corriger le problème_

![rec-activity-calendar-ref](/projects/activity-calendar/rec/images/rec-24-005-2.9.23.3-Référentiels_incohérents.PNG)

  - [x] Quand on supprime une colonne, seul le champ « actif » ne s’efface pas
    - _MOE : Lié à la traduction de la page par Chrome. Désactiver la traduction pour le site pour corriger le problème_

  - [ ] Quand on sélectionne un champ cela sélectionne l’ensemble de la colonne
    - _MOE : Non reproduit_

  - [ ] Impossibilité de sélectionner plusieurs colonnes (pour les supprimer par exemple)
    - _MOE : Si, en appyant sur "Shift"_

  - [ ] On ne peut copier l’ensemble d’un bloc métier (avec zone, gradient côte), on ne copie juste le nom du métier
    - _MOE : Si, en appuyant sur "Shift"_

  - [ ] Quand on fait F5 par erreur (ou lors d’un bug pour actualiser) cela supprime l’ensemble des mois saisis si on n’a pas sauvegardé avant !
    - _MOE Oui. A voir pour détecter un rafraichissement et proposer une sauvegarde s'il des modifications sont en cours_
  
  - [x] Des fois le champ « actif » (ou autre) me fait défaut, il affiche "ActifActifActif"
    - _MOE : Lié à la traduction de la page par Chrome. Désactiver la traduction pour le site pour corriger le problème_

![rec-activity-calendar-actif](/projects/activity-calendar/rec/images/rec-24-005-2.9.23.3-Actif.PNG)

  - [x] Les métiers que j'ai saisi hier n’apparaissent plus sur mon navire!
    - _MOE : Lié au ticket [#733](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/773)_

## Laurine Prevost (Ifremer)

### Calendriers d'activité > Calendrier

- [X] Dans Allegro nous avions un onglet commentaires, également présent dans Sumaris, mais l'onglet dans Sumaris est vide, il serait intéressant d'avoir les commentaires également dans Sumaris, peux être est ce déjà prévu.

- [X] Dans Allegro, j'utilisais beaucoup les raccourcis proposés :
  - Etirer jusqu'à
  - Copier vers les mois....
  - Copier le bloc metier vers les mois..

- [X] Dans allegro, nous pouvions ouvrir simultanément plusieurs bateaux, cette fonctionnalité était intéressante notamment pour comparer l'activité d'un même armateur possédant plusieurs navires, ou bien deux navires travaillant au chalut en bœuf par exemple. ou simplement garder un onglet navire ouvert parce qu'on travail dessus. Dans Sumaris j'ai l’impression qu'on est obligatoirement obligé de fermer un calendrier pour passer à un autre.
  - _MOE_ : On peut épingler les calendrier consultés ou ouvrir plusieurs onglets dans le navigateur

- [X] Il m'est arrivé de vouloir copier une colonne entière, mais les blocs métier ne se sont pas collés
  - _MOE : Lié au ticket [#733](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/773)_

- [X] L'onglet SACROIS présent dans SUMARIS ne présente pas les mêmes caractéristiques, que l'onglet prédoc SACROIS dans ALLEGRO ou dans la prédoc téléchargée sur le site du SIH. (Lorsque j'ai regardé pour le bateau MIREN LO 425329)
  - _MOE : Différence environnement de préproduction et production_

- [ ] D'ailleurs dans les prédoc sacrois du SIH et d'allegro, aux lignes "Zones" la zone de pêche est toujours suivie d'une "*" pour les bateaux géolocalisés. Cette "*" n'est pas présente dans la prédoc sacrois Sumaris, il pourrait être intéressant de la garder, car l'information est importante car fiable.
  - [X] Prévue dans une version ultérieure
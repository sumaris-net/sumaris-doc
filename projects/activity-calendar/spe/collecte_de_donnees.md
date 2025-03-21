# Collecte de données
## Spécifications (Calendrier d'activité)

---
## Sommaire

- [Documents](#documents)
- [Feuille de route](#feuille-de-route)
- [Gestion des droits](#gestion-des-droits)
- [Ergonomie générale](#ergonomie-générale)
- [Calendriers d'activité](#calendriers-dactivité)
- [Calendriers d'activité > Filtres](#calendriers-dactivité--filtres)
- [Calendrier d'activité > Import des calendriers vides](#calendriers-dactivité--import-des-calendriers-vides)
- [Calendrier d'activité > Général](#calendrier-dactivité--général)
- [Calendrier d'activité > Navire](#calendrier-dactivité--navire)
- [Calendrier d'activité > Calendrier](#calendrier-dactivité--calendrier)
- [Calendrier d'activité > Calendrier > Raccourcis](#calendrier-dactivité--calendrier--raccourcis)
- [Calendrier d'activité > Métiers](#calendrier-dactivité--métiers)
- [Calendrier d'activité > Carte](#calendrier-dactivité--carte)
- [Calendrier d'activité > Contrôle à la saisie](#calendrier-dactivité--contrôle-à-la-saisie)
- [Calendrier d'activité > Régionalisation](#calendrier-dactivité--régionalisation)
- [Calendrier d'activité > Rapports](/projects/activity-calendar/spe/restitution.md)


---
## Documents

- [Spec_Metier_Calendrier_Activite](/projects/activity-calendar/doc/Specification fonctionnalites. 02.01.2024.docx)

---
## Feuille de route

### Echéance

Allegro Calendrier d'activité est essentiellement utilisé les 3 premiers mois de l'année en métropole et tout au long de l'année en outre-mer.

Il faut donc compter sur une mise en production au plus tard mi janvier pour une utilisation vers la dernière semaine de janvier.

### Mode de saisie

30 à 40% des enquêtes sont des enquêtes directes (réalisés sur le terrain).

Les saisies bureau et tablette sont envisagées.

> Propositions validées : 
> - Dans un 1er temps : se focaliser sur la saisie bureau (pc) 
> - Dans un 2nd temps : se focaliser sur la saisie terrain (tablette/smartphone) sans prédocumentation et prévoir un mode déconnecté car les connexions internets ne sont pas stables en outre-mer

---
## Gestion des droits

**REF: ACTIVITY_CALENDAR/USERS_RIGHTS**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-users-rights.svg)

(1) : 
* Si l'utilisateur est de la société Ifremer, il voit tous les navires
* Si l'utilisateur n'est pas de la société Ifremer, il voit uniquement les navires des quartiers maritimes sur lesquels il a les droits

(2) : Seules les données non validées peuvent être modifiées ou supprimées

> Points de vigilance :
> - Certains quartiers d'immatriculation sont observés par 2 sociétés de prestation
> - Un navire peut changer de quartier d'immatriculation et donc de société de prestation et de saisisseur au cours d'une année :
>   - Chaque saisisseur voit l'ensemble des données du calendrier mais peut uniquement saisir les mois où il a les droits. Le mois du changement de QI doit être saisissable par le 1er saisisseur. Les 2 QI doivent être affichés sur le mois du changement.
>   - En mode connecté : pas de synchro donc pas de problème
>   - En mode déconnecté : synchro via les boutons "Terminer la saisie" > "Exporter", cas par onglet :
>     - "Général" : écrasement des données
>     - "Calendrier" : pas d'impact
>     - "Métiers" : ajout des métiers manquants
> - Donner la possibilité aux observateurs d'accéder à la prédoc sur le site web du SIH, actuellement ils passent par leur superviseur

#### Détails techniques :

* Administrateur de référentiels :
  * PERSON2USER_PROFIL = 1
  * PROGRAM2PERSON = vide
* Responsable de programme :
  * PERSON2USER_PROFIL = 3
  * PROGRAM2PERSON = 1
* Observateur :
  * PERSON2USER_PROFIL = 2
  * PROGRAM2PERSON = 2


---
## Ergonomie générale

**REF: ACTIVITY_CALENDAR/INTERFACE**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-tree.svg)

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-tree-expanded.svg)

L'interface est composée des éléments graphiques suivants :
1. Interface de gauche : Arbre du menu, interface récapitulative des onglets principaux
   * Permet de savoir ou on se trouve dans l'arbre du menu et de pouvoir naviguer dans les noeuds de l'arbre
2. Un bandeau horizontal, récapitulatif du calendrier d'activité
   * A la sélection d'un calendrier, le bandeau affiche les informations suivantes (séparées par un "-")
     * Lieu d'immatriculation du navire
     * Immatriculation du navire
     * Nom du navire
     * "Activité" + Année

#### Scénario principal

1. Le saisisseur clique sur un onglet de l'arbre du menu
   * Les informations propre à l'onglet s'ouvre dans l'interface centrale.

---
## Calendriers d'activité

**REF: ACTIVITY_CALENDAR**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-table.svg)

#### Scénario principal

1. Le saisisseur sélectionne le menu "Calendriers d'activité" dans l'interface de l'arbre du menu
2. L'écran "Calendriers d'activité" s'ouvre. Il contient les calendriers des navires du portefeuille du saisisseur.
Les informations suivantes sont affichées pour chaque calendrier :
   * L'état de saisie du calendrier :
     * "En cours de saisie" : _réprésenté par une icône :pencil2: dans la cellule_
     * "Terminé" : _réprésenté par une icône :heavy_check_mark: dans la cellule_
     * "Validé" : _réprésenté par une icône :white_check_mark: dans la cellule_
       * "Qualifié" : _réprésenté par une icône :checkered_flag: dans la cellule_ Pas en V1
   * Le navire (immatriculation + nom)
   * Le lieu d'immatriculation
   * L'année
   * L'objectif d'enquête directe ? (Oui/Non)
   * L'objectif d'enquête éco ? (Oui/Non)
   * Les observateurs
   * La date de modification du calendrier
   * Les commentaires
3. Le saisisseur peut activer un filtre les calendriers d'activité (REF: ACTIVITY_CALENDAR/FILTERS)
4. Le saisisseur accède à un calendrier d'activité (REF: ACTIVITY_CALENDAR/GENERAL)
5. Le saisisseur importe des calendriers d'activité vides (REF: ACTIVITY_CALENDAR/IMPORT)
   - Pour avoir cette fonctionnalité, il doit être administrateur ou responsable de programme
6. Le saisisseur peut supprimer un ou plusieurs calendriers
    - Pour avoir cette fonctionnalité, il doit être administrateur ou responsable de programme
   
#### Détails techniques

  * Objectif d'equête directe : donnée consultative issue de Festif
  * Objectif d'enquête éco : donnée consultative issue de la feuille de route (cf [mantis 61967](https://forge.ifremer.fr/mantis/view.php?id=61967))

---

## Calendriers d'activité > Filtres

**REF: ACTIVITY_CALENDAR/FILTERS**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-table-filters.svg)

Les filtres des calendriers d'activité sont accessibles depuis le tableau de consultation des calendriers d'activité :
* Directement dans le bandeau pour le filtre "Année"
  * Possibilité de sélectionnée une année dans la liste : Les calendriers de l'année sélectionnée sont affichés
* Via l'icône entonnoir pour les autres filtres

#### Scénario principal

1. Le filtre de l'année est automatiquement renseignée avec l'année :
    * N-1, sur pc
    * N, sur tablette
2. Le saisisseur filtre les calendriers d'activité (REF: COMMUN/FILTRES). Les critères de filtrage suivants sont disponibles :
   * Le programme de collecte
   * Le lieu d'immatriculation
   * Le port d'exploitation
   * Le navire
   * Le type de navire
     * La liste des types de navires est définit dans les options du programme ActiFlot ("Saisie > Navire: Type(s) de navire (filtre))"
   * Les observateurs
   * L'état
   * L'objectif d'enquête directe ?
   * L'objectif d'enquête éco ?
   * L'organisme de l'observateur : _pas en V1_

Les critères suivants sont multiples (dev en cours sur Imagine) :
  * Le navire
    * L'organisme d'observateur
  * L'observateur
  * L'état

**Variante(s) :**

**Variante :** Le saisisseur modifie le filtre sur l'année

2. Le saisisseur modifie le filtre sur l'année via la sélection de l'année ou de la valeur "vide" dans une liste déroulante [Retour en 2]

**Variante :** Le saisisseur enregistre le filtre

2. Le saisisseur renseigne le titre du filtre
3. Le saisisseur enregistre le filtre [Retour en 2]
  * Le nom du filtre apparait dans la liste déroulante

**Variante :** Le saisisseur sélectionne un filtre enregistré

2. Le saisisseur sélectionne un filtre enregistré [Retour en 2]
  * Le filtre est appliqué sur la liste des calendriers

**Variante :** Le saisisseur supprime le filtre

2. Le saisisseur sélectionne un filtre enregistré 
3. Le saisisseur clique sur l'icône poubelle
4. Le filtre est supprimé et n'apparait plus dans la liste

---

## Calendriers d'activité > Import des calendriers vides

**REF: ACTIVITY_CALENDAR/IMPORT**

L'import des calendriers d'activité vides est accessible depuis le tableau de consultation des calendriers d'activité pour les administrateurs et les responsables de programme.
Le fichier csv d'import est basé sur la feuille de route (cf [mantis 61967](https://forge.ifremer.fr/mantis/view.php?id=61967))

#### Scénario principal

1. Le responsable demande l'import des calendriers d'activité
2. Le responsable sélectionne le fichier csv contenant les calendriers d'activité à importer (Drag and Drop ou bouton "Parcourir")
3. Le responsable consulte l'avancement de l'import
   * L'avancement est disponible dans le bandeau de gauche dans la "Liste des tâches en cours"
4. Le responsable consulte le status de l'importation dans le bandeau de gauche dans les "Notifications"
   * Le status indique "succès" ou "erreur"
   * La date d'exécution est indiquée
   * Le rapport est disponible 
     * Le rapport indique les éléments suivants :
       * Insertion(s) : 0
       *  Mise(s) à jour : 1
       *  Avertissement(s) : 0
       *  Erreur(s) : 0
       *  Status: SUCCESS
   * En cas d'erreur ou d'avertissement, le responsable peut afficher le détail en cliquant sur le bouton "Afficher le journal"
5. Un saisisseur peut ensuite consulte et éditer les calendriers d'activité qui ont été importés

**Persistance des commentaire** : Les commentaires des calendriers N-1, important pour les saisisseurs, sont recopiés vers les calendriers de l'année N qui ont été importés.

---
## Calendrier d'activité > Général

**REF: ACTIVITY_CALENDAR/GENERAL**

**Notions importantes** 

![ui-concepts](/projects/activity-calendar/spe/images/important-concepts.png)

**Marée** : Période de mise en exploitation d’un navire de pêche professionnel comprise entre le départ et le retour à son port d’exploitation.

**Jour de mer** : Toute période continue de 24 heures (ou une partie de celle-ci) durant laquelle un navire est présent dans
une zone et absent du port (cf. décision (UE) 2019/910).

**Métier** : Groupe d'opérations de pêche ciblant un ensemble similaire d'espèces, effectué au moyen d'un engin similaire
durant la même période de l'année et/ou dans la même zone et caractérisé par un profil d'exploitation similaire
(cf. décision (UE) 2019/910).

**Navire actif** : Navire qui participe à une quelconque opération de pêche (d'un jour ou plus) au cours d'une année civile. 
Un navire qui n'a participé à aucune opération de pêche au cours d'une année civile est réputé « inactif » 
(cf. décision (UE) 2019/910).

**Engin de pêche** : Ensemble des éléments du dispositif de capture, mis à l’eau durant l’opération de pêche.

**Opération de pêche** : Action qui consiste à la mise en oeuvre d’un engin de pêche pour capturer des espèces aquatiques marines. 
L’opération débute quand l’engin est mis à l’eau et qu’il est pêchant, elle se termine quand l’engin est récupéré par le 
professionnel et que l’engin n’est plus pêchant.

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-general-comments.svg)

Les calendriers d'activité sont accessibles depuis le tableau de consultation des calendriers d'activité (REF: ACTIVITY_CALENDAR)

#### Scénario principal

1. Le saisisseur clique sur un calendrier d'activité
2. Le bandeau de l'écran affiche "Lieu d'immatriculation - Immatriculation du navire - Nom du navire - <b>Activité</b> <i>Année</i>"
3. L'écran "Calendrier d'activité" s'ouvre. Il est composé de 4 onglets :
   * "Général", onglet par défaut
   * "Navire"
   * "Calendrier"
   * "Métiers"
4. Dans l'onglet "Général", les informations suivantes sont affichées :
   * L'objectif d'enquête directe ? (Oui/Non/Opportuniste - non modifiable)
   * L'objectif d'enquête éco ? (Oui/Non - non modifiable)
   * Les observateurs (visible uniquement pour les administrateurs et responsables de programme) (par défaut contient le ou les saisisseurs qui ont modifié le calendrier)
     * Plusieurs observateurs peuvent être ajoutés
5. Le saisisseur renseigne les caractéristiques de l'enquête (par défaut les valeurs sont vides)
    * Qualification de l'enquête (Liste, valeur obligatoire), Fiabilité de l'enquête (Liste, valeur obligatoire), Inactivité annuelle confirmée par l'observateur (Oui/Non), Le professionnel accepterai-il de 
répondre à une autre enquête (Oui/Non), Métiers déclarés dans les journaux de bord/fiches de pêche (Liste), Habitudes de vente à la criée (Liste)
6. Un encart, à droite, affiche les information suivantes
    * La stratégie
    * Le nom, le prénom et la société des saisisseurs
    * La date de création
    * La date de mise à jour
    * Le mode de saisie (Bureau ou Terrain)
    * Un bouton permettant de terminer la saisie
      * L'étape suivante sera la validation de la saisie _Pas en V1_
6. Le saisisseur renseigne un commentaire
7. Le saisisseur enregistre
8. La date de mise à jour du calendrier est actualisée

**Variante(s) :**

**Variante :** Averstissement sur l'objectif d'enquête directe

5. Si l'objectif d'enquête directe est à "Oui" et que le saisisseur a sélectionné la qualification de l'enquête autre que "Directe", 
un avertissement est affiché [Retour en 6]

--- 

## Calendrier d'activité > Navire

**REF: ACTIVITY_CALENDAR/VESSELS**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-vessels-history.svg)

#### Scénario principal

1. Le saisisseur clique sur l'onglet "Navire". Il est composé de 3 tableaux d'information : 
   * Immatriculations du navire
   * Caractéristiques du navire
   * Armateurs
2. Les tableaux affichent toutes les données, par défaut paginés par 5 éléments :
    * Le tableau sur les immatriculations du navire contient :
        * Début immatriculation
        * Fin immatriculation
        * Immatriculation
        * Immatriculation internationale
        * Lieu d'immatriculation
    * Le tableau sur les caractéristiques du navire. Les informations qui changent d'une ligne à l'autre sont mises en gras. Le tableau contient :
      * Début validité
      * Fin validité
      * Nom
      * FPC ?
      * Puissance administrative (kW)
      * Longueur hors tout (m)
      * Tonnage jauge brute (TJB)
      * Tonnage (UMS)
      * Matériau de la coque
      * Port d'exploitation
    * Le tableau sur les armateurs du navire contient :
      * Début armement
      * Fin armement
      * Code armateur
      * Nom
      * Prénom
3. _En version 2_ : l'écran est composé de 2 onglets : Une zone contenant les informations citées plus haut ("Historique") et une zone contenant des photos du navire 
      * Par défaut, on affiche l'historique des photos sur 3 années précédentes par rapport à l'année du calendrier en cours de visualisation (date début au 1er Janvier)
      * Ce nombre d'année est paramètrable dans les préférences
      * Pour la visualisation d'un calendrier sur une année précédente, on affiche des photos sur 3 années précédentes et les photos des calendriers futurs
4. _En version 2_ : Le saisisseur clique sur l'onglet "Photos". L'onglet contient les photos ajoutées en cours de l'année en cours de visualisation
    * La date du jour peut être renseignée dans le titre de la photo (28/05/2024)
5. _En version 2_ : Le saisisseur ajoute des photos du navire

Une photo est associée au navire (VESSEL.ID) et à une période (CALENDAR_ACTIVITY).

---

## Calendrier d'activité > Calendrier

**REF: ACTIVITY_CALENDAR/PRINCIPALE**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-new.svg)
![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-predoc.svg)

#### Scénario principal

L'écran est composé d'un tableau de saisie du calendrier d'activité, mois par mois et, en dessous, d'un tableau sur la prédocumentation.
La zone de prédocumentation s'affiche/se masque par un bouton en bas de l'écran.

Le calendrier dispose de plusieurs actions :
- Un bouton + permettant d'ajouter un bloc métier
- Un bouton permettant de déplier les zones métier
- Un bouton permettant de replier les zones métier

Le calendrier dispose de 2 options dans la barre d'action :
- Une case à cocher permettant de compacter les lignes
- Une case à cocher permettant de replier les zones métier à la sauvegarde


1. Le saisisseur clique sur l'onglet "Calendrier"
2. Dans l'onglet "Calendrier", le saisisseur consulte le calendrier de l'année en cours. Pour chaque mois, les informations suivantes sont affichées :
    * L'armateur
    * Le lieu d'immatriculation
    * L'activité du navire ("Actif ?" ou "Inactif ?")
    * Le port d'exploitation
    * Le nombre de jours de mer
    * Le nombre de jours de pêche
    * Le nombre de personnes à bord
    * Le ou les métiers. Par défaut, les métiers sont dépliés si le calendrier est vide, repliés sinon
    * La ou les zones rattachées à chaque métier (maximum 2). 
      * Un astérisque à droite de la zone indique que celle-ci est issue de données de géolocalisation (VMS ou Recopesca) : _Pas en V1_
    * Le gradient de côte, le gradient de profondeur et la zone proche rattachée à chaque zone. Le gradient de profondeur et la zone proche sont visibles selon la zone de compétence sélectionnée
3. Le saisisseur affiche la prédocumentation. Par défaut, les sources "Enquête N-1" et "Sacrois-ObsDeb" sont affichées si elles existent. La zone d'affichage de la prédocumentation est ajustable.
4. Le saisisseur consulte la prédocumentation. Pour chaque mois et pour chaque source, les informations suivantes sont affichées :
   * La source
   * L'activité du navire
   * Le port d'exploitation
   * Le nombre de jours de mer
   * Le nombre de jours de pêche
   * Le nombre de personnes à bord
   * Le ou les métiers
   * La ou les zones rattachées à chaque métier (maximum 2). Un astérisque à droite de la zone indique que celle-ci est issue de données de géolocalisation (VMS ou Recopesca)
   * Le gradient de côte, le gradient de profondeur et la zone proche rattaché à chaque zone. Le gradient de profondeur et la zone proche sont visible selon la zone de compétence sélectionnée
5. Le saisisseur désélectionne la source de la prédocumentation qu'il ne souhaite pas réutiliser dans le calendrier de l'année en cours
   * Les mois correspondant à la source déselectionnée n'apparaissent plus dans la prédocumentation
6. Le saisisseur copie la prédocumentation dans le calendrier de l'année en cours
7. Le compteur de mois saisis présents sur le titre de l'onglet "Calendrier" apparait et indique le nombre de mois du calendrier ou l'activité du navire est renseignée
8. Les métiers présents dans le calendrier et ayant un engin associés sont ajoutés dans l'onglet "Métiers" à chaque sauvegarde
9. Le saisisseur peut effectuer les opérations suivantes sur la prédocumentation
    * Masquer/Afficher la prédocumentation
    * Tout déplier la zone métier
    * Tout replier la zone métier
10. Le saisisseur complète les données manquantes ou erronées pour chaque mois via une saisie manuelle, un étirement de cellules ou 
un copier/coller de cellules, d'une colonne ou d'une ligne depuis le calendrier ou depuis la prédocumentation. Les données concernées sont les suivantes :
   * L'activité du navire* :
     * Actif
     * Inatif : vide et rend non-modifiable les champs au-dessous sauf le port d'exploitation
   * Le port d'exploitation*
   * Le nombre de jours de mer
   * Le nombre de jours de pêche
   * Le nombre de personnes à bord
   * Un ou plusieurs métiers. Pour chaque métier, le saisisseur complète les données manquantes ou erronées :
     * Une ou deux zones. Une zone obligatoire pour chaque métier, y compris pour les métiers sans engin. Pour chaque zone, le saisisseur complète les données manquantes ou erronées :
         * Le gradient de côte*
         * Le gradient de profondeur (visible selon la zone de comptétence sélectionnée)
         * La zone proche (visible selon la zone de comptétence sélectionnée)
11. Le compteur de l'onglet "Calendrier" est mis à jour
12. Le saisisseur enregistre le calendrier
13. L'onglet "Métiers" est mis à jour avec les métiers distincts ayant un engin associé
14. Le compteur de l'onglet "Métiers" est mis à jour
15. Les blocs métiers sont repliés
   * Une case à cocher dans les options du calendrirer permet de tout replier à la sauvegarde
16. La date de mise à jour du calendrier est actualisée

**Variante(s) :**

**Variante :** Copier la prédocumentaion dans un calendrier de l'année en cours avec des données

6. Le saisisseur copie la prédocumentation dans un calendrier de l'année en cours avec des données, un message de confirmation
   s'affiche pour confirmer la suppression des données [Retour en 7]

**Variante :** Copier la prédocumentaion dans un calendrier de l'année en cours avec une zone de compétence différente de celle du calendrier

6. Le saisisseur copie la prédocumentation dans un calendrier de l'année en cours avec des données, un avertissement indique que les données
   en dehors de la zone de compétence n'ont pas pu être copiées [Retour en 7]

**Variante :** Copier des données incohérentes

10. Le saisisseur copie des données vers des données d'un autre type, un message bloquant s'affiche (exemple : copie du nombre de jours de mer vers le port d'exploitation) [Retour en 11]

**Variante :** Erreur nombre de jours en mer et nombre de jours de pêche

10. Le saisisseur saisit un nombre de jours de mer 0 à 1 ou supérieur à 31 ou un nombre de jours de pêche supérieur à 31, un message bloquant s'affiche [Retour en 15]

**Variante :** Erreur métier en doublon

10. Le saisisseur saisit un métier deux fois sur un mois (via copier-coller), un message s'affiche sur le ou les mois concernés et un message bloquant s'affiche à l'enregistrement. [Retour en 10]

**Variante :** Erreur zone en doublon

10. Le saisisseur saisit une zone deux fois sur un métier d'un mois (via copier-coller), un message s'affiche sur le ou les mois concernés et un message bloquant s'affiche à l'enregistrement. [Retour en 10]

**Variante :** Saisie non valide à l'enregistrement

12. Les lignes en erreures sont dépliées, les lignes valides sont repliées [Retour en 16]

**Variante :** Vider calendrier 

16. Le saisisseur vide le calendrier, l'ensemble des données saisies dans le calendrier sont supprimées. [Retour en 10]


#### Détails techniques :

* Sources de la prédocumentation :
  * Enquête N-1 : table ACTIVITY_CALENDAR avec :
      * PROGRAM_FK = 'SIH-ACTIFLOT'
      * YEAR = N-1
      * VESSEL_FK
  * Sacrois-ObsDeb : table ACTIVITY_CALENDAR avec :
      * PROGRAM_FK = 'SIH-ACTIPRED'
      * YEAR = N
      * VESSEL_FK
* L'activité du navire : dans les données historiques, la valeur "Inexistant" était également possible

> Questions :
> - MOE : En mode déconnecté : quelles infos importer en local ? Prédoc ?
> - MOE/EIS : Zones VMS visualisées avec un *, qui est déjà utilisé pour signaler les champs obligatoires. 
Info présente dans P08_SACROIS_PREDOC.SECT_1_IND_GEOLOC du schéma PRESTO
> - EIS : En mode tablette, prévoir un mode brouillon pour simplifier la saisie aux observateurs

---

## Calendrier d'activité > Calendrier > Raccourcis

**REF: ACTIVITY_CALENDAR/RACCOURCIS**

![ui-activity-calendar](/projects/activity-calendar/spe/images/raccourcis.png)

#### Scénario principal

1. Le saisisseur clique sur la touche F1 lorsqu'il est dans l'onglet "Calendrier"
2. Une fênêtre affiche les actions associées aux raccourcis clavier
3. Le saisisseur peut éditer le calendrier en utilisant les raccourcis clavier affichés

---

## Calendrier d'activité > Métiers

**REF: ACTIVITY_CALENDAR/METIERS**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-metiers.svg)

#### Scénario principal

1. Dans l'onglet "Métiers", le saisisseur consulte les métiers renseignés sur l'onglet "Calendrier" et les caractéristiques physiques et de mise en oeuvre associées. 
Seuls les métiers avec un engin sont présents. Les métiers sont triés par ordre de saisie dans l'onglet "Calendrier". 
2. Pour chaque métier, le saisisseur renseigne les valeurs d'une ou plusieurs caractéristiques
   * "Maillage étiré de l'engin (mm)", "Longueur levée (m), ..."
3. Le saisisseur enregistre le calendrier
4. La date de mise à jour du calendrier est actualisée


---
## Calendrier d'activité > Carte

**REF: ACTIVITY_CALENDAR/CARTE**

En version V2

A spécifier : en attente POC

- Prévoir un mode pour afficher la carte avec l'ensemble des données


## Calendrier d'activité > Contrôle à la saisie

**REF: ACTIVITY_CALENDAR/CONTROL**

Contrôles à la saisie et à la sauvegarde. Les contrôles suivants sont implémentés à la saisie : 
  - Présence de champs obligatoires, si Inactif renseigné
    - Port d'exploitation
  - Présence de champs obligatoires, si Actif renseigné
    - Port d'exploitation, métier
  - Présence de champs obligatoires, si Métier renseigné
    - Zone de pêche, distance à la côte
- Le nombre de jour de pêche et de mer doivent respecter un nombre minimum (0) et le nombre maximum (jours max calendar du mois)


Contrôle à la terminaison de la saisie

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-control-in-progress.svg)
![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-control-finished.svg)
![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-control-validated.svg)
![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-control-qualified.svg)

Le contrôle à la saisie est accessible depuis l'onglet "Général" d'un calendrier d'activité via le bouton "Terminer la saisie"

1. Dans l'onglet "Général", le saisisseur demande la terminaison de la saisie du calendrier
2. Le calendrier passe à l'état "Terminé"
3. La date de terminaison de la saisie est mise à jour

_ Pas en V1_ : 

4. Le superviseur consulte le calendrier
5. Le superviseur valide la saisie du calendrier
6. Le calendrier passe à l'état "Validé"
7. La date de validation de la saisie est mise à jour
8. Le calendrier n'est plus éditable
9. Le superviseur qualifie la saisie
10. Le calendrier est qualifié
11. La date de qualification de la saisie est mise à jour


**Variante(s) :**

**Variante :** Les 12 mois du calendrier ne sont pas saisis

2. L'onglet "Calendrier" s'ouvre
3. Le message bloquant "Veuillez corriger le(s) mois invalide(s)" s'affiche [Fin]

**Variante :** Inactivité annuelle incohérente

2. Si l'inactivité annuelle confirmée par l'observateur est à "Oui" et qu'au moins un mois est actif,
alors le message bloquant "Inactivité annuelle incohérente" s'affiche [Fin]

**Variante :** Inactivité annuelle à confirmer

2. Si tous les mois sont inactifs alors l'inactivié annuelle confirmée par l'observateur est obligatoire [Fin]

**Variante :** Le saisisseur reprend la saisie d'un calendrier terminé

4. Le saisisseur reprend la saisie d'un calendrier terminé
5. Le calendrier passe à l'état "En cours de saisie"
6. La date de terminaison de la saisie est supprimée [Retour en 1]

**Variante :** Le superviseur dévalide le calendrier non qualifié : _Pas en V1_

9. Le superviseur dévalide le calendrier
10. Le calendrier passe à l'état "Terminé" 
11. La date de validation de la saisie est supprimée [Fin]


**Variante :** Le superviseur dévalide le calendrier qualifié : _Pas en V1_

11. Le superviseur dévalide le calendrier
12. Le calendrier passe à l'état "Terminé" 
13. Les dates de validation et de qualification de la saisie sont supprimées [Fin]


## Calendrier d'activité > Régionalisation

**REF: ACTIVITY_CALENDAR/REGIONALISATION**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-regionalisation-activation.svg)

La régionalisation permet de limiter le nombre de valeurs dans les listes déroulantes pour éviter les erreurs de saisie.

Les champs concernés par la régionalisation sont les suivants :
 - Métier
 - Port
 - Zone de pêche
 - Gradient de côte (table DISTANCE_TO_COAST_GRADIENT)
 - Gradient de profondeur (table DEPTH_GRADIENT)
 - Zone proche (table NEARBY_SPECIFIC_AREA)

#### Scénario principal

La zone de compétence est à initaliser à la première connexion du saisisseur, dans les paramètres de l'utilisateurs : 
- Le saisisseur sélectionne dans le menu de gauche, l'option "Paramètres"
- Le saisisseur clique sur le bouton "AffICHER PLUS"
    * Il recherche l'option "Zone de compétence" dans la liste et ajoute la zone de compétence désirée
    * Il sauvegarde les paramètres

Il peut modifier la zone de compétence sur un calendrier :

1. Dans l'onglet calendrier, le saisisseur clique sur les options du calendrier
2. Le saisisseur déroule le menu "Zone de compétence ..."
3. Le saisisseur sélectionne une zone de compétence dans la liste
4. La zone de compétence est appliquée au calendrier courant
  * Les champs cités plus hauts sont limités dans leur valeur. Les valeurs disponibles correspondent à la zone de compétence activée.

**Variante(s) :**

**Variante :** Le saisisseur active une zone de compétence, sur un calendrier en cours de saisie dont le quartier d'immatriculation
des navires n'appartient pas à la zone de compétence.

4. La zone de compétence est appliquée au calendrier courant
  * Les champs dont les valeurs n'appartiennent pas à la zone de compétence sont en avertissements (fond de la cellule en orange)
  * La copie de la prédocumentation génére un avertissement : "Les valeurs en dehors de la zone de compétence n'ont pas été collées."
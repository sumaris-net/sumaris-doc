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
- [Calendrier d'activité > Métiers](#calendrier-dactivité--métiers)
- [Calendrier d'activité > Carte](#calendrier-dactivité--carte)
- [Calendrier d'activité > Contrôle à la saisie](#calendrier-dactivité--contrôle-à-la-saisie)



---
## Documents

- [Spec_Metier_Calendrier_Activite](/projects/activity-calendar/doc/Specification fonctionnalites. 02.01.2024.docx)

---
## Feuille de route

### Echéance

Allegro Calendrier d'activité est essentiellement utilisé les 3 premiers mois de l'année en métropole et tout au long de l'année en outre-mer.

Il faut donc compter sur une mise en production au plus tard le 30 Novembre pour une utilisation au 1er Janvier de l'année suivante.

### Mode de saisie

30 à 40% des enquêtes sont des enquêtes directes (réalisés sur le terrain).

Les saisies bureau et tablette sont envisagées.

> Proposition à valider : 
> - Dans un 1er temps : se focaliser sur la saisie bureau (pc) avec un mode déconnecté car les connexions internets ne sont pas stables en outre-mer
> - Dans un 2nd temps : se focaliser sur la saisie terrain (tablette/smartphone) sans prédocumentation

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
   * A la sélection d'un calendrier, le bandeau affiche les informations suivantes
     * Immatriculation du navire
     * Nom du navire
     * Année

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
     * "Qualifié" : _réprésenté par une icône :checkered_flag: dans la cellule_
   * Le programme
   * Le navire (immatriculation + nom)
   * Le lieu d'immatriculation
   * L'année
   * L'objectif d'enquête directe
   * L'objectif d'enquête éco
   * Les observateurs
   * Les commentaires
3. Le saisisseur filtre les calendriers d'activité (REF: ACTIVITY_CALENDAR/FILTERS)
4. Le saisisseur accède à un calendrier d'activité (REF: ACTIVITY_CALENDAR/GENERAL)
5. Le saisisseur importe des calendriers d'activité vides (REF: ACTIVITY_CALENDAR/IMPORT)

#### Détails techniques
  * Objectif d'equête directe : donnée consultative issue de Festif
  * Objectif d'enquête éco : donnée consultative issue de la feuille de route (cf [mantis 61967](https://forge.ifremer.fr/mantis/view.php?id=61967))

> Questions :
> - MOE : Vérifier les perfs liées à l'affichage du portefeuille des navires


---
## Calendriers d'activité > Filtres

**REF: ACTIVITY_CALENDAR/FILTERS**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-table-filters.svg)

Les filtres des calendriers d'activité sont accessibles depuis le tableau de consultation des calendriers d'activité :
* Directement dans le bandeau pour le filtre "Année"
* Via l'icône entonnoir pour les autres filtres

#### Scénario principal

1. Le filtre de l'année est automatiquement renseignée avec l'année :
    * N-1, sur pc
    * N, sur tablette
2. Le saisisseur filtre les calendriers d'activité (REF: COMMUN/FILTRES). Les critères suivants sont disponibles :
   * Le programme de collecte
   * Le lieu d'immatriculation
   * Le port d'exploitation
   * Le type de navire
   * Le navire
   * L'objectif d'enquête directe
   * L'objectif d'enquête éco
   * L'organisme de l'observateur
   * L'observateur
   * L'état
   * Le niveau de qualité (visible uniquement si l'état est "Qualifié")


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

**Variante :** Le saisisseur sélectionne un filtre enregistré

2. Le saisisseur sélectionne un filtre enregistré [Retour en 2]

---

## Calendriers d'activité > Import des calendriers vides

**REF: ACTIVITY_CALENDAR/IMPORT**

L'import des calendriers d'activité vides est accessibles depuis le tableau de consultation des calendriers d'activité par les administrateurs et les responsables de programme
Le fichier csv d'import est basé sur la feuille de route (cf [mantis 61967](https://forge.ifremer.fr/mantis/view.php?id=61967))

#### Scénario principal

1. Le saisisseur demande l'import des calendriers d'activité
2. Le saisisseur sélectionne le fichier csv contenant les calendriers d'activité à importer
3. Le saisisseur consulte l'avancement de l'import
4. Le saisisseur consulte le rapport d'import
5. Le saisisseur consulte les calendriers d'activité

---
## Calendrier d'activité > Général

**REF: ACTIVITY_CALENDAR/GENERAL**

**Jour de mer** : Toute période continue de 24 heures (ou une partie de celle-ci) durant laquelle un navire est présent dans
une zone et absent du port (cf. décision (UE) 2019/910).

**Métier** : Groupe d'opérations de pêche ciblant un ensemble similaire d'espèces, effectué au moyen d'un engin similaire
durant la même période de l'année et/ou dans la même zone et caractérisé par un profil d'exploitation similaire
(cf. décision (UE) 2019/910).

**Navire actif** : Navire qui participe à une quelconque opération de pêche (d'un jour ou plus) au cours d'une année civile. 
Un navire qui n'a participé à aucune opération de pêche au cours d'une année civile est réputé « inactif » 
(cf. décision (UE) 2019/910).

**Opération de pêche** : Action qui consiste à la mise en oeuvre d’un engin de pêche pour capturer des espèces aquatiques marines. 
L’opération débute quand l’engin est mis à l’eau et qu’il est pêchant, elle se termine quand l’engin est récupéré par le 
professionnel et que l’engin n’est plus pêchant.

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-general-comments.svg)

Les calendriers d'activité sont accessibles depuis le tableau de consultation des calendriers d'activité

#### Scénario principal

1. Le saisisseur clique sur un calendrier d'activité
2. Le bandeau de l'écran affiche "Navire : Immatriculation du navire - Nom du navire - <b>Activité Année</b>"
3. L'écran "Calendrier d'activité" s'ouvre. Il est composé de 5 onglets :
   * "Général", onglet par défaut
   * "Navire"
   * "Calendrier"
   * "Métiers"
4. Dans l'onglet "Général", les informations suivantes sont affichées :
   * L'objectif d'enquête directe (Oui/Non/Opportuniste - non modifiable)
   * L'objectif d'enquête éco (Oui/Non - non modifiable)
   * Les observateurs (visible uniquement pour les administrateurs et responsables de programme) (par défaut contient le ou les saisisseurs qui ont enregistré le calendrier)
   * La stratégie
   * Le nom, le prénom et la société de chaque observateur
   * La date de création
   * La date de mise à jour
   * Le mode de saisie (Bureau ou Terrain)
5. Le saisisseur renseigne les caractéristiques de l'enquête (par défaut les valeurs sont vides)
    * Qualification de l'enquête, Fiabilité de l'enquête, Inactivité annuelle confirmée par l'observateur, Le professionnel accepterai-il de 
répondre à une autre enquête, Métiers déclarés dans les journeaux de bord/fiches de pêche, Habitudes de vente à la criée ...
6. Le saisisseur saisit un commentaire
7. Le saisisseur enregistre le commentaire
8. Le commentaire apparait en haut de la liste des commentaires
9. Le saisisseur enregistre
10. La date de mise à jour du calendrier est actualisée


**Variante(s) :**

**Variante :** Warning objectif d'enquête directe

5. Si l'objectif d'enquête directe est à "Oui" et que le saisisseur a sélectionné la qualification de l'enquête autre que "Directe", 
un warning est affiché [Retour en 6]

--- 

## Calendrier d'activité > Navire

**REF: ACTIVITY_CALENDAR/VESSELS**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-vessels-history.svg)

#### Scénario principal

1. Le saisisseur clique sur l'onglet "Navire". Il est composé de 2 sous onglets : 
   * Historique (par défaut)
   * Photos
2. Le saisisseur consulte l'onget "Historique". Les tableaux affichent toutes les données, par défaut paginés par 5 éléments. L'onglet contient :
    * Un tableau sur les caractéristiques du navire. Les informations qui changent d'une ligne à l'autre sont mises en gras. Le tableau contient :
      * Début validité
      * Fin validité
      * Marquage extérieur
      * Nom
      * FPC ?
      * Puissance administrative (kW)
      * Longueur hors tout (m)
      * Tonnage jauge brute (TJB)
      * Tonnage (UMS)
      * Matériau de la coque
      * Port d'exploitation
    * Un tableau sur les immatriculations du navire, il contient :
      * Début immatriculation
      * Fin immatriculation
      * Immatriculation
      * Immatriculation internationale
      * Lieu d'immatriculation
    * Un tableau sur les armateurs du navire, il contient :
      * Début armement
      * Fin armement
      * Code armateur
      * Nom
      * Prénom
    * Une zone contenant l'historisation des photos du navire
      * Par défaut, on affiche l'historique des photos sur 3 années précédentes par rapport à l'année du calendrier en cours de visualisation (date début au 1er Janvier)
      * Ce nombre d'année est paramètrable dans les préférences
      * Pour la visualisation d'un calendrier sur une année précédente, on affiche des photos sur 3 années précédentes et les photos des calendriers futurs
3. Le saisisseur clique sur l'onglet "Photos". L'onglet contient les photos ajoutées en cours de l'année en cours de visualisation
    * La date du jour peut être renseignée dans le titre de la photo (28/05/2024)
4. Le saisisseur ajoute des photos du navire


Une photo est associée au navire (VESSEL.ID) et à une période (CALENDAR_ACTIVITY).

> Réunion du 26/06/2024 :
> - Tableau caractéristiques des navires : pas d'ajout de l'immat pour le moment


---
## Calendrier d'activité > Calendrier

**REF: ACTIVITY_CALENDAR/MAIN**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-new.svg)
![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-predoc.svg)

#### Scénario principal

L'écran est composé d'un tableau de saisie du calendrier d'activité, mois par mois et, en dessous, d'un tableau sur la prédocumentation.
La zone de prédocumentation s'affiche/se masque par un bouton en bas de l'écran.

1. Le saisisseur clique sur l'onglet "Calendrier"
2. Dans l'onglet "Calendrier", le saisisseur consulte le calendrier de l'année en cours. Pour chaque mois, les informations suivantes sont affichées :
    * L'armateur
    * Le lieu d'immatriculation
    * L'activité du navire
    * Le port d'exploitation
    * Le nombre de jours de mer
    * Le nombre de jours de pêche
    * Le nombre de personnes à bord
    * Le ou les métiers. Par défaut, les métiers sont dépliés si le calendrier est vide, repliés sinon
    * La ou les zones rattachées à chaque métier (maximum 2). Un astérisque à droite de la zone indique que celle-ci est issue de données de géolocalisation (VMS ou Recopesca)
    * Le gradient de côte, le gradient de profondeur et la zone proche rattachés à chaque zone. Le gradient de profondeur et la zone proche sont visibles selon la zone de compétence sélectionnée
3. Le saisisseur affiche la prédocumentation. Par défaut, les sources "Enquête N-1" et "Sacrois-ObsDeb" sont affichées si elles existent. La zone d'affichage de la prédocumentation est ajustable et peut être sauvegardée.
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
6. Le saisisseur copie la prédocumentation dans le calendrier de l'année en cours
7. Le compteur de mois saisis présents sur le titre de l'onglet "Calendrier" apparait et indique le nombre de mois du calendrier ou l'activité du navire est renseignée
8. Les métiers présents dans le calendrier et ayant un engin associés sont automatiquement ajoutés dans l'onglet "Métiers"
9. Le compteur de métiers présent sur le titre de l'onglet "Métiers" apparait et indique le nombre de métiers distincts et ayant un engin associé présents dans le calendrier
10. Le saisisseur masque la prédocumentation
11. Le saisisseur complète les données manquantes ou erronées pour chaque mois via une saisie manuelle, un étirement de cellules ou 
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
12. Le compteur de l'onglet "Calendrier" est mis à jour
13. L'onglet "Métiers" est mis à jour avec les métiers distincts ayant un engin associé
14. Le compteur de l'onglet "Métiers" est mis à jour
15. Le saisisseur enregistre le calendrier
16. Les blocs métiers sont repliés
17. La date de mise à jour du calendrier est actualisée

**Variante(s) :**

**Variante :** Copier la prédocumentaion dans un calendrier de l'année en cours avec des données

6. Le saisisseur copie la prédocumentation dans un calendrier de l'année en cours avec des données, un message de confirmation
   s'affiche pour confirmer la suppression des données [Retour en 7]

**Variante :** Copier des données incohérentes

11. Le saisisseur copie des données vers des données d'un autre type, un message bloquant s'affiche (exemple : copie du nombre de jours de mer vers le port d'exploitation) [Retour en 11]

**Variante :** Erreur nombre de jours en mer et nombre de jours de pêche

16. Le saisisseur saisit un nombre de jours de mer ou un nombre de jours de pêche inférieur à 0 ou supérieur à 31, un message bloquant s'affiche [Retour en 15]

**Variante :** Erreur métier en doublon

15. Le saisisseur saisit un métier deux fois sur un mois (via copier-coller), un message s'affiche sur le ou les mois concernés et un message bloquant s'affiche à l'enregistrement. [Retour en 15]

**Variante :** Erreur zone en doublon

15. Le saisisseur saisit une zone deux fois sur un métier d'un mois (via copier-coller), un message s'affiche sur le ou les mois concernés et un message bloquant s'affiche à l'enregistrement. [Retour en 15]

**Variante :** Saisie non valide à l'enregistrement

16. Les lignes en erreur sont dépliées, les lignes valides sont repliées [Retour en 15]

**Variante :** Vider calendrier 

16. Le saisisseur vide le calendrier, l'ensemble des données saisies dans le calendrier sont supprimées. [Retour en 15]


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


> Réunion du 23/05/2024 :
>
>   Ergonomie de saisi : Initialiser à Actif / Inactif, à voir à l'usage

> - **CRR : Réunion du 27/06/2024**
>   - MOA : ajouter min/max sur les nb de jours de mer, le nb de jours de pêche et nb de personnes à bord ? (présent dans l'allegro actuel à vérifier)
>   - **Réunion du 27/06/2024** : Oui, mettre en place un contrôle min (0) / max (nombre de jours max par mois). Le contrôle est bloquant 
>   - MOA : ajouter info bulle sur le nb de jours de mer et le nb de jours de pêche pour avoir le nb de jours et le nb d'heures ? (présent dans l'allegro actuel)
>   - **Réunion du 27/06/2024** : Non, pas besoin
>   - MOA : répercussion de la carac "Inactivité annuelle confirmée par l'observateur" sur l'activité des mois du calendrier ?
>   - Réunion du 27/06/2024** : Si inactif, tous les mois du calendrier sont en lecture seule (pas éditable). Armateur / Quartier maritime de renseigné / Port / Inactif à oui et le reste frisé (en P2). Contrôler la saisie si oui.
>     - MOA : modifier l'arborescence pour avoir le gradient côté au même niveau que la zone et supprimer le chevron "plier/déplier" sur la zone ?
>   - **Réunion du 27/06/2024** : Ok dév actuel
>   - MOA : lors de la saisie, toujours avoir un bloc métier vide pour eviter d'utiliser le bouton "+" ? (présent dans l'allegro actuel)
>   - **Réunion du 27/06/2024** : Non, pas besoin
>   - MOA : à l'enregistrement, supprimer les lignes ayant une zone vide ? avec possibilité de rajouter une zone via un menu contextuel ? (présent dans l'allegro actuel) ou toujours afficher les 2 zones pour avoir une arborescence identique
>   - **Réunion du 27/06/2024** : Non, ok dév actuel
>   - MOA : à l'enregistrement, replier l'arborescence pour voir uniquement les métiers, zones ?
>   - **Réunion du 27/06/2024** : On replie les métiers si contrôle OK, sinon si erreur de saisie, on déplie la ligne incomplète (si compliqué, en V2)
>   - Onglet navire : Historique / Immatriculation / Armateur : 
>   - **Réunion du 27/06/2024** : pouvoir paginer chaque tableau avec 4 affichés au minimum. Mise en évidence les éléments qui ont changés


---
## Calendrier d'activité > Métiers

**REF: ACTIVITY_CALENDAR/METIERS**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-metiers.svg)

#### Scénario principal

1. Dans l'onglet "Métiers", le saisisseur consulte les métiers sélectionnés sur l'onglet "Calendrier" et les caractéristiques physiques et de mise en oeuvre associées. 
Seuls les métiers avec un engin sont présents. Les métiers sont triés par ordre de saisie dans l'onglet "Calendrier". 
2. Pour chaque métier, le saisisseur renseigne les valeurs d'une ou plusieurs caractéristiques
3. Le saisisseur enregistre le calendrier
4. La date de mise à jour du calendrier est actualisée


---
## Calendrier d'activité > Carte

**REF: ACTIVITY_CALENDAR/CARTE**

A spécifier : en attente POC
Prévoir un mode pour afficher la carte avec l'ensemble des données


## Calendrier d'activité > Contrôle à la saisie

**REF: ACTIVITY_CALENDAR/CONTROL**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-control-in-progress.svg)
![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-control-finished.svg)
![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-control-validated.svg)
![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-control-qualified.svg)


Le contrôle à la saisie est accessible depuis l'onglet "Général" d'un calendrier d'activité via le bouton "Terminer la saisie"

1. Dans l'onglet "Général", le saisisseur demande la terminaison de la saisie du calendrier
2. Le calendrier passe à l'état "Terminé"
3. La date de terminaison de la saisie est mise à jour
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
3. Le message bloquant "Calendrier incomplet" s'affiche [Fin]

**Variante :** Inactivité annuelle incohérente

2. Si l'inactivité annuelle confirmée par l'observateur est à "Oui" et au moins un mois est actif,
alors le message bloquant "Inactivité annuelle incohérente" s'affiche [Fin]

**Variante :** Inactivité annuelle à confirmer

2. Si tous les mois sont inactifs alors l'inactivié annuelle confirmée par l'observateur est obligatoire [Fin]

**Variante :** Le saisisseur reprend la saisie d'un calendrier terminé

4. Le saisisseur reprend la saisie d'un calendrier terminé
5. Le calendrier passe à l'état "En cours de saisie"
6. La date de terminaison de la saisie est supprimée [Retour en 1]

**Variante :** Le superviseur dévalide le calendrier non qualifié

9. Le superviseur dévalide le calendrier
10. Le calendrier passe à l'état "Terminé" 
11. La date de validation de la saisie est supprimée [Fin]


**Variante :** Le superviseur dévalide le calendrier qualifié

11. Le superviseur dévalide le calendrier
12. Le calendrier passe à l'état "Terminé" 
13. Les dates de validation et de qualification de la saisie sont supprimées [Fin]


## Calendrier d'activité > Régionalisation

> Réunion du 23/05/2024 :
> 
> Régionalisation importante pour les métiers, les zones de pêche et les ports.
> 
> Pas de lien métier zone de pêche. De la zone dépend le distant de gradient de distance à la côte (référentiel).
>
> En mode tablette, activer le mode hors ligne
> 
> Configuration : Indiquer que l'on travail dans la zone de compétence
> 
> Ajouter la zone de compétence dans la popup de configuration du mode hors-ligne
> 
> Réunion prévue le 06/06/2024 (avec Armelle Rouyer)
> 
> * Champs concernés par la régionalisation :
* Métier
* Zone de pêche
* Gradient de côte : table DISTANCE_TO_COAST_GRADIENT
* Gradient de profondeur : table DEPTH_GRADIENT
* Zone proche : table NEARBY_SPECIFIC_AREA


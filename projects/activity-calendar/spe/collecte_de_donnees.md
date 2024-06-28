# Collecte de données
## Spécifications (Calendrier d'activité)

---
## Sommaire

- [Documents](#documents)
- [Feuille de route](#feuille-de-route)
- [Gestion des droits](#gestion-des-droits)
- [Ergonomie générale](#ergonomie-générale)
- [Calendriers d'activité](#calendriers-dactivité)
- [Calendriers d'activité > Filtres](#calendriers-dactivité-filtres)
- [Calendrier d'activité > Général](#calendrier-dactivité-général)
- [Calendrier d'activité > Navires](#calendrier-dactivité--navires)
- [Calendrier d'activité > Calendrier](#calendrier-dactivité-calendrier)
- [Calendrier d'activité > Métiers](#calendrier-dactivité-métiers)


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
>   - Chaque saisisseur voit l'ensemble des données du calendrier mais peut uniquement saisir les mois où il a les droits. Le mois du changement de QI doit être saisissable par les 2 saisisseurs. Les 2 QI doivent être affichés sur le mois du changement.
>   - En mode connecté : pas de synchro donc pas de problème
>   - En mode déconnecté : synchro via les boutons "Terminer la saisie" > "Exporter", cas par onglet :
>     - "Général" : écrasement des données
>     - "Calendrier" : gestion des données saisies sur le mois du changement ?
>     - "Métiers" : ajout des métiers, puis suppression manuelle des doublons
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


> Réunion du 23/05/2024 : 
> Liste des données filtrées en fonction des droits : OK, En place 

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

Calendrier d'activité :

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-table.svg)

#### Scénario principal

1. Le saisisseur sélectionne le menu "Calendriers d'activité" dans l'interface de l'arbre du menu
2. L'écran "Calendriers d'activité" s'ouvre. Il contient les calendriers des navires du portefeuille du saisisseur.
Les informations suivantes sont affichées pour chaque calendrier :
   * L'état de saisie du calendrier :
     * "Non saisi" : _réprésenté par une icône ? dans la cellule_
     * "En cours de saisie" : _réprésenté par une icône :pencil2: dans la cellule_
     * "Terminé" : _réprésenté par une icône :heavy_check_mark: dans la cellule_
     * "Qualifié" : _réprésenté par une icône :checkered_flag: dans la cellule_
   * Le navire (code + libellé)
   * L'année
   * L'objectif d'enquête directe
   * L'enquête éco
   * Les saisisseurs
3. Le saisisseur filtre les calendriers d'activité (REF: ACTIVITY_CALENDAR/FILTERS)
4. Le saisisseur accède à un calendrier d'activité (REF: ACTIVITY_CALENDAR/GENERAL)

#### Détails techniques
  * Objectif d'equête directe : donnée consultative issue de Festif
  * Enquête éco : donnée consultative issue de la feuille de route, cf mantis 61967

> Questions :
> - EIS : Prévoir POC pour vérifier les perfs liées à l'affichage du portefeuille des navires
> - MOE : Stockage saisisseur en cas de saisisseurs multiples ?



---
## Calendriers d'activité > Filtres

**REF: ACTIVITY_CALENDAR/FILTERS**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-table-filters.svg)

Les filtres des calendriers d'activité sont accessibles depuis le tableau de consultation des calendriers d'activité via l'icône entonnoir.

#### Scénario principal

1. Le saisisseur filtre les calendriers d'activité (REF: COMMUN/FILTRES). Les critères suivants sont disponibles :
   * Le programme de collecte
   * L'état
   * Le navire
   * L'année
   * L'objectif d'enquête directe
   * L'enquête éco
   * L'organisme du saisisseur
   * Le saisisseur
2. L'année est automatiquement renseignée avec l'année :
   * N-1, sur pc
   * N, sur tablette

Les critères suivants sont multiples (dev en cours sur Imagine) :
  * L'état
  * Le navire
  * L'organisme du saisisseur
  * Le saisisseur

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

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-new-general.svg)

Les calendriers d'activité sont accessibles depuis le tableau de consultation des calendriers d'activité

#### Scénario principal

1. Le saisisseur clique sur un calendrier d'activité
2. Le bandeau de l'écran affiche "Navire : Immatriculation du navire - Nom du navire - <b>Activité Année</b>"
3. L'écran "Calendrier d'activité" s'ouvre. Il est composé de 5 onglets :
   * "Général", onglet par défaut
   * "Navires"
   * "Calendrier"
   * "Métiers"
   * "Zones d'activité"
4. Dans l'onglet "Général", les informations suivantes sont affichées :
   * L'objectif d'enquête directe (Oui/Non - non modifiable)
   * L'enquête éco (Oui/Non - non modifiable)
   * La stratégie
   * Le nom du saisisseur
   * La société du saisisseur
   * La date de création
   * La date de mise à jour
   * Le mode de saisie (Bureau ou Déconnecté)
5. Le saisisseur renseigne les caractéristiques de l'enquête (par défaut les valeurs sont vides)
    * Qualification de l'enquête, Fiabilité de l'enquête, Inactivité annuelle confirmée par l'observateur, ...
6. Le saisisseur saisit un commentaire
7. Le saisisseur enregistre
8. La date de mise à jour du calendrier est actualisée


**Variante(s) :**

**Variante :** Objectif d'enquête directe à "Oui"
4. Si la valeur de l'objectif d'enquête directe est à "Oui" et la valeur du champ "Qualification de l'enquête" n'est pas "Directe"
un warning est affiché.

**Variante :** Inactivité annuelle confirmée par l'observateur" à "Oui"
5. si la valeur de l'inactivité annuelle confirmée par l'observateur est à Oui" alors tous les mois passent à "Inactif"
A la terminaison de la saisie, si "inactivité annuelle confirmée par l'observateur" à Oui" et au moint un mois actif alors le système affiche une erreur bloquante

**Variante :** Enregistrement
7. A l'enregistrement, si la saisie est valide, on replit la ligne des métiers, sinon, on laisse les lignes en erreur dépliées et on plie le reste (complexité à analyser)

#### Détails techniques :
  * Pour faciliter les développements, pendant toute la durée des développements, le programme, l'année et le navire sont affichés sur l'écran
  * Caractéristiques du calendrier d'activité :
    * Origine : PMFM_STRATEGY avec :
      * STRATEGY.PROGRAM_FK "SIH-ACTIFLOT"
      * APPLIED_PERIOD.START_DATE <= date de vente < APPLIED_PERIOD.END_DATE + 1 où APPLIED_PERIOD.APPLIED_STRATEGY_FK = APPLIED_STRATEGY.ID 
      * PMFM_STRATEGY.ACQUISITION_LEVEL_FK = ACTIVITY_CALENDAR
    * Caractère obligatoire : PMFM_STRATEGY.IS_MANDATORY 
    * Ordre d'affichage : PMFM_STRATEGY : RANK_ORDER
  * Qualification de l'enquête : prévoir une option pour limiter les valeurs possibles aux QUALITATIVE_VALUE.ID = 965, 966, 967, 2555

> Réunion du 23/05/2024 :
> Gestion des commentaires : Solution technique à faire mais spécifier le besoin avant
> Avoir une zone commentaire - Ne pas mettre sur chaque ligne d'historique - A maquetter
> Prévoir POC pour le commentaire/date/initiales


---
## Calendrier d'activité > Général > Gestion des conflits

Réunion 27/06/2024 : 
- Pas un vrai besoin. Pas vraiment utile. 
- La régle : Un seul saisisseur peut saisir sur un mois.

Dans le cas ou il y a un changement de quartier d'immatriculation, seul un saisisseur à les droits de saisie sur le mois du changement
- P1 : gérer l'affichage de saisisseurs multiples
- P2 : gestion fine des conflits (à confirmer suivant l'utilisation)

Information : Il existe un annuaire des observateurs par quartier maritime pour avoir liste disponible sur le site SIH

--- 



-- 
## Calendrier d'activité > Navires

**REF: ACTIVITY_CALENDAR/VESSELS**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-vessels-history.svg)

#### Scénario principal

1. Le saisisseur clique sur l'onglet "Navire". Il est composé de 2 sous onglets : 
   * Historique (par défaut)
   * Photos
2. Le saisisseur consulte l'onget "Historique", il contient les états des changements des caractéristiques et des armateurs du navire sur les X dernières années :
    * Un tableau sur les caractéristiques du navire
      * La dernière cellule de la ligne d'une caractéristique du navire permet d'ajouter/afficher des photos
    * Un tableau sur les immatriculations du navire
    * Un tableau sur les armateurs du navire (pagination avec 4-5 éléments par page pour voir les 3 tableaux sans scroller)
      * Sur chaque tableau, toutes les années sont affichées 
      * Les informations qui changent d'une ligne à l'autre sont mises en évidence
    * Un zone contenant l'historisation des photos du navire
      * Par défaut, on affiche l'historique des photos sur 3 années précédentes par rapport à l'année du calendrier en cours de visualisation (date début au 1er Janvier)
      * Ce nombre d'année est paramètrable dans les préférences
      * Pour la visualisation d'un calendrier sur une année précédente, on affiche des photos sur 3 années précédentes et les photos des calendriers futurs
3. Le saisisseur clique sur l'onglet "Photos". L'onglet contient les photos ajoutées en cours de l'année en cours de visualisation
    * La date du jour peut être renseignée dans le titre de la photo (28/05/2024)
4. Le saisisseur ajoute des photos du navire
5. Il est possible de modifier l'ordre des colonnes de chaque tableau  (...) et de sauvegarder cet ordre


Une photo est associée au navire (VESSEL.ID) et à une période (CALENDAR_ACTIVITY).

> Réunion du 26/06/2024 :
> - Tableau caractéristiques des navires : pas d'ajout de l'immat pour le moment, carac technique et fpc à droite


> Questions MOA 

> Filtrage de période pour l'historique des photos des navires. Combien d'année ? 

---
## Calendrier d'activité > Calendrier

**REF: ACTIVITY_CALENDAR/MAIN**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-new.svg)

#### Scénario principal

L'écran est composé d'un tableau de saisie du calendrier d'activité, mois par mois et, en dessous, d'un tableau sur la prédocumentation.
La zone de prédocumentation s'affiche/se masque par un bouton en bas de l'écran.

1. Dans l'onglet "Calendrier", le saisisseur affiche la prédocumentation par un bouton. Par défaut, les sources "Enquête N-1 indirecte" et "SACROIS-OBSDEB" sont affichées. La zone d'affichage de la prédocumentation est ajustable et peut être sauvegardée. 
2. Le saisisseur consulte la prédocumentation. Pour chaque mois et pour chaque source, les informations suivantes sont affichées :
   * L'armateur
   * Le quartier d'immatriculation
   * L'activité du navire*
   * Le port d'exploitation ou de rattachement*
   * Le nombre de jours de mer
   * Le nombre de jours de pêche
   * Le nombre d'hommes à bord par marée
   * Le ou les métiers
   * La ou les zones rattachées à chaque métier (maximum 2). Un astérisque à droite de la zone indique que celle-ci est issue de données de géolocalisation (VMS ou Recopesca)
   * Le gradient de côte rattaché à chaque zone
3. Le saisisseur sélectionne les données de la prédocumentation à réutiliser dans le calendrier de l'année en cours 
   (un ou plusieurs mois d'une source et/ou un ou plusieurs blocs métiers)
4. Le saisisseur masque la prédocumentation par un bouton
5. Le saisisseur complète les données manquantes ou erronées pour chaque mois :
   * L'activité du navire* :
     * Actif
     * Inatif : vide et rend non-modifiable les champs au-dessous sauf le port d'exploitation ou de rattachement
   * Le port d'exploitation ou de rattachement*
   * Le nombre de jours de mer
   * Le nombre de jours de pêche
   * Le nombre d'hommes à bord par marée
   * Un ou plusieurs métiers. Pour chaque métier, le saisisseur complète les données manquantes ou erronées :
     * Une ou deux zones. Pour chaque zone, le saisisseur complète les données manquantes ou erronées :
         * Les gradients 
           * De côte*
           * De profondeur (visibilité définie par une option du programme)
         * La zone proche (visibilité définie par une option du programme)
         * Les gradients et la zone sont affichés mais repliés par défaut
6. Le saisisseur enregistre le calendrier
7. La date de mise à jour du calendrier est actualisée

**Variante(s) :**

**Variante :** Warning plus de 5 métiers
5. Le saisisseur saisit plus de 5 métiers sur un mois, un message d'avertissement s'affiche. [Retour en 6]

**Variante :** Erreur métier en doublon
5. Le saisisseur saisit un métier deux fois sur un mois (via copier-coller ou synchro), un message bloquant s'affiche. [Retour en 4]

**Variante :** Vider calendrier
5. Le saisisseur vide le calendrier, l'ensemble des données saisies dans le calendrier sont supprimées. [Retour en 4]

**Variante :** Vérification du nombre de jours en mer et de pêche
2. A la validation, le traitement vérifie que les valeurs du nombre de jours en mer et de pêche sont comprises entre les valeurs 
minimale et maximale (de 0 au nombre de jours maximum pour le mois). L'erreur est bloquante si cette règle n'est pas respectée.


#### Détails techniques :
* Sources de la prédocumentation :
  * Enquête N-1 indirecte : table ACTIVITY_CALENDAR avec :
      * PROGRAM_FK = 'SIH-ACTIFLOT'
      * YEAR = N-1
      * VESSEL_FK
  * SACROIS-OBSDEB : table ACTIVITY_CALENDAR avec :
      * PROGRAM_FK = 'SIH-ACTIPRED'
      * YEAR = N
      * VESSEL_FK
* L'activité du navire : dans les données historiques, la valeur "Inexistant" était également possible
* Le port d'exploitation ou de rattachement : 
  * LOCATION.LOCATION_LEVEL_FK = 6 (Port - Point de débarquement)
  * Filtré selon la zone de compétence sélectionnée
* Le nombre de jours de mer : PMFM.ID = 241
* Le nombre de jours de pêche : PMFM.ID = 242
* Le nombre d'hommes à bord par marée : PMFM.ID = 109
* Champs concernés par la régionalisation :
  * Métier
  * Zone
  * Gradient de côte : table DISTANCE_TO_COAST_GRADIENT
  * Gradient de profondeur : table DEPTH_GRADIENT
  * Zone proche : table NEARBY_SPECIFIC_AREA

> Questions :
> - MOE : Faire vidéo pour les cas d'utilisation du copier, coller, étirer, effacer
> - MOE : En mode déconnecté : quelles infos importer en local ? Prédoc ?
> - MOE : Conserver uniquement les raccourcis CTRL+C et CTRL+V
> - MOE/EIS : Zones VMS visualisées avec un *, qui est déjà utilisé pour signaler les champs obligatoires. 
Info présente dans P08_SACROIS_PREDOC.SECT_1_IND_GEOLOC du schéma PRESTO
> - MOE : Renommer le paramètre "Nb d'hommes à bord" en "Nb de personnes à bord"
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



Actions possibles sur une cellule dans l'Allegro actuel :
  * Copier
    * Copier (CTRL + C)
    * Copier la colonne (CTRL + E)
    * Copier vers les mois
    * Copier le bloc métier (CTRL + B)
    * Copier le bloc zone/gradient
    * Copier les blocs zone/gradient de la ligne (CTRL + D)
    * Copier le bloc gradient
    * Etirer jusqu'à
    * Etirer le bloc métier jusqu'à
    * Etirer le bloc zone/gradient jusqu'à
    * Etirer le bloc gradient jusqu'à
    * Copier le bloc métier vers les mois (CTRL + Q)
    * Copier le bloc zone/gradient vers les mois
    * Copier le bloc gradient vers les mois
    * Copier la ligne vers [xxx] (CTRL + D) (uniquement pour les lignes "Nombre de jours de mer" et "Nombre de jours de pêche")
  * Coller
    * Coller (CTRL + V)
    * Coller vers les mois
    * Coller la colonne (CTRL + V)
    * Coller la colonne vers les mois
    * Coller le bloc métier (CTRL + V)
    * Coller le bloc métier vers les mois
    * Coller les blocs métier sur la ligne (CTRL + V)
  * Effacer
    * Effacer (CTRL + X)
    * Effacer la colonne
    * Effacer le contenu de la ligne
    * Effacer le calendrier complet
    * Effacer le bloc métier (CTRL + X)
    * Effacer les blocs de ce métier des mois
  * Ajouter un métier
  * Ajouter un zone à ce métier
  * Agrandir tous les métiers
  * Réduire tous les métiers
  * Agrandir tous les gradients côte/profondeur/zone proche
  * Réduire tous les gradients côte/profondeur/zone proche

---
## Calendrier d'activité > Métiers

**REF: ACTIVITY_CALENDAR/METIERS**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-metiers.svg)

#### Scénario principal

1. Dans l'onglet "Métiers", le saisisseur consulte les métiers sélectionnés sur l'onglet "Mois d'activité" et les caractéristiques associés
2. Pour chaque métier, le saisisseur renseigne les valeurs d'une ou plusieurs caractéristiques
3. Le saisisseur enregistre le calendrier
4. La date de mise à jour du calendrier est actualisée

Si on enlève un métier saisi dans l'onglet Calendrier, il disparait de la liste.

L'ordre des métiers du tableau dépend de l'ordre de saisi dans l'onglet Calendrier.


**Variante(s) :**

**Variante :**

Cas d'un calendrier partagé où l'import des données du saisisseur 2 en local est réalisé avant la saisie du saisisseur 1
et où la saisie du saisisseur 2 est réalisé en mode hors-ligne après la saisie du saisisseur 1 :
2. Le saisisseur supprime les métiers en doublon. Puis ajoute un métier qu'il a supprimé par inadvertance ? [Retour en 2]

---
## Calendrier d'activité > Carte

**REF: ACTIVITY_CALENDAR/Carte**

A spécifier : en attente POC
Prévoir un mode pour afficher la carte avec l'ensemble des données

## Calendrier d'activité > Rapports

![ui-activity-calendar-report](/projects/activity-calendar/doc/screenshots/Capture_rapport_engin_label.png)

- Libellé du métier :
  * Afficher le label METIER.LABEL et sur une autre ligne, afficher le champ METIER.NAME
    * Si le champ METIER.NAME est trop long, tronquer et afficher ...

- Rapport "Editer rapport"
  * Qualification de l'enquête - Tous présents (y comprit non réalisable)
  * Observateur : si + de 2, mettre Nom et prénom sur la même ligne

## Calendrier d'activité > Instanciation des calendriers vides

Dans l'application (responsable de programme) : Importer un Csv (liste navires)

Rajout d'une fonction d'export (_Faible cout de développement_)
 
Se baser sur le format "feuille de route pour l'activité 2023 en 2024" : https://forge.ifremer.fr/mantis/view.php?id=61967
    * Manque un flag enquête éco dans le format

Ajouter une fonction de suppression d'un calendrier pour corriger les erreurs lors de l'import

> Réunion du 23/05/2024 :
> Initialisation des calendriers sur une année : Navires inscrit au FPC

> - Dans Allegro on ne peut pas créer de calendrier : OK
> 
    >   - Proposer une fonction d'importation de calendrier de l'année sur l'écran du tableau des calendriers
>
>   - Mantis [61967](https://forge.ifremer.fr/mantis/view.php?id=61967): [FDR][ACTIVITE] evol : feuille de route pour l'activité 2023 en 2024

---

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


---

## Historique

|       Date | Sections mises à jour                                                                         |
|-----------:|-----------------------------------------------------------------------------------------------|
| 21/11/2023 | Création                                                                                      |

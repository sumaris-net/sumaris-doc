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
> - ISI : Stockage saisisseur en cas de saisisseurs multiples ?
> - ISI : Prévoir traitement pour charger les calendriers vides

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
2. Le bandeau de l'écran affiche "Immatriculation du navire - Nom du navire - <b>Activité Année</b>"
3. L'écran "Calendrier d'activité" s'ouvre. Il est composé de 4 onglets :
   * "Général", onglet par défaut
   * "Mois d'activité"
   * "Métiers"
   * "Zones d'activité"
4. Dans l'onglet "Général", les informations suivantes sont affichées :
   * La stratégie
   * L'état des changements des caractéristiques et des armateurs du navire
5. Le saisisseur renseigne (par défaut les valeurs sont vides) :
   * L'objectif d'enquête directe
   * L'enquête éco
   * Les caractéristiques de l'enquête
6. Le saisisseur saisit un commentaire
7. Le saisisseur enregistre
8. La date de mise à jour du calendrier est actualisée

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

> Questions :
> - EIS : Prévoir POC pour le commentaire/date/initiales
> - MOA : Remonter les carac et le commentaire au-dessus de l'état des changements des carac et des armateurs ?

---
## Calendrier d'activité > Calendrier

**REF: ACTIVITY_CALENDAR/MAIN**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-new.svg)

#### Scénario principal

1. Dans l'onglet "Mois d'activité", le saisisseur consulte la prédocumentation. Pour chaque mois et pour les sources "Enquête N-1 indirecte" et "SACROIS-OBSDEB", les informations suivantes sont affichées :
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
2. Le saisisseur sélectionne les données de la prédocumentation à réutiliser dans le calendrier de l'année en cours 
   (un ou plusieurs mois d'une source et/ou un ou plusieurs blocs métiers)
3. Le saisisseur complète les données manquantes ou erronées pour chaque mois :
   * L'activité du navire* :
     * Actif
     * Inatif : vide et rend non-modifiable les champs au-dessous sauf le port d'exploitation ou de rattachement
   * Le port d'exploitation ou de rattachement*
   * Le nombre de jours de mer
   * Le nombre de jours de pêche
   * Le nombre d'hommes à bord par marée
   * Un ou plusieurs métiers. Pour chaque métier, le saisisseur complète les données manquantes ou erronées :
     * Une ou deux zones. Pour chaque zone, le saisisseur complète les données manquantes ou erronées :
         * Le gradient de côte*
         * Le gradient de profondeur (visibilité définie par une option du programme)
         * La zone proche (visibilité définie par une option du programme)
4. Le saisisseur enregistre le calendrier
5. La date de mise à jour du calendrier est actualisée

**Variante(s) :**

**Variante :** 
3. Le saisisseur saisit plus de 5 métiers sur un mois, un message d'avertissement s'affiche. [Retour en 3]

**Variante :** 
4. Le saisisseur vide le calendrier, l'ensemble des données saisies dans le calendrier sont supprimées. [Retour en 3]

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
* Le gradient de côte : filtrée en fonction de la zone sélectionnée
* Le gradient de profondeur : table DEPTH_GRADIENT, filtrée en fonction de la zone sélectionnée
* La zone proche : table NEARBY_SPECIFIC_AREA, filtrée en fonction de la zone sélectionnée

> Questions :
> - ISI : Faire vidéo pou les cas d'utilisation du copier, coller, étirer, effacer
> - ISI : En mode déconnecté : quelles infos importer en local ? Prédoc ?
> - ISI : Conserver uniquement les raccourcis CTRL+C et CTRL+V
> - ISI : Comment fonctionne la réorganisation des métiers ?
> - ISI/EIS : Zones VMS visualisées avec un *, qui est déjà utilisé pour signaler les champs obligatoires. 
Info présente dans P08_SACROIS_PREDOC.SECT_1_IND_GEOLOC du schéma PRESTO
> - ISI : Renommer le paramètre "Nb d'hommes à bord" en "Nb de personnes à bord"
> - EIS : En mode tablette, prévoir un mode brouillon pour simplifier la saisie aux observateurs
> - MOA : Valeur par défaut option du programme pour afficher/masquer le gradient de profondeur et la zone proche ?
> - MOA : Champs concernés par la régionalisation ?

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

---
## Historique

|       Date | Sections mises à jour                                                                         |
|-----------:|-----------------------------------------------------------------------------------------------|
| 21/11/2023 | Création                                                                                      |

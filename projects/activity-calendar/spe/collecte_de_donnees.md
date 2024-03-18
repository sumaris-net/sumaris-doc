# Collecte de données
## Spécifications (Calendrier d'activité)

---
## Sommaire

- Calendrier d'activité mensuelle
- Actions
- Historique

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
* Si l'observateur est de la société Ifremer, il peut consulter, modifier et supprimer tous les calendriers d'activité non validés
* Si l'observateur n'est pas de la société Ifremer, il peut consulter, modifier et supprimer uniquement les calendriers créés par sa société et non validés

(2) : Seules les données non validées peuvent être modifiées ou supprimées

Cheminement de la donnée : collecte > saisie > validation > correction éventuelle


#### Détails techniques :
* Administrateur de programme :
  * PERSON2USER_PROFIL = 1
  * PROGRAM2PERSON = vide
* Responsable de programme :
  * PERSON2USER_PROFIL = 3
  * PROGRAM2PERSON = 1
* Observateur :
  * PERSON2USER_PROFIL = 2
  * PROGRAM2PERSON = 2

> Points de vigilance : 
> - Certains quartier d'immatriculation sont observés par 2 sociétés de prestation 
> - Un navire peut changer de quartier d'immatriculation et donc de société de prestation

---
## Ergonomie générale

**REF: ACTIVITY_CALENDAR/INTERFACE**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-tree.svg)

L'interface est composée des éléments graphiques suivants :
1. Interface de gauche : Arbre du menu, interface récapitulative des onglets principaux
   * Permet de savoir ou on se trouve dans l'arbre du menu et de pouvoir naviguer dans les noeuds de l'arbre
2. Un bandeau horizontal, récapitulatif du calendrier d'activité
   * A la sélection d'un calendrier, le bandeau affiche les informations suivantes
     * Immatriculation du navire
     * Nom du navire
     * Année

#### Scénario principal

1. L'observateur clique sur un onglet de l'arbre du menu
   * Les informations propre à l'onglet s'ouvre dans l'interface centrale.

---
## Calendriers d'activité

**REF: ACTIVITY_CALENDAR**

Calendrier d'activité :

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-table.svg)

#### Scénario principal

1. Le saisisseur sélectionne le menu "Calendriers d'activité" dans l'interface de l'arbre du menu
2. L'écran "Calendriers d'activité" s'ouvre. Les informations suivantes sont affichées pour chaque navire :
   * L'état de saisie du calendrier :
     * "Non saisi" : _réprésenté par une icône ? dans la cellule_
     * "En cours de saisie" : _réprésenté par une icône :pencil2: dans la cellule_
     * "Terminé" : _réprésenté par une icône :heavy_check_mark: dans la cellule_
     * "Qualifié" : _réprésenté par une icône :checkered_flag: dans la cellule_
   * Le navire (code + libellé)
   * L'année
   * L'enquête
   * Le flag éco
   * Les saisisseurs

**Variante(s) :**

**Variante 1a :** L'observateur filtre les calendriers d'activité (REF: ACTIVITY_CALENDAR/FILTERS)

**Variante 1b :** L'observateur crée un nouveau calendrier d'activité (REF: ACTIVITY_CALENDAR/GENERAL)

**Variante 1c :** L'observateur consulte un calendrier d'activité existant

> Questions :
> - EIS : Prévoir POC pour vérifier les perfs liées à l'affichage du portefeuille des navires
> - MOA : Contenu colonne éco issue de WAO ?
> - ISI : Stockage saisisseur en cas de saisisseurs multiples ?

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
   * L'enquête
   * Le flag éco
   * L'organisme du saisisseur
   * Le saisisseur
2. L'année est automatiquement renseignée avec l'année :
   * N-1, sur pc
   * N, sur tablette

Les critères suivants sont multiples (dev en cours sur Imagine) :
  * L'état
  * Le navire
  * L'année
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

La création d'un calendrier d'activité est accessible depuis le tableau de consultation des calendriers d'activité via l'icône <&plus>

#### Scénario principal

1. Le saisisseur demande la création d'un nouveau calendrier
2. L'écran "Nouveau calendrier" s'ouvre. Il est composé de 3 onglets :
   * "Général"
   * "Calendrier", onglet par défaut
   * "Métiers"
3. Dans l'onglet "Général", l'état des changements des caractéristiques et des armateurs du navire sélectionné sur l'année en cours de saisie s'affiche 
4. Le saisisseur consulte l'état des changements des caractéristiques et des armateurs du navire sur l'année en cours de saisie
5. Le saisisseur renseigne les caractéristiques de l'enquête. Par défaut toutes les caractéristiques sont vident.
   * Qualification de l'enquête*
   * Fiabilité de l'enquête*
   * Inactivité annuelle confirmée par l'observateur* (si la valeur est à "Oui", vider et griser tout le calendrier)
   * Le professionnel accepterait-il de répondre à une autre enquête ?*
   * Métiers déclarés dans les journeaux de bord/fiches de pêche
   * Habitudes de vente à la criée
6. Le saisisseur saisit un commentaire

#### Détails techniques :
  * Qualification de l'enquête : 
    * PMFM.ID = 623
    * QUALITATIVE_VALUE.PARAMETER_FK = 'SURVEY_QUALIFICATION' en se limitant aux ID 965, 966, 967, 2555 via une option à créer au niveau du programme, tri par ordre alphabétique
  * Fiabilité de l'enquête : 
    * PMFM.ID = 681
    * QUALITATIVE_VALUE.PARAMETER_FK = 'SURVEY_RELIABILITY', tri par ordre alphabétique
  * Inactivité annuelle confirmée par l'observateur : 
    * PMFM.ID = 1395
    * QUALITATIVE_VALUE.PARAMETER_FK = 'INACTIVTY_YEAR', tri par ordre alphabétique
  * Le professionnel accepterait-il de répondre à une autre enquête ? : 
    * PMFM.ID = 503
    * QUALITATIVE_VALUE.PARAMETER_FK = 'ACCEPT_OTHER_SURVEY', tri par ordre alphabétique
  * Métiers déclarés dans les journeaux de bord/fiches de pêche : 
    * PMFM.ID = 621
    * QUALITATIVE_VALUE.PARAMETER_FK = 'DECLARED_METIER', tri par ordre alphabétique
  * Habitudes de vente à la criée : 
    * PMFM.ID = 521
    * QUALITATIVE_VALUE.PARAMETER_FK = 'AUCTION_SALE_HABIT', tri par ordre alphabétique

> Questions :
> - MOA : Ajouter un flag VMS ?

---
## Calendrier d'activité > Calendrier

**REF: ACTIVITY_CALENDAR/MAIN**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-new.svg)

#### Scénario principal

1. Dans l'onglet "Calendrier", l'observateur consulte la prédocumentation. Pour chaque mois et pour les sources "Enquête N-1 indirecte" et "SACROIS-OBSDEB", les informations suivantes sont affichées :
   * L'armateur
   * Le quartier d'immatriculation
   * L'activité du navire*
   * Le port d'exploitation ou de rattachement*
   * Le nombre de jours de mer
   * Le nombre de jours de pêche
   * Le nombre d'hommes à bord par marée
   * Le ou les métiers
   * La ou les zones rattachées à chaque métier (maximum 2)
   * Le gradient de côte rattaché à chaque métier
2. L'observateur sélectionne les données de la prédocumentation à réutiliser dans le calendrier de l'année en cours 
   (un ou plusieurs mois d'une source et/ou un ou plusieurs blocs métiers)
3. Pour chaque métier du calendrier de l'année en cours issu de la prédocumentation, l'origine de l'information est automatiquement renseignée :
   * "Activité N-1", si le métier provient de la source "Enquête N-1 indirecte"
   * "Document déclaratif", si le métier provient de la source "SACROIS-OBSDEB"
4. L'observateur complète les données manquantes ou erronées pour chaque mois :
   * L'activité du navire* :
     * Actif
     * Inatif : vide et rend non-modifiable les champs au-dessous sauf le port d'exploitation ou de rattachement
     * Inexistant : vide et rend non-modifiable les champs au-dessous y compris le port d'exploitation ou de rattachement
   * Le port d'exploitation ou de rattachement*
   * Le nombre de jours de mer
   * Le nombre de jours de pêche
   * Le nombre d'hommes à bord par marée
   * Un ou plusieurs métiers. L'ajout ou la modification d'un métier renseigne automatiquement l'origine de l'information associée avec la valeur "Enquêteur".
     Pour chaque métier, l'observateur complète les données manquantes ou erronées :
     * Une ou deux zones. Pour chaque zone, l'observateur complète les données manquantes ou erronées :
         * Le gradient de côte*
         * Le gradient de profondeur : visibilité définie par une option du programme
         * La zone proche : visibilité définie par une option du programme
5. L'observateur enregistre le calendrier
6. Le bandeau de l'écran affiche "Immatriculation du navire - Nom du navire - Année"
7. L'encart sur le saisisseur s'affiche

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
> - MOA : Origine de l'information : à supprimer ?

---
## Calendrier d'activité > Métiers

**REF: ACTIVITY_CALENDAR/METIERS**

**Pré-conditions** : Pour que l'onglet "Métiers" soit actif, le calendrier doit être saisi et sauvegardé

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-metiers.svg)

#### Scénario principal

1. Dans l'onglet "Métiers", l'observateur consulte les métiers sélectionnés sur l'onglet "Calendrier"
2. L'observateur ajoute les caractéristiques relatives aux métiers (REF: COMMUN/PSFM/AJOUT)
3. Pour chaque métier, l'observateur renseigne les valeurs d'une ou plusieurs caractéristiques
4. L'observateur enregistre le calendrier
5. La date de mise à jour du calendrier est actualisée

> Questions :
> - Maillages et dimensions : correspondent à celles définies dans la stratégie ?
> - Popup d'ajout des PMFM : filtre possible sur le support engin ?

---
## Historique

|       Date | Sections mises à jour                                                                         |
|-----------:|-----------------------------------------------------------------------------------------------|
| 21/11/2023 | Création                                                                                      |

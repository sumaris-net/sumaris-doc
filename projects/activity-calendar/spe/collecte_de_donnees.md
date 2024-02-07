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

Allegro Calendrier d'activité est essentiellement utilisé les 3 premiers mois de l'année.
Il faut donc compter sur une mise en production au plus tard le 30 Novembre pour une utilisation au 1er Janvier.

### Mode de saisie

30 à 40% des enquêtes sont des enquêtes directes (réalisés sur le terrain)

> Proposition à valider : 
> - Dans un 1er temps : se focaliser sur la saisie bureau (pc) avec un mode déconnecté car les connexions internets ne sont pas stables dans les DOMTOMs
> - Dans un 2nd temps : se focaliser sur la saisie terrain (tablette/smartphone) sans prédocumentation

---
## Spécificités techniques

### Instance

Afin de pouvoir assurer une mise en production en minimisant les impacts sur les autres volets d'Allegro, 
il y aura 2 instances distinctes jusqu'à ce que les 3 volets soient stabilisés :
- Une instance dédiée aux calendriers d'activité
- Une instance dédiée à OsbMer et ObsVentes qui sont complémentaires

Lorsque les 3 volets seront stabilisés, les 3 volets seront regroupés sur une seule instance.

### Schéma

SUMARIS_MAP ou ADAGIO patché ?

---
## Gestion des droits

- Une personne de la société Ifremer peut consulter, modifier et supprimer toutes les données
- Une personne d'une autre société peut uniquement consulter, modifier et supprimer les données crées par sa société

> Points de vigilance : 
> - Certains quartier d'immatriculation sont observés par 2 sociétés de prestation 
> - Un navire peut changer de quartier d'immatriculation et donc de société de prestation

---
## Ergonomie générale

**REF: ACTIVITY_CALENDAR/INTERFACE**

L'interface est composée des éléments graphiques suivants :
1. Interface de gauche : Arbre du menu, interface récapitulative des onglets principaux
   * Permet de savoir ou on se trouve dans l'arbre du menu et de pouvoir naviguer dans les noeuds de l'arbre
2. Un bandeau horizontal, récapitulatif du calendrier d'activité
   * Sur la sélection d'un calendrier, le bandeau affiche les informations suivantes
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

1. L'observateur sélectionne le menu "Calendriers d'activité" dans l'interface de l'arbre du menu
2. Les calendriers d'activité s'affichent dans un tableau. Les informations suivantes sont affichées pour chaque calendrier :
   * L'état de saisie du calendrier :
     * "En cours de saisie" : _réprésenté par une icône :pencil2: dans la cellule_
     * "Terminé" : _réprésenté par une icône :heavy_check_mark: dans la cellule_
     * "Qualifié" : _réprésenté par une icône :checkered_flag: dans la cellule_
   * Le navire (code + libellé)
   * L'année
   * Le saisisseur
3. Un bouton + permet d'ajouter un nouveau calendrier

---
## Calendriers d'activité > Filtres

**REF: ACTIVITY_CALENDAR/FILTERS**

#### Scénario principal

1. Filtres disponibles :
   * Le navire
   * L'année
   * Le saisisseur

---
## Calendrier d'activité > Général

**REF: ACTIVITY_CALENDAR/GENERAL**

**Jour de mer** : Toute période continue de 24 heures (ou une partie de celle-ci) durant laquelle un navire est présent dans
une zone et absent du port (cf. décision (UE) 2019/910).

**Métier** : Groupe d'opérations de pêche ciblant un ensemble similaire d'espèces, effectué au moyen d'un engin similaire
durant la même période de l'année et/ou dans la même zone et caractérisé par un profil d'exploitation similaire
(cf. décision (UE) 2019/910).
> Définition à valider par rapport à Obsmer

**Navire actif** : Navire qui participe à une quelconque opération de pêche (d'un jour ou plus) au cours d'une année civile. 
Un navire qui n'a participé à aucune opération de pêche au cours d'une année civile est réputé « inactif » 
(cf. décision (UE) 2019/910).

**Opération de pêche** : Action qui consiste à la mise en oeuvre d’un engin de pêche pour capturer des espèces aquatiques marines. 
L’opération débute quand l’engin est mis à l’eau et qu’il est pêchant, elle se termine quand l’engin est récupéré par le 
professionnel et que l’engin n’est plus pêchant.

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-new-general.svg)
> Ajouter champs "Programme" et "Stratégie" ?

#### Scénario principal

1. L'observateur demande la création d'une nouvelle marée (REF : bouton +)
2. L'écran s'ouvre ("Nouveau calendrier")
   * L'écran est composé de 4 onglets
     * "Général"
     * "Calendrier", onglet par défaut
     * "Métiers"
     * "Commentaires
3. Dans l'onglet "Général", l'observateur consulte l'état des changements des caractéristiques et des armateurs sur l'année en cours de saisie
4. Dans l'onglet "Général", l'observateur renseigne les caractéristiques de l'enquête :
   * Qualification de l'enquête*
   * Fiabilité de l'enquête*
   * Inactivité annuelle confirmée par l'observateur*
   * Le professionnel accepterait-il de répondre à une autre enquête ?*
   * Métiers déclarés dans les journeaux de bord/fiches de pêche
   * Habitudes de vente à la criée
5. Dans l'onglet "Général", l'observateur saisit les commentaires

#### Détails techniques :
  * Qualification de l'enquête : 
    * PMFM.ID = 623
    * QUALITATIVE_VALUE.PARAMETER_FK = 'SURVEY_QUALIFICATION' en se limitant aux ID 965, 966, 967, 2555 via une option à créer dans les paramètres systèmes, tri par ordre alphabétique
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

> Prévoir val def pour les combo oui/non ? ou laisser à ni oui ni non pour forcer l'utilisateur à répondre ?

---
## Calendrier d'activité > Calendrier

**REF: ACTIVITY_CALENDAR/MAIN**

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-new.svg)

#### Scénario principal

1. Dans l'onglet "Calendrier", l'observateur consulte la prédocumentation. Les informations suivantes sont affichées pour chaque mois 
et pour les sources "Enquête N-1 indirecte" et "SACROIS-OBSDEB" :
   * L'armateur
   * Le quartier d'immatriculation
   * L'activité du navire
   * Le port d'exploitation ou de rattachement
   * Le nombre de jours de mer
   * Le nombre de jours de pêche
   * Le nombre d'hommes à bord par marée
   * Le ou les métiers. Pour chaque métier, l'observateur consulte :
       * La ou les zones
       * Le ou les gradients de côte
2. L'observateur sélectionne les données de la prédocumentation à réutiliser dans le calendrier de l'année en cours 
   (un ou plusieurs mois d'une source et/ou un ou plusieurs blocs métiers)
3. Pour chaque métier du calendrier de l'année en cours issu de la prédocumentation, l'origine de l'information est automatiquement renseignée :
   * "Activité N-1", si le métier provient de la source "Enquête N-1 indirecte"
   * "Document déclaratif", si le métier provient de la source "SACROIS-OBSDEB"
4. L'observateur complète les données manquantes ou erronnées pour chaque mois :
   * L'activité du navire :
     * Actif
     * Inatif : vide et rend non-modifiable les champs au-dessous sauf le port d'exploitation ou de rattachement
     * Inexistant : vide et rend non-modifiable les champs au-dessous y compris le port d'exploitation ou de rattachement
   * Le port d'exploitation ou de rattachement
   * Le nombre de jours de mer
   * Le nombre de jours de pêche
   * Le nombre d'hommes à bord par marée
   * Un ou plusieurs métiers. L'ajout ou la modification d'un métier renseigne automatiquement l'origine de l'information associée avec la valeur "Enquêteur".
     Pour chaque métier, l'observateur complète les données manquantes ou erronnées :
     * Une ou deux zones. Pour chaque zone, l'observateur complète les données manquantes ou erronnées :
         * Le gradient de côte
         * Le gradient de profondeur : visibilité définie par une option du programme
         * La zone proche : visibilité définie par une option du programme

#### Détails techniques :
* Le nombre de jours de mer : PMFM.ID = 241
* Le nombre de jours de pêche : PMFM.ID = 242
* Le nombre d'hommes à bord par marée : PMFM.ID = 109
* Le gradient de profondeur : table DEPTH_GRADIENT
* La zone proche : table NEARBY_SPECIFIC_AREA

> Origine de l'information : d'ou vient la valeur "Ventes" ?
> Zone proche : Valeur "Récif artificiel" à exclure de la liste ?

---
## Calendrier d'activité > Métiers

**REF: ACTIVITY_CALENDAR/METIERS**

**Pré-conditions** : Pour que l'onglet "Métiers" soit actif, le calendrier doit être saisi et sauvegardé

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-metiers.svg)

#### Scénario principal

1. Dans l'onglet "Métiers", l'observateur consulte les métiers sélectionnés sur l'onglet "Calendrier"
2. L'observateur ajoute les caractéristiques relatives aux métiers (REF: ERGONOMIE/PSFM/AJOUT)
3. Pour chaque métier, l'observateur renseigne les valeurs d'une ou plusieurs caractéristiques

> Les caractéristiques que l'observateur peut sélectionner doivent correspondre à celles définies dans la stratégie ?
> Filtre possible sur le support engin dans la popup d'ajout des PMFM ?

---
## Calendrier d'activité > Commentaires

**REF: ACTIVITY_CALENDAR/COMMENTS**

**Pré-conditions** : Pour que l'onglet "Commentaires" soit actif, le calendrier doit être saisi et sauvegardé

![ui-activity-calendar](/projects/activity-calendar/spe/images/activity-calendar-comments.svg)

#### Scénario principal




---
## Calendrier d'activité mensuel

TODO

- Prédocumentation :
  - SIH-ACTIFLOT - Calendrier d'activité
  - SIH-ACTIPRED - Prédocumentation
  - SIH-ACTIFLOT-CONFLIT - Conflit ?

---
## Historique

|       Date | Sections mises à jour                                                                         |
|-----------:|-----------------------------------------------------------------------------------------------|
| 21/11/2023 | Création                                                                                      |

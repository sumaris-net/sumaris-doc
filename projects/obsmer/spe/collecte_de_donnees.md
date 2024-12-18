# Collecte de données
## Spécifications (ObsMer)
---

## Sommaire
- [Ergonomie : principes généraux et connexion](#ergonomie-principes-généraux-et-connexion)
- [Ergonomie générale](#ergonomie-générale)
- [Marées](#marées)
- [Marées > filtres](#marées-filtres)
- [Marée > Détails](#marée-détails)
- [Marée > Engins](#marée-engins)
- [Marée > Engin > Détails](#marée-engin-détails)
- [Marée > Opérations](#marée-opérations)
- [Marée > Opérations > filtres](#marée-opération-filtres)
- [Marée > Opération > Détails](#marée-opération-détails)
- [Marée > Opération > Historique](#marée-opération-historique)
- [Opération > Capture > Saisie](#opération-capture-saisie)
- [Opération > Capture > Navigation](#opération-capture-navigation)
- [Opération > Capture > Copier-Coller](#opération-capture-copier-coller)
- [Opération > Capture > Contrôle](#opération-capture-contrôle)
- [Opération > Capture > PR](#opération-capture-pr)
- [Opération > Capture > PR > Consommation humaine](#opération-capture-pr-consommation-humaine)
- [Opération > Capture > PR > Appat](#opération-capture-pr-appat)
- [Opération > Capture > PNR, Vrac > Détaillé](#opération-capture-pnr-Vrac-détaillé)
- [Opération > Capture > PNR, Vrac > Détaillé > Ecosystèmes Marins Vulnérables](#opération-capture-pnr-vrac-détaillé-ecosystèmes-marins-vulnérables)
- [Opération > Capture > PNR, Vrac > Non Détaillé](#opération-capture-pnr-vrac-non-détaillé)
- [Opération > Capture > PNR, Hors Vrac](#opération-capture-pnr-hors-vrac)
- [Opération > Capture > PNR, Hors Vrac > Animaux](#opération-capture-pnr-hors-vrac-animaux)
- [Opération > Capture > PNR, Hors Vrac > Ecosystèmes Marins Vulnérables](#opération-capture-pnr-hors-vrac-ecosystèmes-marins-vulnérables)
- [Opération > Capture > Captures accidentelles](#opération-capture-captures-accidentelles)
- [Opération > Capture > Captures accidentelles > Remise à l'eau](#opération-capture-captures-accidentelles-remise-à-l-eau)
- [Opération > Capture > Mesures indivuelles](#opération-capture-mesures-indivuelles)

---
## Documents

- [PPT_Allegro_V2](/projects/obsmer/doc/obsmer-doc-23-001-PPT_Allegro_V2.pdf)
- [SPEC Fonc-Allegro_2023_V2](/projects/obsmer/doc/obsmer-doc-23-002-Propositions%20SPEC-Fonc-Allegro_2023_V2_Reflexions%20GT_300323.xlsx)
- [Champs saisie](/projects/obsmer/doc/obsmer-doc-23-004-champs_saisie.xlsx)

---
## Lignes de plan

- Fichier CSV importé dans WAO ObsMer
   - **Réunion MOA 06/02/2024** 
     - Pas d'intégration de WAO dans la refonte d'Allegro
- Possibilité de modifier/supprimer une ligne
  - Facades (x4) 
    - Strates : Trainants, Dormants_<12m, Trainants_[12-18m[

> Code source : https://gitlab.ifremer.fr/sih/WAO


## Ergonomie : principes généraux et connexion

[Principes généraux communs](../../common/spe/regles_communes.md#commun--ergonomie--principes-généraux)


## Ergonomie générale

**REF: OBSMER/INTERFACE**

![ui-main_tree](/projects/obsmer/spe/images/main-tree.svg)

L'interface est composée des éléments graphiques suivants :
1. Interface de gauche : Arbre du menu, interface récapitulative des onglets principaux
   * Permet de savoir ou on se trouve dans l'arbre du menu et de pouvoir naviguer dans les noeuds de l'arbre
2. Un bandeau horizontal, récapitulatif de la marée / vente
   * Sur la sélection d'une marée, le bandeau affiche les informations suivantes 
     * Immatriculation du navire de la marée
     * La date de début de la marée
   * Le bandeau permet d'afficher les opérations dans une vue cartographique (à voir au prochain point prototype)
   * Un bouton permettant d'importer les formulaires saisis sur le terrain
     * Référence [COMMUN/FORMULAIRES](../../common/spe/regles_communes.md#commun--formulaires)
4. Sous l'interface centrale, des boutons permettent de sauvegarder et de finaliser la saisie

#### Scénario principal

1. L'observateur clique sur un onglet de l'arbre du menu
   * Les informations centrale propre à l'onglet s'ouvre dans l'interface centrale.
     * Dans l'écran de saisie ("Marée" ou "opération"), un écran, à droite de l'interface centrale affiche les informations suivantes :
       * Nom du saisisseur
       * Mode de saisie (terrain ou bureau)
       * La dernière date de mise à jour des données 
       * Un bouton "Terminer la saisie", permettant la validation des données
   * Les informations centrale propre à l'onglet s'ouvre dans l'interface centrale.
   
Pour la saisie de données, le niveau de plus bas de l'arbre du menu est à la capture. 
Dans le menu "Capture", Un arbre d'échantillonnage permet de saisir les lots des espèces (REF: OBSMER/LOTS PAR ESPECE)

![ui-main_tree_expanded](/projects/obsmer/spe/images/main-tree-expanded.svg)

---

## Marées

**REF: OBSMER/MAREES**

**Marée** : Voyage en mer, ayant pour vocation une activité de peche (peut etre une campagne halieutique ou une marée d'un navire professionnel, etc.).
Un voyage peut présenter une marée observée (en mer, au débarquement), qui désigne une marée de pêche professionnelle au cours de laquelle des relevés sont effectués par un observateur.

**Fenêtre principale des marées**

![ui-trip-table](/projects/obsmer/spe/images/trips-table.svg)

#### Scénario principal

1. L'observateur sélectionne le menu "Marées" dans l'interface de l'arbre du menu.
2. Les marées s'affichent dans un tableau. Les informations suivantes sont affichées pour chaque marée :
    * L'état de saisie de la marée
      * "En cours de saisie" : _réprésenté par une icône :pencil2: dans la cellule_
      * "Terminé" : _réprésenté par une icône :heavy_check_mark: dans la cellule_
      * "Qualifié" : _réprésenté par une icône :checkered_flag: dans la cellule_ 
    * Le programme de collecte
    * Le navire
    * Le lieu de départ 
    * La date de départ
    * Le lieu du retour
    * La date de retour
    * Le saisisseur
    * La liste des observateurs (séparés par une virgule)
3. Un bouton :heavy_plus_sign: permet d'ajouter une nouvelle marée

> Questions :

> **Réunion MOA 06/02/2024** :

> Mettre "Lieu" à la place de port (plusieurs niveaux de lieu possible). Voir avec Armelle.

---

## Marées > filtres

**REF: REF: OBSMER/MAREES/FILTRE**

![ui-trip-filter](/projects/obsmer/spe/images/trip-filter.svg)

Les filtres sur les marées sont accessibles, sur les écrans affichant la liste des marées, par une icône entonnoir.

L'écran de filtrage est composé de champs sur lesquels seront appliqués le filtre :
- Le programme de collecte
- Les navires
   - Un bouton :heavy_plus_sign: permet d'ajouter des navires qui seront prit en compte dans les critères de filtrage
   - Les navires que l'on peut ajouter sont ceux autorisés par la stratégie affecté au saisisseur
- Le lieu de départ
- La début de la période
- La fin de la période
- Le saisisseur
- Les observateurs
- L'état de saisie

Un bouton permet d'appliquer le filtre. Un bouton permet de fermer la fenêtre de filtrage sans appliquer les critères de filtre.

#### Scénario principal

Référence : [COMMUN/FILTRES](../../common/spe/regles_communes.md#commun--application-des-filtres)

**Variante(s) :**

**Variante 1a**

**ACTEURS : OBSERVATEUR** : Les champs suivants sont renseignés automatiquement (par la connexion observateur) et non modifiables : Programme de collecte, Organisme, Saisisseur

**Variante 1b**

**ACTEUR : VALIDATEUR** : Un coordinateur Ifremer (avec plus de droit) peut filtrer sur plusieurs organismes saisisseurs, plusieurs saisisseurs (listes déroulantes actives)

---

## Marée > Détails

**REF: OBSMER/MAREE/DETAILS**

**Fenêtre principale de saisie d'une marée**

![ui-trip-new](/projects/obsmer/spe/images/trip-new.svg)

#### Scénario principal

1. L'observateur demande la création d'une nouvelle marée (OBSMER/MAREE_MENU : bouton :heavy_plus_sign:) 
2. Une fenêtre s'ouvre ("Nouvelle marée")
    * La fenêtre est composée de 3 onglets
      * "Détails", positionnement par défaut pour la saisie de la marée
      * "Engins"
      * "Opérations"
3. Dans l'onglet "Détails", l'observateur choisit pour cette marée (_les champs marqués d'un * sont obligatoires_) :
    * Le programme de collecte* dans une liste déroulante : information déjà pré-rempli
    * La stratégie de référence au plan d'échantillonnage de WAO
    * L'observateur* dans une liste déroulante
      * Un bouton :heavy_plus_sign: permet de rajouter des obervateurs à la marée
    * Le navire, s'il est dans la liste déroulante
    * Le lieu de départ * (_saisie des 3 premières lettres, Référentiel des LIEUX_) 
    * La date* et l'heure * de début de marée
    * Le lieu de retour * (_saisie des 3 premières lettres, Référentiel des LIEUX_)
    * La date* et l'heure * de début de marée
    * La durée de la marée est automatiquement calculée et affichée après la saisie des dates/heures de début et de fin
    * Les détails sur la vente 
      * Le lieu * de vente 
      * La date * et l'heure de vente 
        * L'heure de vente peut être saisit mais elle n'est pas obligatoire
      * Le type * de vente 
    * Des caractéristiques (PSFM définit par la stratégie appliquée)
     * L'observateur à la possibilité de rajouter des caractéristiques à la marée : 
       * Nombre d'hommes à bord
       * Document déclaratif (case à cocher, oui/non)
       * ...
    * Un commentaire (maximum 2000 caractères)
4. L'observateur sélectionnera des types d'engin observés dans l'onglet "Engins"
    * Le fenêtre de sélection d'engins s'ouvre
5. Un bouton "Sauvegarder" permet de sauvegarder la marée en cours de saisie.


Niveau des lieux : Le niveau des lieux des marées est définit dans le paramétrage du programme, accessible par le menu "Référentiel" :
- Référentiel > Programme > Options > Marée : Niveau(x) de lieu

**Variante(s) :**

**Variante 1a** - 
1. L'observateur consulte une marée déjà saisie. Dans le cas d'une consultation de marée, le plan d'échantillonnage est affiché.
La stratégie est trouvée suivant les éléments précédemment saisis :  
    * Le programme
    * La date
    * Le lieu
2. La stratégie s'affiche.
3. La date de dernière mise à jour est affichée.
4. Le nom du saisisseur est affiché.
5. Le mode de saisie est affiché ("Terrain" ou "bureau").
6. Un bouton "Terminer la saisie" permet la fin de la saisie et lance automatiquement les contrôles sur les données saisis. 

**Variante 3a** - L'observateur ajoute des PSFM aux caractéristiques de la marée. Il sélectionne le bouton :heavy_plus_sign:.
Un écran de sélection des PSFM s'ouvre. Il sélectionne les PSFM à ajouter à la marée.


#### Détails techniques :

- Type de vente : 
  - Table SALE_TYPE

> Modèle de données de Marée : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/raw/master/model/data/trip.svg

> VFA -> ISI : Modèle de données de vente à réaliser

> **Remarques** :

> VFA -> EIS : La stratégie ne s'affiche qu'en mode consultation des marées. 

> **Réunion MOA 06/02/2024** :

> Il ne faut pas pouvoir pour visualiser/éditer la stratégie à ce niveau

> Pas besoin de spécifier la stratégie au moment de la saisie mais plutôt au moment de la consultation. 

> Rajouter les 2 champs obligatoires : strat. de référence (Référence au plan d'échantillonnage de WOA) de la société et Programme de rattachement 

   > Voir comment est construit la valeur de strat. de référence et Programme de rattachement (Allegro actuel)

   > Utiliser l'API existante (Allegro) pour se connecter au serveur WAO 


---

## Marée > Engins 

**REF: OBSMER/ENGINS**

**Engin** : Ensemble de matériels utilisé à bord d’un navire spécifique (mis en œuvre par un savoir-faire), qui a pour fonction l’exploitation d’une ressource marine.

![ui-gears-table](/projects/obsmer/spe/images/gears-table.svg)

#### Scénario principal

1. L'observateur sélectionne le menu "Engin" dans l'interface de l'arbre du menu ou l'onglet "Engin" dans l'interface d'une marée
2. Les engins de la marée s'affichent dans un tableau. Les informations suivantes sont affichées pour chaque engins :
    * Engin (Code et libellé)
    * Type d'engin
3. Un bouton permet d'afficher ou de masquer des colonnes
4. Un bouton :heavy_plus_sign: permet d'ajouter un nouvel engin


**Variante(s) :** 

**Variante 2a** - Par une option de configuration ne sont affichées que les caractéristiques  valorisés (**A REALISER**)

> Questions/Remarques :

> VFA à EIS : pré-requis : Pour que le menu "Engins" soit actif, la marée doit être saisie et enregistrée ?

> **Réunion MOA 19/02/2024** :

> VFA à MOA : le type d'engin est un complément à l'engin (il faut le laisser) : caractéristique de l'engin (PSFM)

> VFA à EIS : Mode ou on met en dur les PMFMs que l'on voit (mettre des PMFMs pour distinguer les engins)

#### Détails Techniques

- Type de l'engin : PMFM - TRAWL_TYPE (ID = 210)


---
### Marée > Engin > Détails

**REF: OBSMER/ENGIN/DETAILS**

**Fenêtre de saisi d'un engin**

1. L'observateur demande l'ajout d'un nouvel engin à la marée (OBSMER/ENGINS_MENU : bouton :heavy_plus_sign:)
2. Une fenêtre s'ouvre ("Nouvel engin")
    * Les engins appartenant au navire sélectionné apparaissent dans une liste déroulante
3. L'observateur peut sélectionner un engin dans la liste
    * L'engin sélectionné est affiché avec son code et son libellé
    * Les caractéristiques de l'engin sélectionné s'affichent, permettant une saisie par l'opérateur
        * Les caractéristiques (PSFM à saisir) sont propre à l'engin sélectionné (suivant la stratégie appliquée)
        * A l'ouverture de la fenêtre de saisie, le champ "Ajouté" est grisé
    * Les caractéristiques de l'engin sélectionné s'affichent, permettant une saisie par l'opérateur
    * Le nombre d'engin attribué à la marée est affiché au niveau de l'onglet "Engin" : l'ajout d'un engin incrémente le compteur
4. L'observateur peut charger des caractéristiques des engins existants en cliquant sur le bouton "Rechercher" (Variante 2a)

> VFA à ISI : Refaire l'IHM (fenêtre modale, voir prototype)

Saisie des caractéristiques d'un engin - Exemple avec un engin de type "Filet"

![ui-gear](/projects/obsmer/spe/images/gear.svg)

**Variante(s) :**

**Variante 2a** - Dans le cas d'une création d'un nouvel engin, l'observateur à la possibilité de charger les caractéristiques engin d’un navire déjà observé.

![ui-gear-present](/projects/obsmer/spe/images/gears-present.svg)

pré-requis : Le nombre de mois pour la recherche d'engin d'une marée doit être configurable et sélectionnable dans les préférences
Nombre de mois pour la recherche ?

A mettre en option de programme (12 mois par défaut). Il est possible de modifier cette valeur dans les préférences utilisateur de l'application.

L'observateur clique sur le bouton rechercher, dans la fenêtre "Nouvel engin"
1. Une nouvelle fenêtre "Engins Existants" s'ouvre
2. L'observateur saisit une date de début de période de marée et de fin de période de marée
    * Les engins des navires déjà observés sur la période s'affichent dans un tableau
    * Les informations suivantes, pour chaque engin, sont affichées :
      * Type d'engin
      * Le libellé de l'engin
      * Les caractéristiques (affichage des PSFM renseignés seulement)
      * La période de la dernière utilisation (VFA à MOA : A renommer)
      * Un commentaire 
3. L'observateur sélectionne un engin
4. L'engin et ses caractéristiques sont renseignés dans la fenêtre de saisie d'un nouvel engin
   * si l'application est en mode déconnecté , la recherche se fait parmis les données synchronisées

**Variante(s) :**

**Variante 3a** - Les informations de saisie sont affichées dans un bandeau rouge, sur fond blanc
Exemple :_"Pour les maillages, saisir uniquement les maillages à la jauge."_
C'est une option liée au programme de collecte (A REALISER)

> **Réunion MOA 19/02/2024** :

> MOA : Marion doit avoir la main sur la stratégie (se tourne vers Armelle) 

> MOA : Avoir une V1 qui permet d'administrer la stratégie (à confirmer avec Benoit)

> EIS : OK pour une la V1. Mais manque l'affectation au lieu.

> EIS : Reste des écrans à faire de manière transverse (ObsMer/ObsVente/Calendrier d'activité)

> ISI : Spécifications à rédiger dans la partie commons (Administration)

> Questions/Remarques :
> - [ ] ~~Optimiser le chargement de la stratégie~~
> - [ ] Conserver uniquement les colonnes PSFM ayant une valeur
> - [ ] Libellé d'engin ?

---

## Marée > Opérations

**REF: OBSMER/OPERATIONS/MENU**

**Fenêtre principale du menu opération**

**Pré-conditions** : Pour que l'onglet "Opération" soit actif, la marée doit être saisie et sauvegardée.

**Opération** : Opération de pêche qui consiste à la mise en oeuvre d’un engin de pêche pour capturer des espèces aquatiques marines. L’opération débute quand l’engin est mis à l’eau et qu’il est pêchant, elle se termine quand l’engin est récupéré par le professionnel et que l’engin n’est plus pêchant.

![ui-operation-table](/projects/obsmer/spe/images/operations-table.svg)

#### Scénario principal

1. L'observateur sélectionne le menu "Opération" dans l'interface de l'arbre du menu ou l'onglet "Opérations" dans l'interface d'une marée
2. Les opération s'affichent dans un tableau. Les informations suivantes sont affichées pour chaque opération (à valider):
    * L'état de saisie de l'opération
        * "En cours de saisie" : _réprésenté par une icône :pencil2: dans la cellule_
        * "Terminé" : _réprésenté par une icône :heavy_check_mark: dans la cellule_
        * "Qualifié" : _réprésenté par une icône :checkered_flag: dans la cellule_
     * L'engin utilisé
    * L'espèce cible
    * La date de début de l'opération (Filage)
    * La position de début de l'opération (Filage)
    * La date de fin de l'opération (Filage)
    * La position de fin de l'opération (Filage)
    * La date de début de l'opération (Virage)
    * La position de début de l'opération (Virage)
    * La date de fin de l'opération (Virage)
    * La position de fin de l'opération (Virage)
3. Un bouton permet d'afficher ou de masquer des colonnes
4. Un bouton :heavy_plus_sign: permet d'ajouter une nouvelle opération

Le choix des dates de début/fin d'opération (filage/virage) se paramètre dans les options du programme.

> **Réunion MOA 19/02/2024** :
 
>  VFA à MOA : laisser a possibilité de saisir début/fin de virage (mise à l'eau), début/fin filage : date + heure + position pour ces 4 moments

> Paramètrage via les options du programme

> MOA : Propre aux engins dormants

> EIS : bien dans la base Harmonie mais pas prit en compte dans le modèle Summaris

> EIS : Exploiter le modèle dormants/trainants et actifs

> MOA : Intérêt sur une marée obsmer de saisir une mise à l'eau ? Date et heure de mise à l'eau de l'engin

> MOA doit en discuter avec les scientifiques (Priorité 2)

> Partie à détailler avec EIS 




## Marée > Opérations > filtres

**REF: REF: OBSMER/OPERATION/FILTRE**

**Fenêtre de filtre sur la liste des opérations**

![ui-operation-filtre](/projects/obsmer/spe/images/operation-filter.svg)

Les filtres sur les opérations sont accessibles, sur les écrans affichant la liste des opération, par une icône entonnoir.

L'écran de filtrage est composé de champs sur lesquels seront appliqués le filtre :
- L'état de saisie
  - La colonne "Etat" doit pouvoir être triée

Un bouton permet d'appliquer le filtre. Un bouton permet de fermer la fenêtre de filtrage sans appliquer les critères de filtre.

#### Scénario principal (à déplacer dans common)

Référence : ERGONOMIE/FILTRES

---

## Marée > Opération > Détails

**REF: OBSMER/OPERATION/DETAILS**

**Fenêtre principale de saisie d'une opération**

![ui-operation](/projects/obsmer/spe/images/operation.svg)

#### Scénario principal

1. L'observateur demande la création d'une nouvelle opération (OBSMER/OPERATION_MENU : bouton :heavy_plus_sign:)
2. Une fenêtre s'ouvre sur la saisie des caractéristiques de l'opération. 
3. L'observateur renseigne les éléments suivants :
   * L'engin * utilisé
   * L'espèce cible
   * La date, l'heure et la position de début (non obligatoire) de pêche
   * La date, l'heure et la position de fin (non obligatoire) de pêche
   * Les caractéristiques de l'opération (PSFM définit par la stratégie appliquée):
     * Le type d'opération dans une liste déroulante (Opération échantillonnée, non échantillonnée, opération de repos)
     * Le déroulement normal de l'opération avec une case à cocher (vide : par défaut, oui, non)
     * Si l'opération est échantillonnée avec une case à cocher (vide : par défaut, oui, non)
       * Oui par défaut. Si oui, l'écran des mensurations est accessible à la saisie
     * La profondeur moyen de l'engin
     * L'état de la mer dans une liste déroulante 
     * Autres observations (suivant la stratégie appliquée)
       * Force du vent
       * ...
4. Les champs suivants sont automatiquement calculés :
   * La durée de l'opération, calculée automatiquement après la saisie des dates début et de fin d'opération
   * la distance parcourue pendant l'opération, calculée automatiquement après la saisie des positions de début et de fin de pêche
   * La zone d'activité du navire, calculée automatiquement après la saisie des positions de début et de fin de pêche

**Variantes**

**Variante 3a** - Il est possible de filtrer sur les espèces cibles avec une période à définir (icone à droite du choix de l'espèce)

_Développement à réaliser_

#### Détails Techniques

- La zone d'activité du navire correspond au niveau de lieu Sous Rectangle Statistique (LOCATION_LEVEL.ID = 114)
- L'état de la mer est définit par le PMFM - SEA_STATE (ID = 194 ou 1087)

> **Réunion MOA 19/02/2024** :

> MOA : Y a t il un référentiel des espèces (Métier/Engin => espèces cibles) : OUI

> MOA : Mise en place de la régionalisation (zone d'activité) : 

> MOA : Forcer la saisie de mensuration même si c'est une opération non échantillonnée. Texte de 4~5 lignes pour expliquer le concept à EIS.

> Question pour MOA : Si opération non échantillonnée, on peut saisir quand même des mensurations uniquement pour la partie débarquée ? 

> ISI : A ajouter : Bouton + pour permettre la saisie de mensuration 

**Variante 3b** - Il doit possible de forcer la saisie de mensuration pour une opération non échantillonnée.
Dans ce cas un bouton :heavy_plus_sign: permet l'ajout de mensuration.

**Variante 3c** - Engin dormant (A REALISER)

3. Si l'engin choisi est un engin dormant : autoriser date de début OP AVANT marée 

**Variante 3d** - Engin traînant (A REALISER)

3. Si l'engin choisi est un engin traînant : Empêcher date de début OP en dehors de la période de la marée

**Variante 3e** - Pêche en bœuf et navire associé (DEV A RÉALISER)

3. Si l'engin choisit est dans une liste (`PTB - Chaluts bœufs de fond`, `PTM - Chaluts bœufs pélagiques`)
   Alors il devient obligatoire de saisir l'immatriculation du navire associé à l'opération.
   L'observateur doit aussi indiquer si la capture est remontée sur le navire de l'observateur. 
   > cf mantis Allegro: https://forge.ifremer.fr/mantis/view.php?id=41410

> **Réunion MOA 19/02/2024** :

> MOA : Il faut saisir obligatoirement le second navire  

> MOA : Indiquer l'immatriculation et indiquer si la capture est remontée sur le navire observateur

> MOA : Comment est filtrée la liste des navires  ? Regarder dans Allegro comment c'est fait.

**Variante 3e** - Filtrer les métier pratiqués - PAS PRIORITAIRE

3. Le système filtre les espèces cibles en fonction des données historiques déjà saisies.
   L'utilisateur peut retirer ce filtre pour faire une recherche sur le référentiel complet. 

> MOA : à réaliser en P2

---
## Marée > Opération > Historique

**REF: OBSMER/OPERATION/HISTORIQUE**

![operation-edit-history](/projects/obsmer/spe/images/operation-edit-history.svg)

Un historique des saisies des opérations est accessible depuis le bandeau récapitulatif de l'opérations d'une marée

#### Scénario principal

L'observateur clique sur le menu déroulant "LOG" (_a renommer_) dans le bandeau récapitulatif d'une opération
1. Une fenêtre modale s'ouvre avec les dernières opérations saisies
    * La date de création est affichée pour chaque opération
2. Un bouton "Ajouter" permet de créer une nouvelle opération

---
## Opération > Capture > Saisie 

**REF: OBSMER/OPERATION/CAPTURE**

**Fenêtre de saisie d'une capture, sur une opération**

**Capture** : Ensemble des animaux, végétaux et matières inertes remontés à bord du navire à l’issue
d’une opération de pêche.

**Capture accessoire** : Partie de la capture d'une unité de pêche prise en plus de l'espèce cible vers
laquelle l'effort de pêche est orienté. Une partie ou la totalité de cette prise peut être
rejetée à la mer, généralement morte ou mourante (source FAO).

**Capture accidentelle** : capture accessoire d’espèces protégées, en danger ou menacées (voir
Définition de PETS).

**Coup nul** : 

![ui-batch-tree](/projects/obsmer/spe/images/batch/batch-tree.svg)

#### Scénario principal

1. L'observateur à sélectionné l'onglet "Capture" dans le menu d'une opération. 
   * L'écran de saisie des captures s'affiche. 
   * L'écran capture est composé de 2 écrans :
   * Un arbre d'échantillonnage d'information sur les PR (partie retenue) et PNR (partie non retenue)
   * Une zone de saisie des lots par espèce pour les PR et PNR (à droite de l'arbre d'échantillonnage)
2. L'observateur peut contrôler la saisie des captures par le bouton "Contrôler"
3. L'observateur peut masquer cet arbre en cliquant sur le bouton <<
    * Une fois l'abre masqué, il peut le réafficher en cliquant sur >>
4. L'observateur peut saisir, dans l'écran de droite, des informations sur la capture
    * Coup nul : une case à cocher indique qu'il s'agit d'un coup nul ou non (case cochée = Oui)
    * Le poids total (en kg) de toutes les espèces capturées
    * Ce champ est calculé et n'est pas obligatoire (dans le cas d'un coup nul)
    * Un bandeau en haut de l'écran rappel la localisation dans l'abre d'échantillonnage (Ex : "<i>Capture / Partie retenue > PR")
      * Il est possible de naviguer par ce bandeau pour atteindre n'importe quel noeud de l'arbre (OBSMER/OPERATION/CAPTURE/NAVIGATION) 
5. Des compteurs au niveau des menus indique le nombre de saisies
    * Ces compteurs sont visibles uniquement sur les menus comportant des tableaux dans la fenêtre de saisie


**Coup nul** : L'engin remonte sans espèce, pas de détection

#### Variantes

**Variantes**

**Variante 4a** - Cas du coup nul (pas de capture)

4. Dans la saisie de la capture, l'observateur coche le champ "Coup nul". 
   Le poids total de la capture est grisé et vide. Tout le reste de l'arbre d'échantillonnage est aussi grisé.

![ui-batch-tree-null](/projects/obsmer/spe/images/batch/batch-tree-null.svg)

**Variantes**

**Variante 1b** - Opération non échantillonnée

1. Si l'opérateur à indiqué que l'opération est non échantillonnée (OBSMER/OPERATION/DETAILS), le champ capture est non calculé et il est renseigné à 0.

> Questions:

> VFA à MOA : Destination du produit : PSFM `PRODUCT_DESTINATION` (il manque `Obligation à débarquer`)

---
## Opération > Capture > Navigation

**REF: OBSMER/OPERATION/CAPTURE/NAVIGATION

Navigation dans l'arbre des captures

![ui-batch-tree-nav](/projects/obsmer/spe/images/batch/batch-tree-nav.svg)

#### Scénario principal

1. L'observateur peut naviguer dans l'arbre d'échantillonnage à partir du bandeau de la fenêtre de saisie
2. Il peut aussi dérouler le file d'Ariane de l'abre d'échantillonnage en cliquant sur les flèches <b>(<) et <b>(>)

---

## Opération > Capture > Copier-Coller

**REF: OBSMER/OPERATION/CAPTURE/COPIER-COLLER**

L'observateur à la possibilité de faire des "Copier-Coller" et des "Déplacer vers" d'un lot d'espèce d'une catégorie à une autre (Exemple : Appat à Consommation humaine)

#### Scénario principal

1. L'observateur coche toutes les espèces saisies dans un catégorie 
2. Un bouton "Copier" apparait
3. L'observateur clique sur le bouton "Copier" et navique sur une autre catégorie
4. Un bouton "Coller" apparait
5. L'utilisateur clique sur le bouton "Coller"
    *  Seules les espèces sont copiées, les poids sont laissés à vides
    *  Le presse papier contenant les données est automatiquement vidé après la copie


**Variantes**

**Variante 1a** - Copie des captures entre opérations

L'observateur peut aussi effectuer un "Copier/Coller" de la totalité des captures d'une opération à une autre opération
afin d'accélérer la saisie. Les boutons "Copier/Coller" sont disponibles au niveau de l'arbre des Captures.
Si l'observateur à déjà effectué une saisie dans l'opération de destination, une demande de confirmation est faite avant la recopie.

**Variante 1b** - Déplacement des lots d'espèces

L'observateur peut aussi effectuer une action de "Déplacer vers" d'un lot d'espèce d'une catégorie à une autre.
Le lot est ainsi supprimé de sa catégorie source et copier vers sa catégorie de destination.
Si l'observateur à déjà effectué une saisie dans le lot de destination, une demande de confirmation est faite avant la recopie.

> **Réunion MOA 19/02/2024** :

> ISI/EIS : Maquettage à faire

---
## Opération > Capture > Contrôle 

**REF: OBSMER/OPERATION/CAPTURE/CONTROLE**

Contrôle de la saisie d'une capture :

![ui-batch-tree-control](/projects/obsmer/spe/images/batch/batch-tree-control.svg)

#### Scénario principal

1. L'observateur clique sur le bouton "Contrôler"
2. L'abre d'échantillonnage n'est alors pas dépilé et les poids sont calculés et remontés
    *  Les poids calculés sont affichés en bleu et en italique 
3. Sur les formulaires ou rien n'a été saisi :
    *  Les compteurs affichent 0 et sont de couleur grise 
    *  Le poids total est automatiquement renseigné à 0
4. Les compteurs des formulaires de saisi comportant dans erreurs sont affichés en rouge
    *  L'observateur est positionné directement sur le premier formulaire comportant des erreurs de saisie

> **Réunion MOA 19/02/2024** : Voir avec EIS s'il y a des 1/2 sur les poids remontés 

> **Réunion MOA 19/02/2024** : rendu ici

---
## Opération > Capture > PR

**REF: OBSMER/OPERATION/CAPTURE/PR**

**Partie retenue d'une capture** : Partie de la capture remontée à bord du navire qui est conservée à bord une fois le tri effectué par l’équipage.
= Part commerciale + Obligation de débarquement

**Godaille** : part de l'équipage.

**Appat** : 

**Obligation à débarquer** : Mettre un terme à la pratique consistant à rejeter en mer les captures non désirées de poissons :
- Ne correspondant pas à la taille minimale de conservation de référence ;
- Pour lesquelles le pêcheur ne dispose pas de quotas : du fait de règles particulières relatives à la composition des captures.

![ui-batch-tree-pr](/projects/obsmer/spe/images/batch/batch-tree-PR.svg)

#### Scénario principal
1. L'utilisateur sélectionne le menu "Partie retenue" dans l'arbre d'échantillonnage
2. L'arbre se déplie et le sous menu suivants apparaissent sous le menu "Partie retenue" (_PSFM = PRODUCT_DESTINATION_)
    * "Appat"
    * "Consommation humaine"
    * "Godaille"
    * "Obligation à débarquer"
3. L'écran de saisie de la "Partie retenue" se met à jour
    *  Un bandeau en haut de l'écran rappel la localisation dans l'abre d'échantillonnage (Ex : "<i>Capture / Partie retenue")
4. Il n'y a rien d'affiché dans la fenêtre de saisie de la partie retenue de la capture 


**Variantes**

**Variante 2a** - Liste du PSFM PRODUCT_DESTINATION paramétrable par une option ("Option du programme")

---
## Opération > Capture > PR > Consommation humaine

**REF: OBSMER/OPERATION/CAPTURE/PR/HCN**

![ui-batch-tree-pr-hcn](/projects/obsmer/spe/images/batch/batch-tree-PR-HCN.svg)

#### Scénario principal

1. L'observateur sélectionne le sous-menu "Consommation humaine" dans le menu "Partie retenue" de l'arbre d'échantillonnage
2. L'écran de saisie se met à jour
    *  Un bandeau en haut de l'écran rappel la localisation dans l'abre d'échantillonnage (Ex : "<i>Capture / Partie retenue / Consommation Humaine")
       * Il est possible de naviguer par ce bandeau pour atteindre n'importe quel noeud de l'arbre
    *  Un compteur indique le nombre d'espèce commerciale saisie à côté du nom du devenir de l'espèce
3. L'écran de saisie pour la "Consommation humaine est composé des éléments suivants"
    * Une zone affichant le poids total calculé (en Kg) 
    * Une case à cocher indiquant si l'inventaire des espèces est exhaustif (par défaut oui, cochée)
    *  Un tableau affichant la liste des espèces commerciale à saisir
        *  Une case à cocher indique si la poids est estimé  (Oui si la case est coché)
4. L'observateur peut ajouter des espèces commerciale dans le tableau en cliquant sur le bouton :heavy_plus_sign:
5. Il peut renseigner pour chaque espèce commerciale :
    * Le nom de l'espèce
    * La présentation (_PSMF = DRESSING_, _METHOD = 42_, _Observation par un observateur_) 
        * Par défaut WHL (_entier_) 
    * La catégorie (_PSFM = SIZE_SORTING_CAT_, _METHOD = 42_, _Observation par un observateur_))
    * L'état (_PSMF = PRESERVATION_, _METHOD = 42_, _Observation par un observateur_)
        * Par défaut FRE (_frais_) 
   *  Le poids total (unité par défaut en Kg)
       * Une case à cocher indique si le poids est estimé
   *  Le taux d'échantillonnage (1/n) 
        * Si ce champ est renseigné, le poids d'échantillonnage est automatique calculé et renseigné
   *  Le poids d'échantillonnage (en Kg)
        * Si ce champ est renseigné, le taux d'échantillonnage est automatique calculé et renseigné
        * Une case à cocher indique si le poids est estimé 
   * Le nombre d'individu échantillonné
6. Un bouton (en forme d'histogramme) permet d'activer l'écran de saisie de mesure individuelle pour l'espèce commerciale (OBSMER/OPERATION_CAPTURE/MI)
   *  S'il n'y a aucune mensuration de saisi, le bouton est noir, sinon il est bleu avec un indicateur du nombre de saisi
7. Un commentaire
   *  Une fois saisi, le commentaire s'affiche dans une info-bulle au survol de la souris
8. Une photo (A REALISER)
9. L'observateur peut supprimer une espèce commerciale en la sélectionnant et en cliquant sur l'icône "Poubelle"

Il n'y a pas la possibilité d'ajouter des PSFMs dans le tableau de saisie des caractéristiques.

> Questions :

> VFA à MOA/EIS : Compatibilité du modele d'arbre différent des données précédemment saisies : Données précédentes d'un arbre avec Macro Déchets par exemple
> 
> La données prend le pas sur l'arbre : à voir (cas d'usage à faire)


---

## Opération > Capture > PR > Appat

**REF: OBSMER/OPERATION/CAPTURE/PR/BAI**

![ui-batch-tree-pr-bai](/projects/obsmer/spe/images/batch/batch-tree-PR-BAI.svg)

#### Scénario principal

Les écrans et les scénarios sont les mêmes pour toutes les parties retenus
- "Consommation humaine"
- "Obligation à débarquer"
- "Appat"
- "Godaille"

---

## Opération > Capture > PNR, Vrac > Détaillé

![ui-batch-PNR-VRAC](/projects/obsmer/spe/images/batch/batch-tree-PNR-VRAC-DETAIL.svg)

**Partie non retenue** : Partie de la capture remontée à bord du navire qui est rejeté à la mer une
fois le tri effectué par l’équipage = Rejets détaillés + Rejets non détaillés + Inerte et Végétaux

**REF: OBSMER/OPERATION/CAPTURE/PNR/VRAC/DETAIL**

**Rejets détaillés** = poissons + autres espèces commerciales.

L'arbre PNR, Vrac détaillé contient le sous menu suivant :
- Animaux
- Ecosystèmes Marins Vulnérables

#### Scénario principal

1. L'observateur déroule l'arbre PNR, Vrac détaillé
2. Le sous menu suivant s'affiche :
    * Animaux
    * Ecosystèmes Marins Vulnérables
3. Le menu "Détaillé" n'est pas sélectionnable

--- 

## Opération > Capture > PNR, Vrac > Détaillé > Animaux

![ui-batch-PNR-VRAC-ANI](/projects/obsmer/spe/images/batch/batch-tree-PNR-VRAC-ANI.svg)

#### Scénario principal

1. L'observateur sélectionne le menu "Animaux" de l'arbre PNR, Vrac détaillé
2. La fenêtre de saisie des "Animaux" s'affiche
    * Une zone affiche le poids total calculé (en Kg)
    * Une case à cocher permet d'indiquer si l'inventaire des espèces est exhaustif (par défaut oui, cochée)
3. L'observateur peut ajouter des espèces dans le tableau en cliquant sur le bouton :heavy_plus_sign:
4. L'observateur renseigne les espèces observées
    * Un bouton :heavy_plus_sign: permet d'ajouter une nouvelle espèce
    * Une case à cocher permet d'indiquer si les poids sont estimés
    * Pour chaque nouvelle espèce, il doit renseigner :
        * Le code de l'espèce scientifique de l'espèce
        * Le poids total, en kg
        * Le nombre d'individu total
        * Un bouton (en forme d'histogramme) permet d'activer l'écran de saisie de mesure individuelle pour l'espèce commerciale (OBSMER/OPERATION_CAPTURE/MI)
        * Un commentaire
            * Une fois saisi, le commentaire s'affiche dans une info-bulle au survol de la souris
        * Une photo (A REALISER)
5. L'observateur peut supprimer une espèce scientifique en la sélectionnant et en cliquant sur l'icône "Poubelle"


--- 

## Opération > Capture > PNR, Vrac > Détaillé > Ecosystèmes Marins Vulnérables

![ui-batch-PNR-VRAC-EMV](/projects/obsmer/spe/images/batch/batch-tree-PNR-VRAC-EMV.svg)

**EMV : Ecosystème marin vulnérable** : groupes d'espèces de communautés ou des habitats pouvant être vulnérable aux impacts des activités de pêche.    

#### Scénario principal

1. L'observateur sélectionne le menu "Ecosystèmes Marins Vulnérables" de l'arbre PNR, Vrac détaillé
2. La fenêtre de saisie des "Ecosystèmes Marins Vulnérables" s'affiche
    * Une zone affiche le poids total calculé (en Kg)
    * Une case à cocher permet d'indiquer si l'inventaire est exhaustif (par défaut oui, cochée)
3. L'observateur renseigne les catégories EMV observées :
    * Une case à cochée permet d'indiquer s'il les poids sont estimés
    * Un bouton :heavy_plus_sign: permet d'ajouter une nouvelle catégorie d'EMV
    * Un bouton ((:heavy_plus_sign:) lui permet d'ajouter toutes les catégories d'EMV
    * Pour chaque nouvelle catégorie d'EMV, il doit renseigner :
        * La catégorie
        * Le poids total, en kg
        * Un commentaire
          * Une fois saisi, le commentaire s'affiche dans une info-bulle au survol de la souris
        * Des photos (A REALISER)
          * Il n'y a pas de limitation en nombre de photos
          * Il est possible de proposer des tailles en dimensions/poids pour l'image (configurable dans les options)
4. L'observateur peut supprimer une catégorie d'EMV en la sélectionnant et en cliquant sur l'icône "Poubelle"

## Opération > Capture > PNR, Vrac > Non Détaillé

![ui-batch-PNR-VRAC-NDETAIL](/projects/obsmer/spe/images/batch/batch-tree-PNR-VRAC-NDETAIL.svg)

**REF: OBSMER/OPERATION/CAPTURE/PNR/VRAC/NON_DETAIL**

**Rejets non détaillés** = animaux non détaillés (méduses, étoiles de mer, etc.).

#### Scénario principal

1. L'observateur sélectionne le menu "Non détaillé" de l'arbre PNR, Vrac 
2. La fenêtre de saisie des rejets s'affiche
   * Une zone affiche le poids total calculé (en Kg)
     * Le poids total est calculé à partir des poids saisies pour chaque rejet
   * Une case à cocher permet d'indiquer si l'inventaire est exhaustif (par défaut oui, cochée)
   * Une case à cochée permet d'indiquer s'il le poids a été estimé
3. L'observateur peut renseigner la nature des rejets en cliquant sur le bouton ((:heavy_plus_sign:) :
    * Une ligne d'animaux et une ligne "Inerte et végétaux" sont ajoutées
4. L'observateur peut sinon ajouter, un à un, un rejet en cliquant sur le bouton :heavy_plus_sign:
   * Une nouvelle ligne est ajoutée au tableau
     * Le choix de la nature du rejet ("Animaux" ou "Inerte et végétaux") s'ouvre automatiquement pour la saisie
5. Pour chaque rejet, l'observateur renseigne :
   * Le poids total 
   * Un commentaire
       * Une fois saisi, le commentaire s'affiche dans une info-bulle au survol de la souris
   * Une photo (A REALISER)

---
## Opération > Capture > PNR, Hors Vrac

![ui-batch-PNR-HVRAC](/projects/obsmer/spe/images/batch/batch-tree-PNR-HVRAC.svg)

**REF: OBSMER/OPERATION/CAPTURE/PNR/HVRAC**

L'arbre d'échantillonnage de la Partie Non Retenue Hors Vrac ne contient pas de menu Détaillé et Non Détaillé.

On retrouve directement les sous menus "Animaux" et "Ecosystèmes Marins Vulnérables" sous le menu PNR, Hors Vrac.

L'arbre PNR, Hors Vrac contient donc 2 sous menu :
- Animaux
- Ecosystèmes Marins Vulnérables

#### Scénario principal
Identique au scénario OBSMER/OPERATION/CAPTURE/PNR/VRAC/DETAIL


## Opération > Capture > PNR, Hors Vrac > Animaux

![ui-batch-PNR-HVRAC-ANI](/projects/obsmer/spe/images/batch/batch-tree-PNR-HVRAC-ANI.svg)

#### Scénario principal

1. L'observateur sélectionne le menu "Animaux" de l'arbre PNR, Hors Vrac
2. La fenêtre de saisie des "Animaux" s'affiche
    * Une zone affiche le poids total calculé (en Kg)
        * Le poids total est calculé à partir des poids saisies pour chaque espèce
3. L'observateur renseigne les espèces observées :
    * Si le poids total est estimé, par une case à cocher
    * Un bouton :heavy_plus_sign: permet d'ajouter une nouvelle espèce
    * Pour chaque nouvelle espèce, il doit renseigner :
        * Le code de l'espèce scientifique de l'espèce
        * Le poids total, en kg
        * Le nombre d'individu total
        * Un bouton (en forme d'histogramme) permet d'activer l'écran de saisie de mesure individuelle pour l'espèce commerciale (OBSMER/OPERATION_CAPTURE/MI)
        * Un commentaire
            * Une fois saisi, le commentaire s'affiche dans une info-bulle au survol de la souris
        * Une photo (A REALISER) 
        * L'observateur peut supprimer une espèce scientifique en la sélectionnant et en cliquant sur l'icône "Poubelle"
4. Le poids total est calculé à partir des poids saisies pour chaque EMV

> AJOUT DE REGLES - Action de contrôle : Warning pas respecté : si coef echant PNR Vrac est 1/1 alors que le poids de PNR Hors Vrac doit être à 0 : TODO


## Opération > Capture > PNR, Hors Vrac > Ecosystèmes Marins Vulnérables

![ui-batch-PNR-HVRAC-EMV](/projects/obsmer/spe/images/batch/batch-tree-PNR-HVRAC-EMV.svg)

**EMV : Ecosystème marin vulnérable** : groupes d'espèces de communautés ou des habitats pouvant être vulnérable aux impacts des activités de pêche.

#### Scénario principal

1. L'observateur sélectionne le menu "Ecosystèmes Marins Vulnérables" de l'arbre PNR, Hors Vrac 
2. La fenêtre de saisie des "Ecosystèmes Marins Vulnérables" s'affiche
    * Une zone affiche le poids total calculé (en Kg)
      * Le poids total est calculé à partir des poids saisies pour chaque EMV
    * Une case à cocher permet d'indiquer si l'inventaire est exhaustif (par défaut oui, cochée)
    * Si le poids total est estimé, par une case à cocher
3. Un bouton :heavy_plus_sign: permet d'ajouter une nouvelle catégorie d'EMV
4. Un bouton **((**:heavy_plus_sign:**)** lui permet d'ajouter toutes les catégories d'EMV
5. Pour chaque nouvelle catégorie d'EMV, il doit renseigner :
    * La catégorie
    * Le poids total, en kg
    * Un commentaire
      * Une fois saisi, le commentaire s'affiche dans une info-bulle au survol de la souris
    * Une photo (A REALISER)
6. L'observateur peut supprimer une catégorie d'EMV en la sélectionnant et en cliquant sur l'icône "Poubelle"

---

## Opération > Capture > Captures accidentelles

**REF: OBSMER/OPERATION_CAPTURE/CAPTURE_ACCIDENTELLE**

![ui-batch-accident](/projects/obsmer/spe/images/batch/batch-accident.svg)

**Capture accidentelle** : capture accessoire d’espèces protégées, en danger ou menacées (voir
Définition de PETS)

**PETS** : Protected Endangered and Threatened Species. Dans le cadre de l’EU-MAP et de sa
révision pour la période 2022-2027, la liste des espèces protégées à suivre est établie en vertu de
la législation de l‘Union et des accords internationaux. Elle fait référence aux listes des deux
conventions internationales OSPAR (région I à V) et UNEP (Méditerranée) et des organisations
régionales des pêches NEAFC (=Liste OSPAR), ICCAT et GFCM (= Liste UNEP). Ces espèces sont des
espèces d’élasmobranches et d’amphihalins, prélevées en prises accessoires ou accidentelles de
la pêche professionnelle

#### Scénario principal

1. L'observateur est positionné sur l'onglet "Captures accidentelles"
    * Par défaut l'écran affiche la saisie des mesures individuelles
2. L'observateur peut ajouter une nouvelle capture en cliquant sur le bouton :heavy_plus_sign:
3. Une nouvelle ligne s'ajoute au tableau
    * La liste de sélection de l'espèce scientifique s'ouvre automatiquement pour la sélection
4. L'observateur peut renseigner les éléments suivants de la nouvelle capture
    * Le code de l'espèce scientifique *, dans une liste déroulante
    * Si l'animal est mort (parmi la liste suivante : "Mort", "Vivant", "Blessé")
    * Le sexe de l'animal capturé (parmi la liste suivante : "Indetermine", "Male", "Femelle", "Non sexe")
    * S'il y a des traces de capture (case à cocher)
       * Si oui il faut renseigner le type de trace (gaffé, amputation, lacération, ...)
    * La position de l'individu au niveau de l'opération (parmi la liste suivante : "Début du virage", "Milieu du virage", "Fin du virage")
    * Un bouton (en forme d'histogramme) permet d'activer l'écran de saisie de mesure individuelle pour la capture
    * Une photo
    * Un commentaire
5. A chaque sauvegarde, le nombre total de mesures individuelles est mit à jour 
6. L'observateur peut aussi supprimer toutes les captures saisis ou décider de supprimer les captures une à une


#### Ajout de mesure à la capture accidentelle

![ui-batch-accident-measures](/projects/obsmer/spe/images/batch/batch-accident-measures.svg)

1. L'oservateur ajoute des mesures à la capture accidentelle saisie
    * En fonction de l'espèce (dauphin / oiseau), on peut avoir différentes mesures (appliquées par la stratégie)


#### Détails Techniques
- Sexe de l'espèce capturée : PMFM - SEX (ID = 196)
  - UNK, Male, Femelle, Non sexe
  
- Etat de l'espèce : PMFM - DEAD_ALIVE (ID = 1393)
  - Rejet vivant, Rejet mort, Unk, Rejet en état de décomposition
  
- Type de trace : PMFM - CATCH_TRACK_TYPE (ID = 2428)
  - Gaffé, Amputation, Lacération, Fracture rostre, Aucune

- Position de l'individu durant l'opération : PMFM - NET_STRING_CATCH_POSITION (ID = 3259)
  - Début du virage, Milieu du virage, Fin du virage

> 14/03/2024 :

> Mort ? pas de case à cocher - Liste déroulante : OK

> Ajout les PSFMs suivants (issue de la stratégie) :

> En fonction de l'espèce (souvent dauphins et oiseaux), on peut avoir plusieurs mesures

> Exemple : Si saisit de dauphin : 1 mesure de longueur et 1 circonférence

> Scénario : Aller chercher le type de mesure pour chaque espèce dans les .. (Ajout de PSFM)

> Ouvrir un écran comme celui de saisie des mesures avec choix des PSFM de mesure suivant le choix des taxons (définit dans la stratégie)

> On saisit directement et on a une icone détail (3 barres) pour accèder à la saisie 

## Opération > Capture > Captures accidentelles > Remise à l'eau

**REF: OBSMER/OPERATION_CAPTURE/CAPTURE_ACCIDENTELLE/REMISE-A-L-EAU**

![ui-batch-accident-release](/projects/obsmer/spe/images/batch/batch-accident-release.svg)

#### Scénario principal

1. L'observateur est positionné sur l'onglet "Remise à l'eau"
2. Il peut ajouter des individus remit à l'eau par rapport aux captures accidentelles mesurées 
3. L'observateur peut renseigner les éléments suivants pour chaque remise :
    * La référence de la marque (saisie dans la mesure individuelle de la capture accidentelle)
    * La date de remise à l'eau
    * La latitude
    * La longitude
    * Un commentaire
4. L'observateur peut aussi supprimer toutes les remises à l'eau saisis ou décider de supprimer les remises à l'eau une à une

## Opération > Capture > Mesures indivuelles

**REF: OBSMER/OPERATION_CAPTURE/MESURES**

La création de mesures individuelles est accessible depuis le tableau de consultation des captures en cliquant sur l'icône :bar_chart:

#### Scénario principal

[Spécifications communes / Mesures](/projects/common/spe/regles_communes.md#commun-saisie-de-mensuration)

> TODO: Il faut des PSFM supplémentaires (ex: état de remise à l'eau)

> Rendu ICI : voir avec ESI si besoin d'un point avec la MOA  

---
## Administration > Lots > Modèle d'arbre (1/3)

![ui-batch](/projects/obsmer/spe/images/batch/model/batch-tree-edit-1.svg)

---
## Administration > Lots > Modèle d'arbre (2/3)

![ui-batch](/projects/obsmer/spe/images/batch/model/batch-tree-edit-2.svg)

---
## Administration > Lots > Modèle d'arbre (3/3)

![ui-batch](/projects/obsmer/spe/images/batch/model/batch-tree-edit-3.svg)

---
## Administration > Lots > Règles 

![ui-batch](/projects/obsmer/spe/images/batch/batch-rules.svg)

---
## Lots espèces

(en cours de rédaction)

> Règle(s) métier :
> - Contrôle poids:
>
> ```text
> Somme poids élevés ~= Poids total capture
> 
> Marge d'erreur x% 
> (x en variable d'exploitation)
> Warning non bloquant  
> ```
> - Saisie du taux d'échantillonnage :
>
> ```text
> - Soit rapport du poids
> - Soit saisie du taux 1/n
> - + Saisie du sous-taux 1/n
> ```

---

> Remarques :

> VFA à EIS : supprimer l'IHM ci dessous

## Mesures individuelles (1/2)

(en cours de rédaction)

![batch-species](/projects/apase/spe/images/individual-measure.svg)

> Règle(s) métier :
> - Saisie au 1 cm, 0.5cm, 1mm, suivant l'espèce (cf normes Ifremer)

---
## Mesures individuelles (2/2)

Questions : 
- Poids RTP: faut-il tracer la valeur du poids "RTP des lot fils" dans un PSFM RTP ?  
  (Thomas dit que oui: pour faire la différence avec les poids réels)
- Poids de référence: faut-il pouvoir choisir la méthode "Déclaration par un observateur"

---
## Mesures de dénombrement

Lorsque l'utilisateur n'a pas le temps de saisir les mensurations, il doit pouvoir détailler uniquement le nombre d'individu (par espèce scientifique)
(**DEV A REALISER**)

> Note technique: Ajouter une option à l'écran de saisie des mensurations, qu imasque les champs et PSFM autres l'espèce scientifique et le nombre d'individu  

---
## Photos

Pouvoir ajouter des photos : 
- sur un lot d'espèces
- sur un individu mesuré
- sur l'opération

Permettre une visualisation/recherche par un superviseur

---
## Pièces jointes

Au niveau de la marée, pour stocker les bordereaux de saisie

> Non prioritaire (tant que WAO est utilisé)

---
## Inerte, végétaux et animaux

(en cours de rédaction)

- Inerte, végétaux : cf formulaire terrain
- Animaux (ENV) : cf formulaire terrain

---
## Captures accidentelles

(en cours de rédaction)
- Plusieurs cas : Oiseaux, Mammifères

---
## Contrôle des données

Les saisisseurs doivent pouvoir visualiser une synthèse des poids, par lots parents

---
## Validation des données

- Faciliter le travail des validateurs
- Filtres :
  - Critère PSFM (ex: programme de rattachement sur ObsMer)
  - Pouvoir enregistrer des filtres ?

---
## Référentiels

(en cours de rédaction)

- Ajouter la régionalisation des espèces/espèces cibles/engins (Outre-mer)

---

## Historique

|       Date | Auteur | Sections mises à jour                                             |
|-----------:|--------|-------------------------------------------------------------------|
| 11/09/2023 | BLA    | Création                                                          |
| 10/11/2023 | BLA    | Ajout écrans Marée, Engins et OP                                  |
| 19/01/2024 | VFA    | Ajout de cas d'utilisation (Marées, Marée, Opérations, Opération) |
| 25/01/2024 | BLA    | Mise à jour des écrans de Capture                                 |

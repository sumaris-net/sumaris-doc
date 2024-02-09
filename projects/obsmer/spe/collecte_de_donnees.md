# Collecte de données
## Spécifications (ObsMer)
---

## Sommaire

- [Marée](#/4/3)
    - [Engin](#/4/4)
- [Opération](#/4/11)
    - [Capture](#/4/12)
        - [Mesures individuelles](#/4/15)
- Référentiels
- Historique

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

> VFA -> MOA : port -  Est ce le seul niveau de lieu saisissable ? (Criée, Quartier, ...)

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
      * l'API existante (Allegro) est utilisée pour se connecter au serveur WAO
      * Le programme de rattachement est automatiquement renseigné à partir du plan d'échantillonnage
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
      * Le type * de vente (_référentiel des TYPE DE VENTE_)
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

> PSFM macro-déchets : pas obligatoire et pas lié à l'onglet dans les captures

---

### Marée > Engins 

**REF: OBSMER/ENGINS**

**Engin** : Ensemble de matériels utilisé à bord d’un navire spécifique (mis en œuvre par un savoir-faire), qui a pour fonction l’exploitation d’une ressource marine.

![ui-gears-table](/projects/obsmer/spe/images/gears-table.svg)

#### Scénario principal

1. L'observateur sélectionne le menu "Engin" dans l'interface de l'arbre du menu ou l'onglet "Engin" dans l'interface d'une marée
2. Les engins de la marée s'affichent dans un tableau. Les informations suivantes sont affichées pour chaque engins :
    * Engin (Code et libellé)
    * Type d'engin 
    * Les caractéristiques de l'engin, définit par l'engin et la stratégie, saisissable 
3. Un bouton permet d'afficher ou de masquer des colonnes
4. Un bouton :heavy_plus_sign: permet d'ajouter un nouvel engin


**Variante(s) :** 

**Variante 2a** - Par une option de configuration ne sont affichées que les caractéristiques  valorisés (<b>A REALISER)

> Questions/Remarques :

> VFA -> EIS : prép-requis : Pour que le menu "Engins" soit actif, la marée doit être saisie et enregistrée ?

> VFA -> MOA : Type d'engin - indiqué par le champ GEAR.PARENT_GEAR_FK ? Faut il le faire apparaitre ?

> VFA -> EIS : Beaucoup de PSFM si beaucoup d'engins (scrollbar horizontale). Exemple d'un engin avec 12 PSFM

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
      * La période de la dernière utilisation
      * Un commentaire 
3. L'observateur sélectionne un engin
4. L'engin et ses caractéristiques sont renseignés dans la fenêtre de saisie d'un nouvel engin
   * si l'application est en mode déconnecté , la recherche se fait parmis les données synchronisées

**Variante(s) :**

**Variante 3a** - Les informations de saisie sont affichées dans un bandeau rouge, sur fond blanc
Exemple :_"Pour les maillages, saisir uniquement les maillages à la jauge."_
C'est une option liée au programme de collecte.

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
    * La date de début de pêche
    * La position de début des opérations
    * La date de fin de pêche
    * La position de fin
3. Un bouton permet d'afficher ou de masquer des colonnes
4. Un bouton :heavy_plus_sign: permet d'ajouter une nouvelle opération


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

> Réunion MOA 06/02/2024 : 

> VFA -> MOA : Liste exhaustive des critères de filtrage sur les opérations ? Oui

> pas de nécessité de rajouter des filtres, le filtre état suffit car généralement il y a 10-15 opérations d'affichées par marée

---

## Marée > Opération > Détails

**REF: OBSMER/OPERATION/DETAILS**

**Fenêtre principale de saisie d'une opération**

![ui-operation](/projects/obsmer/spe/images/operation.svg)

#### Scénario principal

1. L'observateur demande la création d'une nouvelle opération (OBSMER/OPERATION_MENU : bouton :heavy_plus_sign:)
2. Une fenêtre s'ouvre sur la saisie des caractéristiques de l'opération. 
3. L'observateur renseigne les éléments suivants :
   * L'engin* utilisé
   * L'espèce cible
   * La date, l'heure et la position de début de pêche
   * La date, l'heure et la position de fin de pêche
   * Les caractéristiques de l'opération (PSFM définit par la stratégie appliquée):
     * Le type d'opération dans une liste déroulante (Opération échantillonnée, non échantillonnée, opération de repos)
     * Le déroulement normal de l'opération avec des cases à cocher (vide : par défaut, oui, non)
     * Des réalisation de mesures individuelles avec des cases à cocher (vide : par défaut, oui, non)
     * La profondeur moyen de l'engin
     * L'état de la mer dans une liste déroulante (PSFM QUALITATIVE_VALUE.PARAMETER_FK = SEA_STATE)
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

> Questions :

> VFA - MOA : Dépend de l'habitude du navire ?

> VFA - MOA : Zone d'activité (Rectangle ?)


**Variante 3b** - Engin dormant (A REALISER)

3. Si l'engin choisi est un engin dormant : autoriser date de début OP AVANT marée 

**Variante 3c** - Engin traînant (A REALISER)

3. Si l'engin choisi est un engin traînant : Empêcher date de début OP en dehors de la période de la marée

**Variante 3d** - Pêche en bœuf et navire associé (DEV A RÉALISER)

3. Si l'engin choisit est dans une liste (`PTB - Chaluts bœufs de fond`, `PTM - Chaluts bœufs pélagiques`)
   Alors il devient obligatoire de saisir le navire associé à l'opération
   > cf mantis Allegro: https://forge.ifremer.fr/mantis/view.php?id=41410

**Variante 3e** - Filtrer les métier pratiqués - PAS PRIORITAIRE

3. Le système filtre les espèces cibles en fonction des données historiques déjà saisies.
   L'utilisateur peut retirer ce filtre pour faire une recherche sur le référentiel complet. 

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

![ui-batch-tree](/projects/obsmer/spe/images/batch/batch-tree.svg)


> Questions

> VFA -> MOA : Ne faudrait-il pas un s à Capture ?


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
    *  Coup nul : une case à cocher indique qu'il s'agit d'un coup nul ou non (case cochée = Oui)
    * Le poids total (en kg) de toutes les espèces capturées
    * Ce champ est calculé
      * Un bandeau en haut de l'écran rappel la localisation dans l'abre d'échantillonnage (Ex : "<i>Capture / Partie retenue > PR") 

    
#### Variantes

**Variantes**

**Variante 4a** - Cas du coup nul (pas de capture)

4. Dans la saisie de la capture, l'observateur coche le champ "Coup nul". 
   Le poids total de la capture est grisé et prend la valeur 0. Tout le reste de l'arbre d'échantillonnage est aussi grisé.

![ui-batch-tree-null](/projects/obsmer/spe/images/batch/batch-tree-null.svg)

> Questions:

> VFA -> MOA : Poids total de la capture: non obligatoire, calculé (sauf si cout nul)

> VFA -> MOA : Destination du produit : PSFM `PRODUCT_DESTINATION` (mais il manque `Obligation à débarquer`)


---
## Opération > Capture > Contrôle 

**REF: OBSMER/OPERATION/CAPTURE/CONTROLE**

Contrôle de la saisie d'une capture :

![ui-batch-tree-control](/projects/obsmer/spe/images/batch/batch-tree-control.svg)

#### Scénario principal

1. L'observateur clique sur le bouton "Contrôler"
2. L'abre d'échantillonnage n'est alors pas dépilé et les poids sont calculés et remontés
    *  Les poids calculés sont affichés en bleu et en italique 
   

---
## Opération > Capture > PR

**REF: OBSMER/OPERATION/CAPTURE/PR**

**Partie retenue d'une capture** : Partie de la capture remontée à bord du navire qui est conservée à bord une fois le tri effectué par l’équipage.
= Part commerciale + Obligation de débarquement

![ui-batch-tree-pr](/projects/obsmer/spe/images/batch/batch-tree-PR.svg)

#### Scénario principal
1. L'utilisateur sélectionne le menu "Partie retenue" dans l'arbre d'échantillonnage
2. L'arbre se déplie et le sous menu suivants apparaissent sous le menu "Partie retenue" (_PSFM = PRODUCT_DESTINATION_)
    * "Consommation humaine"
    * "Appat"
    * "Godaille"
    * "Obligation à débarquer" 
    * "Utilisation industrielle" 
3. L'écran de saisie de la "Partie retenue" se met à jour
    *  Un bandeau en haut de l'écran rappel la localisation dans l'abre d'échantillonnage (Ex : "<i>Capture / Partie retenue")
4. Il n'y a rien d'afficher dans la fenêtre de saisie de la partie retenue de la capture 

> Questions :

> VFA -> MOA : Exhausivité de la destination de la partie retenue ? 

**Variantes**

**Variante 2a** - Liste du PSFM PRODUCT_DESTINATION paramétrable par une option ("Option du programme")

---
## Opération > Capture > PR > Consommation humaine

**REF: OBSMER/OPERATION/CAPTURE/PR/HCN**

![ui-batch-tree-pr-hcn](/projects/obsmer/spe/images/batch/batch-tree-PR-HCN.svg)

#### Scénario principal

1. L'utilisateur sélectionne le sous-menu "Consommation humaine" dans le menu "Partie retenue" de l'arbre d'échantillonnage
2. L'écran de saisie se met à jour
    *  Un bandeau en haut de l'écran rappel la localisation dans l'abre d'échantillonnage (Ex : "<i>Capture / Partie retenue / Consommation Humaine")
    *  Un compteur indique le nombre d'espèce commerciale saisie à côté du nom du devenir de l'espèce
3. L'écran de saisie pour la "Consommation humaine est composé des éléments suivants"
    *  Une zone de saisie du poids total (en Kg)
    *  Une zone de saisie du poids échantillonné (en Kg)
    *  Une zone de saisie du taux d'échantillonnage (1/n), avec le dénominateur n à saisir
       * ration ou % : VFA - Attente retour MOA - La question et à poser aux observateurs 
    *  Une case à cocher indiquant si l'inventaire des espèces est exhaustif (Oui si la case est coché)
    *  VFA : Une case à cocher indiquant si la partie retenue est estimée (Oui si la case est coché) 
    *  Un tableau affichant la liste des espèces commerciale à saisir
4. L'observateur peut ajouter des espèces commerciale dans le tableau en cliquant sur le bouton :heavy_plus_sign:
5. Il peut renseigner pour chaque espèce commerciale :
    * Le nom de l'espèce
    * La présentation (_PSMF = DRESSING_, _METHOD = 42_, _Observation par un observateur_) 
        * Par défaut WHL (_entier_) 
    * L'état (_PSMF = PRESERVATION_, _METHOD = 42_, _Observation par un observateur_)
        * Par défaut FRE (_frais_) 
   *  Le poids total (unité par défaut en Kg)
        * L'unité du poids est paramétrable
   *  Le taux d'échantillonnage (1/n)
   *  Le poids d'échantillonnage (en Kg)
   *  Le nombre d'individu échantillonné
6. Un bouton (en forme d'histogramme) permet d'activer l'écran de saisie de mesure individuelle pour l'espèce commerciale  
7. L'observateur peut supprimer une espèce commerciale en la sélectionnant et en cliquant sur l'icône "Poubelle"

> Questions :

> VFA -> MOA : Taux d'échantillonnage : ratio ou %

> VFA -> MOA : Permettre l'ajout de PSFM ?

> VFA -> EIS : la saisie du poids total, taux échant. se fait par espèce, il n'y a plus de saisie pour la totalité du lot ?

> VFA -> EIS : Unité des PSFM - le choix de l'unité impacte le PSFM de destination. Possible de choisir l'unité pour le poids (oui), la taille ?

---

## Opération > Capture > PR > Appat

**REF: OBSMER/OPERATION/CAPTURE/PR/BAI**

![ui-batch-tree-pr-bai](/projects/obsmer/spe/images/batch/batch-tree-PR-BAI.svg)

> Questions :

> VFA -> EIS : Même scénario que OBSMER/OPERATION/CAPTURE/PR/HCN ?

---

## Opération > Capture > PR > Consommation humaine > Mesures indivuelles

**REF: OBSMER/OPERATION_CAPTURE/PR/HCN/MI**

![ui-samples](/projects/obsmer/spe/images/samples.svg)

#### Scénario principal

L'observateur à ouvert l'écran de saisie des mesures individuelles pour l'espèce commerciale.

L'écran affiche la liste des mesures individuelles pour l'espèce commerciale
1. L'écran est composé des champs suivants :
    *  Le nom de l'espèce scientifique
   *  La longueur totale mesurée, en cm
   *  Le poids calculé RTP (Relation Taille Poids) en kg
2. Un bouton permet d'ajouter une mesure individuelle

![ui-sample-add](/projects/obsmer/spe/images/sample-add.svg)

---

## Opération > Capture > PNR, Vrac

**REF: OBSMER/OPERATION/CAPTURE/PNR/VRAC**

**Partie non retenue** : Partie de la capture remontée à bord du navire qui est rejeté à la mer une
fois le tri effectué par l’équipage = Rejets détaillés + Rejets non détaillés + Inerte et Végétaux

**Rejets détaillés** = poissons + autres espèces commerciales.

**Rejets non détaillés** = animaux non détaillés (méduses, étoiles de mer, etc.).

**Inerte et végétaux** = partie inerte (sédiments, cailloux, débris coquilliers, déchets, etc.) + végétaux.



#### Scénario principal
TODO

---
## Opération > Capture > PNR, Hors Vrac

**REF: OBSMER/OPERATION/CAPTURE/PNR/HVRAC**

#### Scénario principal
TODO

Capture accidentelle

> TODO: Il faut des PSFM supplémentaire (ex: état de remise à l'eau)  

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

> VFA -> EIS : supprimer l'IHM ci dessous

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

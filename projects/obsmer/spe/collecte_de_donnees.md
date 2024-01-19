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
- Possibilité de modifier/supprimer une ligne
  - Facades (x4) 
    - Strates : Trainants, Dormants_<12m, Trainants_[12-18m[

> Code source : https://gitlab.ifremer.fr/sih/WAO

## Ergonomie générale

<b>REF: OBSMER/INTERFACE

![ui-main_tree](/projects/obsmer/spe/images/main-tree.svg)

L'interface est composée des éléments graphiques suivants :
1. Interface de gauche : Arbre du menu, interface récapitulative des onglets principaux
    * Permet de savoir ou on se trouve dans l'arbre du menu et de pouvoir naviguer dans les noeuds de l'arbre
2. Un bandeau horizontal, récapitulatif de la marée / vente
   * Sur la sélection d'une marée, le bandeau affiche les informations suivantes 
     * Immatriculation du navire de la marée
     * La date de début de la marée
   * Le bandeau permet d'afficher les opérations dans une vue cartographique (à voir au prochain point prototype)
   * Un bouton permettant d'importer les formulaires (à détailler)
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
   * 
Pour la saisie de données, le niveau de plus bas de l'arbre du menu est à la capture. 
Dans le menu "Capture", Un arbre d'échantillonnage permet de saisir les lots des espèces (REF: OBSMER/LOTS PAR ESPECE)

![ui-main_tree_expanded](/projects/obsmer/spe/images/main-tree-expanded.svg)

---

## Marées

<b>REF: OBSMER/MAREES

Marée : Voyage en mer, ayant pour vocation une activité de peche (peut etre une campagnes halieutique ou une marée d'un navire professionnel, etc.).
Un voyage peut présenter une marée observée (en mer, au débarquement), qui désigne une marée de pêche professionnelle au cours de laquelle des relevés sont effectués par un observateur.

<b> Fenêtre principale des marées

![ui-gears](/projects/obsmer/spe/images/trips-table.svg)

#### Scénario principal

1. L'observateur sélectionne le menu "Marées" dans l'interface de l'arbre du menu.
2. Les marées s'affichent dans un tableau. Les informations suivantes sont affichées pour chaque marée :
    * Le programme de collecte
    * Le navire
    * Le port de départ
    * La date de départ
    * La date de retour
    * Le saisisseur
    * La liste des observateurs (séparés par une virgule)
3. Un bouton permet d'afficher ou de masquer des colonnes
4. Un bouton + permet d'ajouter une nouvelle marée

---

## Marée > Détails

<b>REF: OBSMER/MAREE_DETAILS

<b> Fenêtre principale de saisie d'une marée

![ui-gears](/projects/obsmer/spe/images/trip-new.svg)

#### Scénario principal

1. L'observateur demande la création d'une nouvelle marée (OBSMER/MAREE_MENU : bouton +) 
2. Une fenêtre s'ouvre ("Nouvelle marée")
    * La fenêtre est composée de 3 onglets
      * "Détails", positionnement par défaut pour la saisie de la marée
      * "Engins"
      * "Opérations"
4. Dans l'onglet "Détails", l'observateur choisit pour cette marée (_les champs marqués d'un * sont obligatoires_) :
    * Le programme de collecte* dans une liste déroulante : information déjà pré-rempli
    * L'observateur* dans une liste déroulante
      * Un bouton + permet de rajouter des obervateurs à la marée
    * Le plan d'échantillonnage 
      * La stratégie de référence* (menu déroulant avec stratégie de la société du saisisseur)
      * Le programme de rattachement* (renseigné automatiquement si connexion avec WAO)
    * Le navire, s'il est dans la liste déroulante
4. Dans l'onglet "Détails", L'observateur saisie pour cette marée :
   * Le lieu de départ* (_saisie des 3 premières lettres, Référentiel des LIEUX_), 
   * La date* et l'heure* de début de marée
   * Le lieu de retour* (_saisie des 3 premières lettres, Référentiel des LIEUX_),
   * La date* et l'heure* de début de marée
   * La durée de la marée est automatique calculée et affichée après la saisie des dates/heures de début et de fin
   * Les détails sur la vente 
     * Le lieu* de vente 
     * La date* de vente
     * Le type* de vente (_référentiel des TYPE DE VENTE_)
   * Des caractéristiques (PSFM définit pat la stratégie appliquée):
     * L'observateur à la possibilité de rajouter des caractéristiques à la marée  
       * Nombre d'hommes à bord*
       * Document déclaratif (case à cocher, oui/non)
       * Débarquement de macro-déchets à terre* (case à cocher, oui/non)
           * Cette saisie conditionnera l'affichage d'un onglet "Macrodéchets" au niveau de l'écran des captures
   * Un commentaire (maximum 2000 caractères)
5. L'observateur sélectionnera des types d'engin observés dans l'onglet "Engins"
    * Le fenêtre de sélection d'engins s'ouvre

Un bouton permet de sauvegarder la marée.

> Modèle de données de Marée : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/raw/master/model/data/trip.svg

> Modèle de données de vente : TODO (A REALISER par VFA)

---
### Marée > Engins 

<b>REF: OBSMER/ENGINS

Engin : Ensemble de matériels utilisé à bord d’un navire spécifique (mis en œuvre par un savoir-faire), qui a pour fonction l’exploitation d’une ressource marine.

![ui-gears-table](/projects/obsmer/spe/images/gears-table.svg)

#### Scénario principal

1. L'observateur sélectionne le menu "Engin" dans l'interface de l'arbre du menu ou l'onglet "Engin" dans l'interface d'une marée
2. Les engins de la marée s'affichent dans un tableau. Les informations suivantes sont affichées pour chaque engins :
    * Engin (Code et libellé)
    * Les caractéristiques de l'engin, définit par l'engin et la stratégie, saisissable
3. Un bouton permet d'afficher ou de masquer des colonnes
4. Un bouton + permet d'ajouter un nouvel engin


<b>Variante(s) : 

<b>Variante 2a - Par une option de configuration ne sont affichées que les caractéristiques  valorisés (<b>A REALISER)

---
### Marée > Engin > Détails

<b>REF: OBSMER/ENGINS_DETAILS

1. L'observateur demande l'ajout d'un nouvel engin à la marée (OBSMER/ENGINS_MENU : bouton +)
2. Une fenêtre s'ouvre ("Nouvel engin")
    * Les engins appartenant au navire sélectionné apparaissent dans une liste déroulante
3. L'observateur peut sélectionner un engin dans la liste
    * L'engin sélectionné est affiché avec son code et son libellé
    * Les caractéristiques de l'engin sélectionné s'affichent, permettant une saisie par l'opérateur
        * Les caractéristiques (PSFM à saisir) sont propre à l'engin sélectionné (suivant la stratégie appliquée)
        * Les champs marqués par un * sont obligatoires
        * A l'ouverture de la fenêtre de saisie, le champ "Ajouté" est grisé
            * Le champ devient actif quand tous les champs obligatoires on été saisie
    * Les caractéristiques de l'engin sélectionné s'affichent, permettant une saisie par l'opérateur
    * Le nombre d'engin attribué à la marée est affiché au niveau de l'onglet "Engin" : l'ajout d'un engin incrémente le compteur

Saisie des caractéristiques d'un engin - Exemple avec un engin de type "Filet"

![ui-gear](/projects/obsmer/spe/images/gear.svg)

<b>Variante(s) :

<b>Variante 2a - Dans le cas d'une création d'un nouvel engin, l'observateur à la possibilité de charger les caractéristiques engin d’un navire déjà observé.

![ui-gear](/projects/obsmer/spe/images/gears-present.svg)

pré-requis : Le nombre de mois pour la recherche d'engin d'une marée doit être configurable et sélectionnable dans les préférences
Nombre de mois pour la recherche ? (<b>A DEMANDER à la MOA)

L'observateur clique sur le bouton rechercher, dans la fenêtre "Nouvel engin"
1. Une nouvelle fenêtre "Engins Existants" s'ouvre
2. L'observateur saisie une date de début de période de marée et de fin de période de marée
    * Les engins des navires déjà observés sur la période s'affichent dans un tableau
    * Les informations suivantes, pour chaque engin, sont affichées :
      * Type d'engin
      * Le libellé de l'engin
      * Les caractéristiques (PSFM obligatoires et renseignés)
      * La période de la dernière utilisation
      * Un commentaire 
3. L'observateur sélectionne un engin
4. L'engin et ses caractéristiques sont renseignés dans la fenêtre de saisie d'un nouvel engin
   * si l'application est en mode déconnecté , la recherche se fait parmis les données synchronisées

<b>Variante 3a - Les informations de saisie sont affichées dans un bandeau rouge, sur fond blanc
Exemple :_"Pour les maillages, saisir uniquement les maillages à la jauge."_
C'est une option liée au programme de collecte (<b>A CONFIRMER par la MOA)


> - [ ] ~~Optimiser le chargement de la stratégie~~
> - [ ] Conserver uniquement les colonnes PSFM ayant une valeur
> - [ ] Libellé d'engin ?

---

## Marée > Opérations

<b>REF: OBSMER/OPERATION_MENU

<b> Fenêtre principale du menu opération

Pré-conditions: Pour que l'onglet "Opération" soit actif, la marée doit être saisie et sauvegardée.

Opération : Opération de pêche qui consiste à la mise en oeuvre d’un engin de pêche pour capturer des espèces aquatiques marines. L’opération débute quand l’engin est mis à l’eau et qu’il est pêchant, elle se termine quand l’engin est récupéré par le professionnel et que l’engin n’est plus pêchant.

![ui-operation](/projects/obsmer/spe/images/operations-table.svg)

#### Scénario principal

1. L'observateur sélectionne le menu "Opération" dans l'interface de l'arbre du menu ou l'onglet "Opérations" dans l'interface d'une marée
2. Les opération s'affichent dans un tableau. Les informations suivantes sont affichées pour chaque opération (à valider):
    * L'engin utilisé
    * L'espèce cible
    * La date de début de pêche
    * La position de début des opérations
    * La date de fin de pêche
    * La position de fin
3. Un bouton permet d'afficher ou de masquer des colonnes
4. Un bouton + permet d'ajouter une nouvelle opération


---

## Marée > Opération > Détails

<b>REF: OBSMER/OPERATION_DETAILS

<b> Fenêtre principale de saisie d'une opération

![ui-operation](/projects/obsmer/spe/images/operation.svg)

1. L'observateur demande la création d'une nouvelle opération (OBSMER/OPERATION_MENU : bouton +)
2. Une fenêtre s'ouvre sur la saisie des caractéristiques de l'opération. 
3. L'observateur renseigne les éléments suivants :
   * L'engin* utilisé
   * L'espèce cible
   * La date, l'heure et la position de début de pêche
   * La date, l'heure et la position de fin de pêche
   * Les caractéristiques de l'opération (PSFM définit par la stratégie appliquée):
     * Le type d'opération dans une liste déroulante (Opération échantillonnée, non échantillonnée, opération de repos)
     * Le déroulement normal de l'opération avec des cases à cocher (oui, non)
     * Des réalisation de mesures individuelles avec des cases à cocher (oui, non)
     * La profondeur moyen de l'engin
     * L'état de la mer dans une liste déroulante (PSFM QUALITATIVE_VALUE.PARAMETER_FK = SEA_STATE)
     * Autres observations (suivant la stratégie appliquée)
       * Force du vent
       * ...

<b> Variante

<b>Variante 3a - Il est possible de filtrer sur les espèces cibles (icone à droite du choix de l'espèce) 
Dépend de : 
- Habitude du navire ? 
- La période (A DEFINIR)
A REALISER

<b>Variante 3b - Cas du coup nul (pas de capture) : 
A voir avec la MOA : _que signifie pas de capture ?_ 
S'il n'y a pas de capture doit on saisir des captures (Poids à 0) ?


> - Prédocumenter la liste des espèces cibles / navires ? Pas prioritaire
> - Engins dormants: autoriser date de début OP AVANT marée
> - Engins traînants : Empêcher date de début OP en dehors de la période de la marée

---
## Opération > Capture (1/2)

![ui-batch](/projects/obsmer/spe/images/batch/batch-tree.svg)

---
## Administration > Lots > Modèle d'arbre (1/3)

![ui-batch](/projects/obsmer/spe/images/batch/batch-tree-edit-1.svg)

---
## Administration > Lots > Modèle d'arbre (2/3)

![ui-batch](/projects/obsmer/spe/images/batch/batch-tree-edit-2.svg)

---
## Administration > Lots > Modèle d'arbre (3/3)

![ui-batch](/projects/obsmer/spe/images/batch/batch-tree-edit-3.svg)

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

|       Date | Sections mises à jour                                                                         |
|-----------:|-----------------------------------------------------------------------------------------------|
| 11/09/2023 | Création                                                                                      |
| 10/11/2023 | Ajout écrans Marée, Engins et OP                                                              |

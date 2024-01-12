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

## Arbre d'échantillonnage

<b>REF: OBSMER/INTERFACE

![ui-main_tree](/projects/obsmer/spe/images/main-tree.svg)

L'interface est composée des éléments graphiques suivants :
1. Interface de gauche : Interface récapitulative des onglets principaux.
    * Permet de savoir ou on se trouve dans l'arbre d'échantillonnage et de pouvoir naviguer dans les noeuds de l'arbre
2. Un bandeau horizontal, récapitulatif de la marée / vente
   * Le bandeau affiche les informations suivantes de la marée
     * Immatriculation du navire
     * La date de début de marée
3. Sous le bandeau, l'interface centrale permet la saisie des données
4. Sous l'interface centrale, des boutons permettent de sauvegarder et de finaliser la saisie


#### Scénario principal

1. L'observateur clique sur un onglet de l'arbre.
   * Les informations centrale propre à l'onglet s'ouvre dans l'interface centrale.
     * Saisie des détails d'une marée : Un écran, à droite de l'interface centrale affiche les informations suivantes :
       * Nom du saisisseur
       * Mode de saisie (terrain ou bureau)

    
---
## Marée > Détails

<b>REF: OBSMER/MAREE

Marée : Voyage en mer, ayant pour vocation une activité de peche (peut etre une campagnes halieutique ou une marée d'un navire professionnel, etc.).
Un voyage peut présenter une marée observée (en mer, au débarquement), qui désigne une marée de pêche professionnelle au cours de laquelle des relevés sont effectués par un observateur.

![ui-gears](/projects/obsmer/spe/images/trip-new.svg)

L'observateur sélectionne l'onglet "Marée" dans l'interface de l'arbre d'échantillonage. 

---

#### Scénario principal

1. L'observateur demande la création d'une nouvelle marée (bouton + à droite dans le bandeau horizontal) 
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
      * _A supprimer_ => Le bouton +, à droite de la liste déroulante, permet de créer un nouveau Navire
4. Dans l'onglet "Détails", L'observateur saisie pour cette marée :
   * Le nombre d'homme à bord
   * Le lieu de départ* (_saisie des 3 premières lettres, Référentiel des LIEUX_), 
   * La date* et l'heure* de début de marée
   * Le lieu de retour* (_saisie des 3 premières lettres, Référentiel des LIEUX_),
   * La date* et l'heure* de début de marée
   * La durée de la marée est automatique calculée et affichée après la saisie des dates/heures de début et de fin
   * Les détails sur la vente
     * Le lieu* de vente (TODO - faire le model de sale) 
     * La date* de vente
     * Le type* de vente (référence des TYPE de VENTE)
   * La présence de macrodéchets* (case à cocher, oui/non)
     * Cette saisie conditionnera l'onglet "Macrodéchets" au niveau des captures
   * Un commentaire (maximum 2000 caractères)
5. L'observateur sélectionnera des types d'engin observés dans l'onglet "Engins"
    * Le fenêtre de sélection d'engins s'ouvre

Un bouton permet de sauvegarder la marée.


#### Modèle de données fishing_trip

![ui-trip](/model/data/trip.svg)

#### Modèle de données sale ?


---
### Marée > onglet Engins

<b>REF: OBSMER/ENGINS

Engin : Ensemble de matériels utilisé à bord d’un navire spécifique (mis en œuvre par un savoir-faire), qui a pour fonction l’exploitation d’une ressource marine.

L'observateur sélectionne l'onglet "Engins"

![ui-gears-table](/projects/obsmer/spe/images/gears-table.svg)

#### Scénario principal

1. L'observateur demande l'ajout d'un nouvel engin à la marée (bouton + à gauche dans le bandeau horizontal)
2. Une fenêtre s'ouvre ("Nouvel engin")
   * Les engins appartenant à la stratégie sélectionnée apparaissent dans une liste déroulante
3. L'observateur peut sélectionner un engin dans la liste
   * L'engin sélectionné est affiché avec son code et son libellé 
   * Les caractéristiques de l'engin sélectionné s'affichent, permettant une saisie par l'opérateur
     * Les caractéristiques (PSFM à saisir) sont propre à l'engin sélectionné (suivant la stratégie sélectionnée ?)
   * Les caractéristiques de l'engin sélectionné s'affichent, permettant une saisie par l'opérateur

---

Variante 3a - Saisie des caractéristiques d'un engin - Exemple avec un engin de type "Filet" 

![ui-gear](/projects/obsmer/spe/images/gear.svg)



4. Dans le cas d'une création d'un nouvel engin, l'observateur à la possibilité de charger les caractéristiques engin d’un navire déjà
   observé. TO COMPLETE

> - [ ] ~~Optimiser le chargement de la stratégie~~
> - [ ] Conserver uniquement les colonnes PSFM ayant une valeur
> - [ ] Libellé d'engin ?

---
## Opération > Détails

![ui-operation](/projects/obsmer/spe/images/operation.svg)

Opération : Opération de pêche qui consiste à la mise en oeuvre d’un engin de pêche pour capturer des espèces aquatiques marines. L’opération débute quand l’engin est mis à l’eau et qu’il est pêchant, elle se termine quand l’engin est récupéré par le professionnel et que l’engin n’est plus pêchant.

#### Scénario principal

1. L'observateur demande la création d'une nouvelle opération : TO COMPLETE

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
## Mesures individuelles

(en cours de rédaction)

![batch-species](/projects/apase/spe/images/individual-measure.svg)

> Règle(s) métier :
> - Saisie au 1 cm, 0.5cm, 1mm, suivant l'espèce (cf normes Ifremer)

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
## Validation des données

- Faciliter le travail des validateurs
- Filtres :
  - Critère PSFM (ex: programme de rattachement sur ObsMer)
  - Pouvoir enregistrer des filtres ?

---
## Référentiels

(en cours de rédaction)

- Ajouter la régionalisation des espèces/engins (Outre-mer)

---
## Historique

|       Date | Sections mises à jour                                                                         |
|-----------:|-----------------------------------------------------------------------------------------------|
| 11/09/2023 | Création                                                                                      |
| 10/11/2023 | Ajout écrans Marée, Engins et OP                                                              |

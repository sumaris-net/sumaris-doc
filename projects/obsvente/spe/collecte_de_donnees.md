# Collecte de données
## Spécifications (ObsVente)
---

## Sommaire

- [Sortie en criée](#/1/4)
  - [Échantillonnages](#/1/5)
- [Lots epsèces](#/1/6)
  - [Mesures individuelles](#/1/9)
- Référentiels
- Historique

---

## Documents

- [Formulaire terrain OBSVENTE](/projects/obsvente/doc/Formulaire_terrain_OBSVENTES_V1-2023_Nouveau-marché.pdf) (v1 2023)

---

## Lignes de plan

- Fichier CSV importé dans WAO ObsVente
- Possibilité de modifier/supprimer une ligne
- TODO : Mapping modèle WAO / 

> Code source : https://gitlab.ifremer.fr/sih/WAO

---
## Sorties

**REF: OBSVENTE/SORTIES**

![ui-obsvente](/projects/obsvente/spe/images/obsvente-table.svg)

#### Scénario principal

1. L'observateur sélectionne le menu "Sorties" dans l'interface de l'arbre du menu
2. L'écran "Sorties" s'ouvre. Les informations suivantes sont affichées pour chaque sortie :
   * L'état de saisie de la sortie :
     * "En cours de saisie" : _réprésenté par une icône :pencil2: dans la cellule_
     * "Terminé" : _réprésenté par une icône :heavy_check_mark: dans la cellule_
     * "Qualifié" : _réprésenté par une icône :checkered_flag: dans la cellule_
   * Le lieu
   * La date
   * Le ou les observateurs
   * Le saisisseur
   * Le commentaire

**Variante(s) :**

**Variante 1a :** L'observateur filtre les sorties (REF: OBSVENTE/FILTERS)

**Variante 1b :** L'observateur crée une nouvelle sortie (REF: OBSVENTE/GENERAL)

**Variante 1c :** L'observateur consulte une sortie existante

**Variante 1d :** L'observateur supprime une sortie existante

---
## Sorties > Filtres

**REF: OBSVENTE/SORTIES/FILTERS**

![ui-obsvente](/projects/obsvente/spe/images/obsvente-table-filters.svg)

Les filtres des sorties sont accessibles depuis le tableau de consultation des sorties via l'icône entonnoir.

#### Scénario principal

1. L'observateur filtre les sorties (REF: COMMUN/FILTRES). Les critères suivants sont disponibles :
   * Le programme de collecte
   * L'état
   * Le lieu
   * La début de la période
   * La fin de la période
   * L'organisme du saisisseur
   * Le saisisseur
   * L'observateur

---

## Sortie > Détails

**REF: OBSVENTE/SORTIE/DETAILS**

![ui-observed-location](/projects/obsvente/spe/images/observed-location-new.svg)

> Lignes de plan avec statut "programmée" doivent être importée (depuis WAO).
> Avec la liste des espèces prioritaires à échantillonner.

La création d'une sortie est accessible depuis le tableau de consultation des sorties via l'icône <&plus>

#### Scénario principal

1. L'observateur demande la création d'une nouvelle sortie
2. L'écran "Nouvelle sortie" s'ouvre. Il est composé de 2 onglets :
   * "Détails"
   * "Echantillonnages"
3. Dans l'onglet "Détails", l'observateur sélectionne :
   * La référence au plan. Le programme de rattachement et la liste des espèces à observer (onglet "Echantillonnages") sont automatiquement renseigné via l'API Allegro-WAO en fonction de la référence au plan sélectionnée
   * Le ou les observateurs. L'observateur est automatiquement renseigné avec le saisisseur
   * Le lieu
   * La date. La stratégie est automatiquement renseigné et les caractéristiques de la vente s'affichent
   * Le type de vente
4. L'observateur renseigne les caractéristiques de la vente

#### Détails techniques :
  * Type de vente : SALE_TYPE
  * Caractéristiques de la vente : 
    * Origine : PMFM_STRATGY avec :
      * STRATEGY.PROGRAM_FK "SIH-OBSVENTE"
      * APPLIED_PERIOD.START_DATE <= date de vente < APPLIED_PERIOD.END_DATE + 1 où APPLIED_PERIOD.APPLIED_STRATEGY_FK = APPLIED_STRATEGY.ID
      * PMFM_STRATGY.ACQUISITION_LEVEL_FK = SALE_SURVEY ou OBSERVED_SALE
    * Caractère obligatoire : PMFM_STRATGY.IS_MANDATORY
    * Ordre d'affichage : PMFM_STRATGY : RANK_ORDER

> Questions :
> - Ajouter les champs : date et heure d'arrivée de l'obs, date et heure de départ de l'obs, type de sortie, disponibilité de la fichie pré-vente ?
> - Caractéristiques : Autoriser l'ajout de caractéristiques ? 
> - Programme de rattachement : Information doublonnée (SAMPLING_SCHEME + SALE_MEASUREMENT) pour la stratégie depuis 2017 ?
> - Liste d'espèces à observer : déjà présente dans l'API Allegro-WAO ?

---

### Sortie > Échantillonnages

**REF: OBSVENTE/SORTIE/ECH**

![ui-landings](/projects/obsvente/spe/images/landings-table.svg)

#### Scénario principal

1. Dans l'onglet "Echantillonnages", l'observateur consulte la liste des espèces à observer
2. Pour chaque espèce observée, l'observateur :
   * Coche la case 
   * Indique le navire* associée
   * Saisit un commentaire
3. Pour chaque espèce non observée, l'observateur saisit un commentaire*
4. L'observateur enregistre la sortie
5. Le bandeau de l'écran affiche "Lieu - date"
6. L'encart sur le saisisseur s'affiche


---

## Lots espèces (1/3)

- Lots espèces: 
  - espèce commerciale
  - catégorie commerciale, présentation, état
  - Poids de la caisse, puis poids échantillonné
  > Cas des mélanges ? (ex: baudroie blanche/noire)
  > Pas de sous-échantillonnage ?
- Mesures individuelles :
  - espèce scientifique 
  - sexe, longueur 
  - 30 individus
  
---

## Lots espèces (2/3)

- Mesures individuelles :
  - Connectivité à la règle **Gwaleen** 
    - Mode bureau (USB ?) 
  - Caisse de **mélange**: possible au sein d'un même espèce commerciale :  
    Dans ce cas, il faut pouvoir choisir une espèce scientifique en dehors de l'espère commerciale  
    (**non prioritaire**)

---

## Lots espèces (3/3)

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
## Référentiels

(en cours de rédaction)

---
## Historique

|       Date | Sections mises à jour                                                                 |
|-----------:|---------------------------------------------------------------------------------------|
| 11/09/2023 | Création                                                                              |
| 10/11/2023 | Ajout écrans Marée, Engins et OP                                                      |
| 14/12/2023 | Tableau des échantillonnages : distinction colonnes espèce commerciale/scientifique   |
